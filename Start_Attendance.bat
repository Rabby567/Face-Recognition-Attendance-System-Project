@echo off
title Face Recognition Attendance System - SECURE VERSION
color 0A

:menu
cls
echo ============================================================
echo   Face Recognition Attendance System - SECURE VERSION
echo ============================================================
echo.
echo   Default Login Credentials (First Time Only):
echo   ================================================
echo   Username: admin
echo   Password: admin
echo   ================================================
echo.
echo   IMPORTANT: Change these credentials after first login!
echo.
echo ============================================================
echo.
echo   1. Start Attendance System
echo   2. Reset to Default Admin (Password Recovery)
echo   3. View System Info
echo   4. Exit
echo.
echo ============================================================
echo.
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto start
if "%choice%"=="2" goto reset
if "%choice%"=="3" goto info
if "%choice%"=="4" goto exit
echo Invalid choice. Please try again.
timeout /t 2 /nobreak >nul
goto menu

:start
cls
echo ============================================================
echo   Starting Attendance System...
echo ============================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo.
    echo Please install Python from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation
    echo.
    pause
    goto menu
)

echo [OK] Python detected

REM Check if app.py exists
if not exist "app.py" (
    echo ERROR: app.py not found in current directory
    echo.
    echo Current directory: %CD%
    echo.
    pause
    goto menu
)

echo [OK] app.py found

REM Check if templates folder exists
if not exist "templates" (
    echo ERROR: templates folder not found
    echo Please ensure templates/dashboard.html and templates/login.html exist
    echo.
    pause
    goto menu
)

echo [OK] templates folder found

REM Open browser after 3 seconds in background
echo.
echo Opening browser in 3 seconds...
start /B cmd /c "timeout /t 3 /nobreak >nul && start http://localhost:5000"

REM Start Flask server
echo.
echo ============================================================
echo   SERVER STARTING...
echo ============================================================
echo.
echo   Login at: http://localhost:5000
echo.
echo   Default Credentials (if not changed):
echo   Username: admin
echo   Password: admin
echo.
echo   Operating Hours: Configurable in Settings
echo   Default: 07:00 AM - 06:00 PM
echo.
echo ============================================================
echo   KEEP THIS WINDOW OPEN WHILE USING THE SYSTEM
echo   Press Ctrl+C to stop the server
echo ============================================================
echo.

python app.py

echo.
echo Server stopped.
pause
goto menu

:reset
cls
echo ============================================================
echo   RESET TO DEFAULT ADMIN CREDENTIALS
echo ============================================================
echo.
echo   This will reset your admin login to:
echo   Username: admin
echo   Password: admin
echo.
echo   WARNING: This is a security-sensitive operation!
echo.
echo   WHAT WILL HAPPEN:
echo   [X] Admin username/password will be reset
echo   [X] Custom admin settings will be removed
echo.
echo   WHAT WILL BE PRESERVED:
echo   [OK] All employee records
echo   [OK] All attendance records
echo   [OK] All photos
echo   [OK] All attendance Excel files
echo   [OK] System settings (late time, operating hours)
echo.
echo ============================================================
echo.
set /p confirm="Are you absolutely sure? Type YES to confirm: "

if /i "%confirm%"=="YES" (
    echo.
    echo Resetting admin credentials...
    
    REM Delete admin-related files only
    if exist "admin.pkl" (
        del /f /q "admin.pkl"
        echo [OK] Admin credentials file deleted
    )
    
    if exist "reset_codes.pkl" (
        del /f /q "reset_codes.pkl"
        echo [OK] Reset codes file deleted
    )
    
    echo.
    echo ============================================================
    echo   RESET COMPLETE!
    echo ============================================================
    echo.
    echo   You can now login with default credentials:
    echo   Username: admin
    echo   Password: admin
    echo.
    echo   NEXT STEPS:
    echo   1. Start the system (Option 1)
    echo   2. Login with admin/admin
    echo   3. Go to Settings
    echo   4. Change your admin credentials immediately!
    echo.
    echo ============================================================
    echo.
) else (
    echo.
    echo Reset cancelled. No changes were made.
    echo.
)

pause
goto menu

:info
cls
echo ============================================================
echo   SYSTEM INFORMATION
echo ============================================================
echo.
echo   Application: Face Recognition Attendance System
echo   Version: 2.0 (Secure Edition)
echo   Security: Admin Authentication Required
echo.
echo ============================================================
echo   DEFAULT CREDENTIALS
echo ============================================================
echo   Username: admin
echo   Password: admin
echo   (Only works if not changed)
echo.
echo ============================================================
echo   FEATURES
echo ============================================================
echo   [*] Admin Login System
echo   [*] Customizable Admin Credentials
echo   [*] Email Verification for Admin Changes
echo   [*] Password Reset (Web + Batch File)
echo   [*] Operating Hours Configuration
echo   [*] Late Arrival Tracking
echo   [*] Face Recognition Attendance
echo   [*] Employee Registration
echo   [*] Excel Reports Generation
echo   [*] CSV Export (Day/Month/Year)
echo   [*] Real-time Statistics Dashboard
echo.
echo ============================================================
echo   FILE STRUCTURE
echo ============================================================
echo   app.py                - Main application
echo   templates/            - Web interface files
echo     - login.html        - Login page
echo     - dashboard.html    - Main dashboard
echo   photos/               - Employee photos
echo   attendance/           - Attendance Excel files
echo   registration.csv      - Employee database
echo   settings.pkl          - System settings
echo   admin.pkl             - Admin credentials (if changed)
echo.
echo ============================================================
echo   DATA SAFETY
echo ============================================================
echo   All employee data, photos, and attendance records
echo   are preserved even when resetting admin credentials.
echo.
echo   Only admin username/password are affected by reset.
echo.
echo ============================================================
echo   SECURITY RECOMMENDATIONS
echo ============================================================
echo   1. Change default credentials immediately
echo   2. Use a strong password (8+ characters)
echo   3. Use a real email for password recovery
echo   4. Never share admin credentials
echo   5. Logout when finished
echo   6. Keep this batch file secure
echo.
echo ============================================================
echo   SUPPORT
echo ============================================================
echo   If you need help:
echo   - Check the complete setup guide
echo   - Verify Python is installed correctly
echo   - Ensure all files are in place
echo   - Check firewall settings for port 5000
echo.
echo ============================================================
echo.
pause
goto menu

:exit
cls
echo.
echo ============================================================
echo   Thank you for using Face Recognition Attendance System!
echo ============================================================
echo.
echo   Remember to:
echo   - Backup your data regularly
echo   - Keep admin credentials secure
echo   - Update employee photos annually
echo.
echo   Stay secure! 🔐
echo.
echo ============================================================
echo.
timeout /t 3 /nobreak >nul
exit

pause