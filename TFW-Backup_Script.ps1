# Function to check and prompt for execution policy adjustment
function Check-ExecutionPolicy {
    $currentPolicy = Get-ExecutionPolicy -Scope Process

    # Allowed policies for this script
    $allowedPolicies = @("RemoteSigned", "Unrestricted", "Bypass")

    if ($allowedPolicies -notcontains $currentPolicy) {
        Write-Host "[!] The current execution policy is '$currentPolicy'." -ForegroundColor Yellow
        Write-Host "[!] This script requires at least 'RemoteSigned' to run." -ForegroundColor Yellow
        $confirm = Read-Host "[!] Do you want to temporarily set the execution policy to 'Bypass'? (Y/N)"
        
        if ($confirm -eq "Y" -or $confirm -eq "y") {
            Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
            Write-Host "[+] Execution policy temporarily set to 'Bypass'." -ForegroundColor Green
        } else {
            Write-Host "[!] Script cannot run without adjusting the execution policy. Exiting." -ForegroundColor Red
            Exit
        }
    } else {
        Write-Host "[+] Execution policy is sufficient. Proceeding with the script..." -ForegroundColor Green
    }
}

# Check execution policy
Check-ExecutionPolicy

# Get the current user's profile directory
$userProfile = $env:USERPROFILE

# Define the source folder dynamically
$sourceFolder = Join-Path -Path $userProfile -ChildPath "AppData\Local\ForeverWinter\Saved"
Write-Host "[*] Source folder set to: $sourceFolder" -ForegroundColor Cyan

# Define the backup destination folder
$backupFolder = "C:\TFW-Backup"
Write-Host "[*] Backup folder set to: $backupFolder" -ForegroundColor Cyan

# Ensure the backup folder exists
Write-Host "[!] Checking if the backup folder exists..." -ForegroundColor Yellow
if (!(Test-Path -Path $backupFolder)) {
    Write-Host "[!] Backup folder not found. Creating it..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $backupFolder | Out-Null
    Write-Host "[+] Backup folder created successfully." -ForegroundColor Green
} else {
    Write-Host "[+] Backup folder already exists." -ForegroundColor Green
}

# Generate a timestamped backup filename
Write-Host "[!] Generating a timestamped backup filename..." -ForegroundColor Yellow
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$zipFileName = "TFW-Backup-$date.zip"
$zipFilePath = Join-Path -Path $backupFolder -ChildPath $zipFileName
Write-Host "[*] Backup filename: $zipFileName" -ForegroundColor Cyan

# Compress the save folder into a .zip file
Write-Host "[!] Compressing the save folder into a .zip file..." -ForegroundColor Yellow
Compress-Archive -Path $sourceFolder -DestinationPath $zipFilePath -Force
Write-Host "[+] Compression completed successfully!" -ForegroundColor Green

# Output a success message
Write-Host "[+] Backup completed successfully!" -ForegroundColor Green
Write-Host "[*] File saved to: $zipFilePath" -ForegroundColor Cyan