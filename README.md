## Project Assumptions/Improvements

- **Image Links**: Please note that the image links provided in the API might not be functional. As a temporary workaround, a my Facebook profile image URL is being used for the "List View" screen, and Google Images are being used for the details page. You can find the image URLs in the code (commented) where they are being used.

- **Facebook Login**: The Facebook login feature is currently set up to work only for the project owner, as the project is not live. If you intend to make the project live, will need to submit the app to Facebook for review. While attempting to test with test projects, it's important to note that Facebook may currently not allow adding testers for these test projects.

- **Login Screen**: The login button on the login screen navigates to the "List View" screen. In case the Facebook login is not functional, dummy data will be displayed. However, on the project owner's side, Facebook login is operational, fetching Facebook profile details at that time.

- **Splash Screen**: A splash screen has been added to enhance the app's user experience during startup.

## Getting Started

### Prerequisites

- Flutter version: Flutter 3.10.6 • channel stable

### Installation

1. Download and unzip the zip folder.
2. Open the project in your preferred Flutter development environment.

### Install Dependencies

Run the following command to fetch the project's dependencies and install the required packages:

```bash
flutter pub get
```

### Running the App

Connect an Android/iOS device or start an emulator/simulator. Then, use the following command to run the app:

```bash
flutter run
```