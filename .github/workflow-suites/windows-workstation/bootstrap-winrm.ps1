$ErrorActionPreference = "Stop"

Enable-PSRemoting -Force

winrm quickconfig -quiet

$cert = New-SelfSignedCertificate -DnsName $env:COMPUTERNAME -CertStoreLocation Cert:\LocalMachine\My
$thumb = $cert.Thumbprint

# Remove any existing HTTPS listeners first for idempotency.
$httpsListeners = winrm enumerate winrm/config/listener | Select-String "Transport = HTTPS" -Quiet
if ($httpsListeners) {
  winrm delete winrm/config/listener?Address=*+Transport=HTTPS | Out-Null
}

winrm create winrm/config/Listener?Address=*+Transport=HTTPS "@{Hostname=\"$env:COMPUTERNAME\";CertificateThumbprint=\"$thumb\"}" | Out-Null

winrm set winrm/config/service "@{AllowUnencrypted=\"false\"}" | Out-Null
winrm set winrm/config/service/auth "@{Basic=\"false\";Kerberos=\"true\";Negotiate=\"true\";Certificate=\"false\";CredSSP=\"false\"}" | Out-Null
winrm set winrm/config/client/auth "@{Basic=\"false\";Kerberos=\"true\";Negotiate=\"true\";Digest=\"false\"}" | Out-Null

if (-not (Get-NetFirewallRule -DisplayName "Allow WinRM HTTPS 5986" -ErrorAction SilentlyContinue)) {
  New-NetFirewallRule -DisplayName "Allow WinRM HTTPS 5986" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5986 | Out-Null
}

Restart-Service WinRM
