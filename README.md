# Volleyball Match Predictor Frontend

This repository contains the frontend for the **Volleyball Match Predictor** app. The frontend is a key component of the full application, providing a user-friendly interface for selecting teams and viewing match predictions.

The **backend** of the application, built using FastAPI, processes the predictions and communicates with this frontend via RESTful APIs. For more details about the backend, visit the [Volleyball Match Predictor Backend Repository](https://github.com/GustavoBelaunde2004/volleyball-predictor-backend).

## About the Full Application

The **Volleyball Match Predictor** app consists of two parts:
1. **Frontend** (this repository): A Flutter-based mobile application for users to interact with the app.
2. **Backend**: Handles data processing, prediction logic, and API endpoints. The backend is available [here](https://github.com/GustavoBelaunde2004/volleyball-predictor-backend).

Together, these components create an end-to-end system for predicting volleyball match outcomes with accuracy and ease of use.

## Features

- Cross-platform support:
  - Android, iOS, Web, and Desktop (Linux, macOS, Windows).
- User-friendly interface for team selection.
- Displays predictions, including:
  - Match winner.
  - Number of sets won by each team.
  - Individual set scores.
- Integrates seamlessly with the FastAPI backend.

## Repository Structure

```plaintext
volleyball-predictor-frontend/
│
├── .vscode/                 # VSCode project settings
├── android/                 # Android-specific files
├── ios/                     # iOS-specific files
├── lib/                     # Core Flutter source code
│   ├── main.dart            # Entry point of the Flutter app
│   ├── screens/             # Screens for different app views
│   ├── widgets/             # Reusable UI components
│   └── ...                  # Other Flutter files
├── linux/                   # Linux-specific files
├── macos/                   # macOS-specific files
├── test/                    # Testing files
├── web/                     # Web-specific files
├── windows/                 # Windows-specific files
├── .gitignore               # Ignored files and folders
├── .metadata                # Flutter metadata
├── analysis_options.yaml    # Linting rules
├── pubspec.lock             # Locked Flutter dependencies
├── pubspec.yaml             # Flutter dependencies and metadata
└── README.md                # Project documentation
```

## Tech Stack
- Language: Dart
- Framework: Flutter
- Platforms:
  - Mobile: Android and iOS
  - Web: Browser support
  - Desktop: Linux, macOS, and Windows
- Backend Integration:
  - Communicates with the FastAPI backend via RESTful APIs.

## Installation
Clone the Repository:

```plaintext
git clone https://github.com/yourusername/volleyball-predictor-frontend.git
cd volleyball-predictor-frontend
```
Install Flutter Dependencies:

```plaintext
flutter pub get
```

## Usage
Run the App:

```plaintext
flutter run
```

Supported Platforms:

- Android Emulator
- iOS Simulator (requires a Mac with Xcode)
- Web Browser
- Desktop Devices (Linux, macOS, Windows)

## Future Enhancements
- Enhanced Stats Page:
  - Show match history and additional analytics.
- Dark Mode:
  - Add a toggle for light and dark themes.
- Push Notifications:
  - Notify users about upcoming matches or predictions.

## Contributing
We welcome contributions! Please follow these steps:

1) Fork the repository
2) Create a feature branch:
```plaintext
git checkout -b feature/your-feature-name
```
3) Commit your changes:
```plaintext
git commit -m "Add your message here"
```
4) Push to the branch:
```plaintext
git push origin feature/your-feature-name
```
5) Open a pull request on GitHub!
