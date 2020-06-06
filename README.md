# Collectables

A marketplace to buy and sell collectibles and curios such as coins, stamps, bank notes and much more.

### Application currently in the prototyping and design phase

Prototyping and designing using **Adobe XD Design Toolkit**

## Requirements

### System requirements
To install and run Flutter, your development environment must meet these minimum requirements:

**Operating Systems**: Windows 7 SP1 or later (64-bit)

**Disk Space**: 400 MB (does not include disk space for IDE/tools).

**Tools**: Flutter depends on these tools being available in your environment.

**Windows PowerShell 5.0** or newer (this is pre-installed with Windows 10)

**Git for Windows 2.x**, with the Use Git from the Windows Command Prompt option.
If Git for Windows is already installed, make sure you can run git commands from the command prompt or PowerShell.

### Running the Application

#### Set up your Android device

**Android**: Android Jelly Bean, v16, 4.1.x or newer

**iOS**:  iOS 8 or newer

* Enable Developer options and USB debugging on your device. Detailed instructions are available in the Android documentation.

* Windows-only: Install the Google USB Driver.

* Using a USB cable, plug your phone into your computer. If prompted on your device, authorize your computer to access your device.
* In the terminal, run the flutter devices command to verify that Flutter recognizes your connected Android device. By default, Flutter uses the version of the Android SDK where your adb tool is based. If you want Flutter to use a different installation of the Android SDK, you must set the ANDROID_HOME environment variable to that installation directory.

#### Set up the Android emulator

* Enable VM acceleration on your machine.
* Launch Android Studio > Tools > Android > AVD Manager and select Create Virtual Device. (The Android submenu is only present when inside an Android project.)
* Choose a device definition and select Next.
* Select one or more system images for the Android versions you want to emulate, and select Next. An x86 or x86_64 image is recommended.
* Under Emulated Performance, select Hardware - GLES 2.0 to enable hardware acceleration.
* Verify the AVD configuration is correct, and select Finish.
* In Android Virtual Device Manager, click Run in the toolbar. The emulator starts up and displays the default canvas for your selected OS version and device.

#### Web Setup

Run the following commands to use the latest version of the Flutter SDK from the beta channel and enable web support:

`flutter channel beta`
 
`flutter upgrade`
 
`flutter config --enable-web`

Once web is enabled, the flutter devices command outputs a Chrome device that opens the Chrome browser with your app running, and a Web Server that provides the URL serving the app.

To serve your app from localhost in Chrome, enter the following from the top of the package:

`flutter run -d chrome`
