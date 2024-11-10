# Volleyball Match Predictor Frontend

This repository contains the frontend for the **Volleyball Match Predictor** app. The frontend is built using Flutter and provides a user-friendly interface for selecting teams and viewing match predictions.

The **backend**, built with FastAPI, processes predictions and communicates with this frontend via RESTful APIs. For more details about the backend, visit the [Volleyball Match Predictor Backend Repository](https://github.com/GustavoBelaunde2004/volleyball-predictor-backend).

## About the Full Application

The **Volleyball Match Predictor** app consists of two parts:
1. **Frontend** (this repository): A Flutter-based mobile application for users to interact with the app.
2. **Backend**: Handles data processing, prediction logic, and API endpoints. The backend is available [here](https://github.com/GustavoBelaunde2004/volleyball-predictor-backend).

Together, these components create an end-to-end system for predicting volleyball match outcomes with accuracy and ease of use.

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

