# Media Coverage App 
# AppName: SpiritualTeacher

## Overview

The Media Coverage App(SpiritualTeacher) is a Swift-based native iOS application designed to display a grid of media coverage images fetched from a remote API. 
The app features asynchronous image loading, caching mechanisms, graceful error handling, and adheres to SOLID principles for robust and maintainable code.

## Screenshots in the flow of exuecte/run/play with App

Step1: (Guest will Click on App - "SpiritualTeacher")
![AppName](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/d50adb34-654a-459b-9a8f-94b859a14dd1)

Step2: (Guest will land on Landing Page where Thumbnail start loading by itself)
![LandingPage](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/e3a18ff6-3eed-4815-a100-6c1ebef400f9)

Step4: (Guest can scroll up veryfast to check, if screen is hangging while loading image or image are nicely loading..)
![Scrollup1](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/1c2ab194-8fb6-4d0d-84fa-74ec41eb9827)

Step4: (Guest can scroll up or down to check, if screen is hangging or loading image nicely..)
![Scrollup2](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/aeb945b0-086f-4207-bb38-1b452091cc9a)

Note: The following steps are Additional/Bonus Implementation(which is not necessary as per the requirement), but implemnted to have fullfledged app look and feel.
Step5: (Guest can tap on Meditaion icon which is there right top corner of "AchayraPrashant" image on landing page
![TapOnMeditationIcon](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/88b7ca15-b89a-4220-9bd0-8956af625162)

Step6: (Once user tap on MeditaionIcon, app will open a webView, which will show loading indicator as its couple of seconds to load website of "AcharyaPrashath".
![WebPageLoading](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/f99683b7-b03d-4dee-874d-24b62a9ee4fc)

Step7: (Once user tap on MeditaionIcon, app will open a webView, which will show loading indicator as its couple of seconds to load website of "AcharyaPrashath".
![WebPageOpened](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/711dbd1f-0754-46bb-9387-cf394cdc288f)

Step8: (Guest can go back to landing page and tap on Thumbnails to see how it will load in detail page, here we are passing the data nicely to detail screen.
![TapOnThumbnail3](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/40ec1842-f4f4-4226-bc57-e1dce069de7e)
![TaponThumbnail2](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/d64c95e7-9d7d-483e-b307-84d4bf015e76)
![TapOnThumbnail1](https://github.com/pavan-kumar-arepu/SmartImageLoader/assets/13812858/337d6b29-4c9e-4426-9895-aa8c13492f6d)



## Architecture Details

The architecture of the Media Coverage App follows a Model-View-ViewModel (MVVM) design pattern. It consists of the following components:

1. **Model:** Represents the data entities and business logic. Includes the `MediaCoverage` entity and associated networking and caching services.
2. **View:** Displays the user interface elements. Includes views such as `MediaCoverageListView` and `MediaCoverageView`.
3. **ViewModel:** Acts as an intermediary between the view and model layers. Includes the `MediaCoverageViewModel` class responsible for fetching and managing media coverages.

## High-Level Diagram

![High Level Diagram](/path/to/high_level_diagram.png)

The high-level diagram illustrates the communication flow between components in the Media Coverage App.

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
- **Liskov Substitution Principle (LSP):** The use of protocols and abstractions enables substitution of different implementations without affecting the behavior of the system.
Ex: Created Protocols which can be used for future
- **Interface Segregation Principle (ISP):** Interfaces are kept small and focused, avoiding unnecessary dependencies and promoting decoupling between components.
Ex: Yes, Created Protocols as small as possbile, so that they can utised by many other classes in future 
- **Dependency Inversion Principle (DIP):** High-level modules (e.g., view models) depend on abstractions (protocols), not concrete implementations, facilitating easier testing and maintenance.
Ex: Yes, in VM follows clear DIP principle and also protocols make sure, they did not provice any implemantion, it just abstrations. 

## How to Use

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on a simulator or device.
4. Follow the screenshots sequence to experience the app. 

## Credits

- Developed by ArepuPavanKumar
- Contact: 
Mail: iOSDeveloper.ipa@gmail.com
Whatsapp: +91 8121 04 03 08
Phone:  +46 76 431 65 99
GithubRepo: https://github.com/pavan-kumar-arepu?tab=repositories
Linkedin: https://www.linkedin.com/in/pavan-kumar-arepu-software-architect-engineer/

*************************************   Transforming Ideas into Impactful Mobile App Solutions *************************************
