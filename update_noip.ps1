# No-IP account credentials
$Username = "xxxx"
$Password = 'xxxxx'
$Hostname = "xxxxxx"

# Get current public IP
$PublicIP = Invoke-RestMethod -Uri "https://ipv4.icanhazip.com" -UseBasicParsing
$PublicIP = $PublicIP.Trim()

# Construct No-IP update URL
$UpdateURL = "http://$Username`:$Password@dynupdate.no-ip.com/nic/update?hostname=$Hostname&myip=$PublicIP"

# Optional: Base64-encode credentials for logging or debugging
$Auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$Username`:$Password"))

# Define custom User-Agent string
$UserAgent = "YourCompany DDNS-Updater/1.0 (maintainer-contact@example.com)"

# Send HTTP GET request
Write-Host "Updating No-IP DDNS for $Hostname with IP $PublicIP"
try {
    $response = Invoke-WebRequest -Uri $UpdateURL -Headers @{ "User-Agent" = $UserAgent } -Method Get -UseBasicParsing
    Write-Host "Response: $($response.Content)"
} catch {
    Write-Error "Failed to update No-IP DDNS: $_"
}
