# Wine Installation Guide for macOS

This guide helps you install Wine on macOS and run a Windows application using Wine.

## Installation Steps

1. **Open Terminal**
   - Press `Command + Space`, type `Terminal`, and press `Enter`.

2. **Run the Installation Script**
   - Copy and paste the following command into the Terminal and press `Enter`:
     ```bash
     curl -fsSL "https://raw.githubusercontent.com/Visdwiz/mac-wine-installer/main/install_wine.sh" | bash
     ```
   - This script will:
     - Install Homebrew (if not installed)
     - Install Wine
     - Install Rosetta (for Apple Silicon Macs)

3. **Verify Installation**
   - After the script completes, check if Wine is installed:
     ```bash
     wine --version
     ```
   - You should see a version number printed in the terminal.

## Running a Windows Application

1. **Download the Windows `.exe` file**
   - Place the `.exe` file in a convenient location, e.g., `~/Downloads`.

2. **Run the Installer with Wine**
   - In Terminal, navigate to the directory where the installer `.exe` file is located:
     ```bash
     cd ~/Downloads
     ```
   - Run the installer using Wine:
     ```bash
     wine setup.exe
     ```
   - Replace `setup.exe` with the actual installer filename.

3. **Locate and Run the Installed Application**
   - After installation, the application will typically be installed in `C:/Program Files` or `C:/Program Files (x86)`.
   - To find the installed application, open Terminal and run:
     ```bash
     wine explorer
     ```
   - Use the file explorer to navigate to `C:/Program Files` and locate the application.
   - Alternatively, use this command to check for installed applications:
     ```bash
     ls ~/.wine/drive_c/Program\ Files/
     ```
   - Once you find the application’s `.exe` file, run it using:
     ```bash
     wine "C:\\Program Files\\AppFolder\\application.exe"
     ```
     *(Replace `AppFolder` and `application.exe` with the actual folder and file names.)*

## Troubleshooting
- If you see an error about missing dependencies, try restarting the terminal and running the script again.
- If Wine doesn’t run properly, ensure you are using the latest version by running:
  ```bash
  brew upgrade wine-stable
  ```

Enjoy running Windows applications on macOS! 🚀

