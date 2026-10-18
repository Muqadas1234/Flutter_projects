# StudyNest 📚 — Assignment 1

Welcome to **StudyNest**! This repository contains my submission for **Assignment 1** as part of the DSTP Training Program.

> ℹ️ **Project Note:**  
> This project is primarily a **UI implementation** with some essential interactive functionality (such as adding dynamic study sessions, date & time pickers, and navigation). It is **not** a full-scale or backend-connected production application, but rather focused on translating UI/UX designs into clean, responsive Flutter code.

---

## 🎨 Figma Design Reference

The design for this app was carefully followed from this Figma board:
- 🔗 **Figma Design Link:** [DSTP StudyNest Design](https://www.figma.com/design/F8FqJ5cbcCDzD6poRPG2pI/DSTP-Quiz3?node-id=2205-6&t=PvFaPr64mYudeinc-0)

I worked to match the layout, typography, colors, and overall visual feel closely to the Figma specifications.

---

## ✨ Features & What's Implemented

### 1. 🔐 Authentication Screens
- **Login Screen:** Clean input fields for email and password, social login styling, and navigation to Sign Up.
- **Sign Up Screen:** Account creation interface styled with custom reusable fields and buttons.

### 2. 🏠 Main Experience & Navigation
- **Bottom Navigation Bar:** Smooth switching between the Home dashboard and the Profile screen.
- **Home Dashboard:** Displays upcoming/recent study sessions with tags, duration, and status indicators.
- **Profile Screen:** User profile overview with study stats and account settings layout.

### 3. ➕ Interactive "Add Session" Modal Bottom Sheet
- Tap on the floating action button to open a custom bottom sheet matching the Figma design.
- Input fields for session **Title** and **Description**.
- **Date Picker Dialog:** Select the date for your study session.
- **Time Picker:** Choose the exact time for the session.
- **Dynamic List Update:** Submitting the session appends it directly to the study session list on the Home screen in real time!

### 4. 🧩 Reusable & Modular Components
- `CustomButton`: Consistent, reusable rounded button widget with customizable text and actions.
- `CustomTextField`: Reusable styled input fields.
- `CustomHeader`: Consistent screen headers and branding.
- Organized folder structure separating models, utils, custom components, and screens.

---

## 🛠️ Tech Stack & Packages

- **Framework:** [Flutter](https://flutter.dev/) (Dart)
- **Design System:** Material Design 3 (customized via Figma palette)
- **Packages used:**
  - `google_fonts` — Clean typography matching the design.
  - `flutter_svg` — Vector icons rendering.
  - `intl` — Date & time formatting.
  - `cupertino_icons` — Icon assets.

---

## 🚀 Getting Started & How to Run

To run this project locally on your machine:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/studynest.git
   ```

2. **Navigate to the project folder:**
   ```bash
   cd studynest
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```
   *(You can run it on Chrome/Web, Android Emulator, or an iOS Simulator/physical device).*

---

## 📂 Project Structure

```text
lib/
├── Model/
│   └── studynest_model.dart        # Data model for study sessions
├── utils/
│   ├── app_assets.dart             # Asset paths (images/icons)
│   ├── app_colors.dart             # App color palette from Figma
│   └── global.dart                 # Shared in-memory list of sessions
├── view/
│   ├── components/                 # Reusable UI widgets (buttons, fields, header)
│   └── screens/
│       ├── auth/                   # Login & Sign Up screens
│       └── main_screen/            # Bottom Nav, Home, and Profile screens
└── main.dart                       # App entry point
```

---

## 👤 Author

Developed by **Muqaddas** as part of the **DSTP Training Program (Assignment 1)**.  
Feedback and suggestions are always welcome!
