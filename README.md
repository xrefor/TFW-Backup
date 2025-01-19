# TFW Backup Script

This PowerShell script creates a backup of the save files for "The Forever Winter" game. It compresses the save folder into a `.zip` file and saves it in a specified backup directory with a timestamped filename.

## Files Included
- **TFW-Backup_Script.ps1**: The PowerShell script that performs the backup.
- **Run_TFW_Backup.bat**: A batch file to run the script without needing to manually adjust the execution policy.
- **README.md**: Documentation for understanding and using the script.

---

## Requirements
1. **Windows PowerShell** (version 5.1 or higher).
2. Ensure that PowerShell is allowed to run scripts. If necessary, the script will prompt you to temporarily adjust the execution policy.

---

## How to Use

### 1. Running the Script Directly
- Open PowerShell.
- Navigate to the directory containing the script:
  ```powershell
  cd <directory_path>
  ```
- Run the script:
  ```powershell
  .\TFW-Backup_Script.ps1
  ```
- Follow any prompts during execution.

### 2. Running with the Batch File
- Double-click **Run_TFW_Backup.bat**.
- This will execute the PowerShell script while temporarily bypassing the execution policy.
- Follow the prompts in the terminal window.

---

## What the Script Does
1. **Checks Execution Policy**: Ensures that the script has the necessary permissions to run.
2. **Identifies Save Folder**: Automatically locates the game’s save folder:
   ```
   C:\Users\<Username>\AppData\Local\ForeverWinter\Saved
   ```
3. **Creates Backup Directory**: Ensures that the backup directory exists:
   ```
   C:\TFW-Backup
   ```
4. **Generates a Timestamped Backup**: Compresses the save folder into a `.zip` file named with the current date and time (e.g., `TFW-Backup-2025-01-19_14-30-45.zip`).
5. **Displays Progress**: Outputs status messages for each step.

---

## Example Output
```plaintext
[+] Execution policy is sufficient. Proceeding with the script...
[*] Source folder set to: C:\Users\xrefo\AppData\Local\ForeverWinter\Saved
[*] Backup folder set to: C:\TFW-Backup
[!] Checking if the backup folder exists...
[+] Backup folder already exists.
[!] Generating a timestamped backup filename...
[*] Backup filename: TFW-Backup-2025-01-19_14-30-45.zip
[!] Compressing the save folder into a .zip file...
[+] Compression completed successfully!
[+] Backup completed successfully!
[*] File saved to: C:\TFW-Backup\TFW-Backup-2025-01-19_14-30-45.zip
[!] Press Enter to exit...
```

---

## Troubleshooting
1. **Execution Policy Errors**:
   - If you see the error `Running scripts is disabled on this system`, use the batch file to run the script, or manually adjust the execution policy:
     ```powershell
     Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
     ```

2. **Save Folder Not Found**:
   - Ensure the game has been installed and run at least once to generate the save folder.

3. **Permissions Issues**:
   - Run the script as an administrator if necessary.

---

## Notes
- The backup directory is set to `C:\TFW-Backup`. You can modify the script to change this location if desired.
- This script is intended for local backups only.

---

## License
This script is provided "as-is" without warranty of any kind. Use at your own risk.

