# Shenanigans
Just a collection of some sleek Swift shenanigans.

Tested against `Swift 3` and `Xcode 8`.

## Install

Shenanigans can be installed using [Carthage](#carthage), [CocoaPods](#cocoapods), [Git Submodules](#git-submodules), or [Swift Package Manager](#swift-package-manager).

### [Carthage](https://github.com/Carthage/Carthage)

1. Create a [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) file in your Xcode project directory and add the following:

  ```sh
  github "adrfer/Shenanigans" "master"
  ```
  
2. Run `carthage update` to build the framework
3. Drag and drop the __Shenanigans.framework__ file from __Carthage/build__ to your project navigator
4. Now you can import the Shenanigans module to make your project Swift-y
  
  ```swift
  import Shenanigans
  ```
  
### [CocoaPods](https://github.com/CocoaPods/CocoaPods)

1. Create a [Podfile](https://guides.cocoapods.org/using/the-podfile.html) in your Xcode project directory and add the following:

  ```ruby
  source 'https://github.com/CocoaPods/Specs.git'
  platform :ios, '10.0'
  use_frameworks!

  target 'Your Target Name' do
    pod 'Shenanigans', '~> 1.0'
  end
  ```
  
2. Open a terminal, change to your project directory, and run:

  ```sh
  pod install
  ```
  
3. Now you can import the Shenanigans module to make your project Swift-y
  
  ```swift
  import Shenanigans
  ```
  
### [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

1. Open a terminal, change to your project directory, and run:

  ```sh
  git submodule add https://github.com/adrfer/Shenanigans.git
  ```
  
2. Drag __Shenanigans.xcodeproj__ to your project navigator
3. Select your project and verify if the deployment target matches that of your application
4. Click the application target under the __Targets__ heading in the sidebar and open the __General__ panel
5. Add the __Shenanigans.framework__ to the __Linked Frameworks and Libraries__ section
6. Now you can import the Shenanigans module to make your project Swift-y
  
  ```swift
  import Shenanigans
  ```
  
### [Swift Package Manager](https://github.com/apple/swift-package-manager)

1. Create a [Package.swift](https://github.com/apple/swift-package-manager/blob/master/Documentation/Reference.md#package-manifest-file-format-reference) file in your Xcode project directory and add the following:

  ```swift
  import PackageDescription

  let package = Package(
      name: "Your Project Name",
      targets: [],
      dependencies: [
          .Package(url: "https://github.com/adrfer/Shenanigans.git", "1.0.0")
      ]
   )
  ```
  
2. Open a terminal, change to your project directory, and run:

  ```sh
  swift build
  ```

3. Now you can import the Shenanigans module to make your project Swift-y
  
  ```swift
  import Shenanigans
  ```
  
