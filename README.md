# Workify

A modern employee management and attendance tracking Flutter application with powerful features for workplace organization. Built with clean architecture principles and modern Flutter practices.

## 🌟 Features

### 👥 Employee Management
- Employee profiles and information management
- Role-based access control
- Team organization and department management
- Employee performance tracking

### ⏰ Attendance System
- Geolocation-based check-in/check-out
- Fingerprint authentication support
- Work hours tracking and overtime calculation
- Leave management system
- Attendance reports and analytics

### 📍 Location Services
- Real-time location tracking
- Geofencing for workplace boundaries
- Google Maps integration
- Address validation and geocoding

### 🔐 Security
- Secure authentication with Firebase
- Biometric authentication support
- Role-based access control
- Data encryption and secure storage

### 💫 User Experience
- Modern and intuitive UI with Quicksand font
- Smooth animations and transitions
- Responsive design for all screen sizes
- Multi-language support
- Dark/Light theme support
- Toast notifications for better feedback

## 🛠️ Tech Stack

### Frontend
- **Framework**: Flutter (SDK ^3.6.0)
- **State Management**: BLoC Pattern (^9.0.0)
- **Navigation**: Go Router (^14.7.2)
- **UI Components**:
  - Flutter SVG (^2.0.17)
  - Cached Network Image (^3.4.1)
  - Shimmer effects (^3.0.0)
  - Table Calendar (^3.1.3)
  - Custom animations

### Backend Services
- **Firebase Suite**:
  - Cloud Firestore (^5.6.5)
  - Firebase Auth (^5.5.1)
  - Firebase Storage (^12.4.4)
  - Firebase Core (^3.12.1)

### Location Services
- Google Maps Flutter (^2.10.1)
- Geolocator (^13.0.2)
- Geocoding (^3.0.0)

### Storage & Utilities
- Shared Preferences (^2.5.1)
- Image Picker (^1.1.2)
- Permission Handler (^11.4.0)
- Easy Localization (^3.0.7+1)

## 📱 Screenshots

[Screenshots will be added here]

## 🚀 Getting Started

### Prerequisites

1. Development Environment:
   - Flutter SDK ^3.6.0
   - Dart SDK ^3.0.0
   - Android Studio / VS Code
   - Git

2. Required Accounts:
   - Firebase project
   - Google Cloud account (for Maps API)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/mahmoudSobhiAwad/workify.git
```

2. Navigate to project directory and install dependencies:
```bash
cd workify
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project
   - Add your `google-services.json` to `android/app/`
   - Enable Authentication, Firestore, and Storage
   - Configure Firebase project settings

4. Set up Google Maps:
   - Get a Google Maps API key
   - Add it to `android/app/src/main/AndroidManifest.xml`
   - Enable necessary APIs in Google Cloud Console

5. Configure environment variables:
   - Create `.env` file based on `.env.example`
   - Add your API keys and configuration

6. Run the app:
```bash
flutter run
```

## 🔑 Environment Setup

### Android Setup
1. Required permissions in AndroidManifest.xml:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<uses-permission android:name="android.permission.CAMERA"/>
```

### Firebase Configuration
1. Enable Authentication methods:
   - Email/Password
   - Biometric authentication
2. Set up Firestore rules
3. Configure Storage rules

## 🎯 Project Architecture

The project follows Clean Architecture principles with a feature-first approach:

```
lib/
├── core/          # Core functionality
├── features/      # Feature modules
└── app.dart       # Application entry
```

## 👥 Contributors

- Mostafa Elzohire
- Mahmoud Sobhy Awad
- Ahmed Emad Mahmoud
- Mohamed Salah
- Shaza Allam

## 📚 Documentation

For detailed technical documentation, please refer to the [Technical Documentation](docs/technical_documentation.md).
