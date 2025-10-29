# Face-Recognition-Attendance-System-Project
This project is an automated attendance system using face recognition and deep learning (face_recognition, DeepFace). It enables real-time, accurate, and duplicate-free attendance with CSV/Excel export. Use without the developer’s permission is strictly prohibited.

📦 COMPLETE SETUP GUIDE - Face Recognition Attendance System
🎯 What You'll Get:

✅ Universal CCTV Support (RTSP, MJPEG, DroidCam, IP Webcam)
✅ Face Recognition Attendance
✅ Admin Dashboard
✅ Employee Registration
✅ Excel & CSV Reports
✅ Secure Login System


📋 STEP 1: Install Python

Download Python:

Go to: https://www.python.org/downloads/
Download Python 3.9 or higher


Install Python:

✅ Check "Add Python to PATH" (VERY IMPORTANT!)
Click "Install Now"


Verify Installation:

bash   python --version
```
   Should show: `Python 3.x.x`

---

## **📋 STEP 2: Create Project Folder**

Create a folder structure like this:
```
Attendance-System/
├── app.py
├── requirements.txt
├── Start_Attendance.bat
└── templates/
    ├── index.html
    ├── login.html
    └── dashboard.html

📋 STEP 3: Create All Files
FILE 1: requirements.txt
Create requirements.txt and paste:
txtFlask==2.3.0
Flask-CORS==4.0.0
opencv-python==4.8.0.74
numpy==1.24.3
openpyxl==3.1.2
Pillow==10.0.0
requests==2.31.0

FILE 2: app.py
Create app.py and paste this COMPLETE CODE.

FILE 3: Start_Attendance.bat
Create Start_Attendance.bat for Windows users.

FILE 4: templates/login.html
Create templates/login.html
Create templates/dashboard.html
Create templates/index.html.

📋 STEP 4: Install Dependencies
Open terminal/command prompt in your project folder:
bash
pip install -r requirements.txt
```

---

## **📋 STEP 5: Run the Application**

**Option A: Using Batch File (Windows)**
```
Double-click Start_Attendance.bat
Option B: Using Command Line
bash
python app.py

📋 STEP 6: Access the System

Open Browser: http://localhost:5000
Login: admin / admin
Change password immediately in Settings!


📱 STEP 7: Setup DroidCam (Optional)

Install DroidCam on Phone (Android/iOS)
Connect to same WiFi as PC
Note IP address from app (e.g., 192.168.0.180)
In Dashboard → Settings:

Camera Name: My DroidCam
URL: http://192.168.0.180:4747/video


Click "Add Camera"
Use in Live Recognition!


✅ COMPLETE! Your System is Ready!
All files are provided above. Copy each file exactly as shown, and you're done! 🎉
