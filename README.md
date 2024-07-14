# Media Coverage App 
# AppName: SpiritualTeacher

## Overview

The Media Coverage App(SpiritualTeacher) is a Swift-based native iOS application designed to display a grid of media coverage images(of "Acharya Prashanth" Garu) fetched from a remote API. 
The app features asynchronous image loading, caching mechanisms, and graceful error handling, and adheres to SOLID principles for robust and maintainable code.

## Screenshots in the flow of expected/run/play with App

Step1: (Guest will Click on App - "SpiritualTeacher")

![AppName](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/d50adb34-654a-459b-9a8f-94b859a14dd1)

Step2: (Guest will land on Landing Page where Thumbnail starts loading by itself)

![LandingPage](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/e3a18ff6-3eed-4815-a100-6c1ebef400f9)

Step 3: (The guest can scroll up very fast to check if the screen is hanging while loading images or images are nicely loading..)

![Scrollup1](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/1c2ab194-8fb6-4d0d-84fa-74ec41eb9827)

Step 4: (The guest can scroll up or down to check if the screen is hanging or loading the image nicely..)

![Scrollup2](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/aeb945b0-086f-4207-bb38-1b452091cc9a)

Note: The following steps are Additional/Bonus Implementation(which is not necessary as per the requirement), but implemented to have a full-fledged app look and feel.
Step5: (The guest can tap on the Meditation icon which is in the right top corner of the "AchayraPrashant" image on the landing page

![TapOnMeditationIcon](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/88b7ca15-b89a-4220-9bd0-8956af625162)

Step 6: (Once the user taps on MeditaionIcon, the app will open a web view, which will show a loading indicator in a couple of seconds to load the website of "AcharyaPrashath".

![WebPageLoading](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/f99683b7-b03d-4dee-874d-24b62a9ee4fc)

Step7: (Once the user taps on MeditaionIcon, the app will open a webView, which will show a loading indicator as its a couple of seconds to load the website of "AcharyaPrashath".

![WebPageOpened](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/711dbd1f-0754-46bb-9387-cf394cdc288f)

Step 8: (Guest can go back to the landing page and tap on Thumbnails to see how it will load on the detail page, here we are passing the data nicely to the detail screen.

![TapOnThumbnail3](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/40ec1842-f4f4-4226-bc57-e1dce069de7e)
![TaponThumbnail2](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/d64c95e7-9d7d-483e-b307-84d4bf015e76)
![TapOnThumbnail1](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/337d6b29-4c9e-4426-9895-aa8c13492f6d)



## Architecture Details

The architecture of the Media Coverage App follows a Model-View-ViewModel (MVVM) design pattern. It consists of the following components:

1. **Model:** Represents the data entities and business logic. Includes the `MediaCoverage` entity and associated networking and caching services.
2. **View:** Displays the user interface elements. Includes views such as `MediaCoverageListView` and `MediaCoverageView`.
3. **ViewModel:** Acts as an intermediary between the view and model layers. Includes the `MediaCoverageViewModel` class responsible for fetching and managing media coverages.

## Sequence Diagram

The Sequence diagram illustrates the communication flow between components in the Media Coverage App.


![MediaCoverage_AcharyaPrashanth_SequenceDiagram](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/0789d591-2a98-4c3b-9dfb-1e994686d82d)



## Technologies and Frameworks

- Swift
- UIKit
- URLSession
- NSCache
- FileManager

## SOLID Principles

The Media Coverage App adheres to the SOLID principles as follows:

- **Single Responsibility Principle (SRP):** Each class or component has a single responsibility, such as fetching data, displaying views, or managing caching.
Ex: Views
- **Open/Closed Principle (OCP):** The app is open for extension but closed for modification, allowing new features to be added without altering existing code.
Ex: Entity Class
- **Liskov Substitution Principle (LSP):** The use of protocols and abstractions enables the substitution of different implementations without affecting the behavior of the system.
Ex: Created Protocols which can be used for future
- **Interface Segregation Principle (ISP):** Interfaces are kept small and focused, avoiding unnecessary dependencies and promoting decoupling between components.
Ex: Yes, Created Protocols as small as possible, so that they can utilized by many other classes in the future 
- **Dependency Inversion Principle (DIP):** High-level modules (e.g., view models) depend on abstractions (protocols), not concrete implementations, facilitating easier testing and maintenance.
Ex: Yes, VM follows clear DIP principles and also protocols to make sure, they did not provide any improvement, it just abstrations. 

## How to Use

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on a simulator or device.
4. Follow the screenshot sequence to experience the app. 

## Credits

- Developed by ArepuPavanKumar
- Contact: 
Mail: iOSDeveloper.ipa@gmail.com
Whatsapp: +91 8121 04 03 08
Phone:  +46 76 431 65 99
GithubRepo: https://github.com/pavan-kumar-arepu?tab=repositories
Linkedin: https://www.linkedin.com/in/pavan-kumar-arepu-software-architect-engineer/

*************************************   Transforming Ideas into Impactful Mobile App Solutions *************************************
