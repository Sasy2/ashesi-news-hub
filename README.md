# Ashesi News Hub 📰

Ashesi News Hub is a mobile application designed to help students stay updated with the latest news around the Ashesi University community. This app allows users to sign up, log in (with email or Google), browse news cards, search for articles, and bookmark posts they like.

## 🚀 Features

- 🔐 User authentication with Firebase (Email + Google Sign-In)
- 📰 Card-style news display
- 🔍 Real-time search functionality
- 📌 Bookmarking system using ViewModel and LiveData
- 🛠️ Modern Android architecture and design
- 💾 Firebase Realtime Database integration

---

## 📦 Installation

> **Before You Begin:**
- Enable **Developer Mode** and **USB Debugging** on your Android device.
- Connect your device to your computer.

### 🖥️ For Windows:
1. Run the `Windows_install_script.bat` file.
2. Follow the on-screen instructions and grant any necessary permissions.

### 🍎🐧 For macOS/Linux:
1. Run `Linux_or_MacOS_install_script.sh` (double-click or run via terminal).
2. The script checks for ADB and installs it if missing.
3. App is installed and launched on your Android device automatically.

> 📎 If the script fails, follow manual steps in [InstallationProcess.txt](InstallationProcess.txt)

---

## 🧠 Architecture

- 📱 Activities: `LoginActivity`, `SignupActivity`, `MainActivity`
- 🧩 Fragments: `HomeFragment`, `SearchFragment`, `BookmarkFragment`
- 🧠 ViewModel: `BookmarkViewModel`
- 🔧 Adapters: `CardStackAdapter`, `BookmarkAdapter`, `CardGridAdapter`
- 📂 Data Model: `Card`, `HelperClass`

See UML and design in [OOP Project Group 11.pdf](OOP%20Project%20Group%2011%20(2).pdf)

---

## 👥 Contributors

- David Dziedzom Amenumey – Frontend & UI Design
- Enyonam Akosua Attipoe – Documentation & Reports
- Nongyin Sayinga Awindor – Backend & Core Functionality
- Agatha Suzie Sieyapnji Youyou – UML, Design Updates

---

## 📜 License

MIT License 
