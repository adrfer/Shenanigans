# Shenanigans
Just a collection of some sleek Swift shenanigans.

Tested on `Xcode 8` and `Swift 3`.

## Install

Shenanigans can be installed using [Carthage](#carthage), [CocoaPods](#cocoapods), [Git Submodules](#git-submodules), or [Swift Package Manager](#swift-package-manager).

### [Carthage](https://github.com/Carthage/Carthage)

1. Create a [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile) file in your Xcode project directory and add the following:
  
  ```
  github "adrfer/Shenanigans" "master"
  ```
  
2. Run `carthage update` to build the framework
3. Drag and drop the **Shenanigans.framework** file from **Carthage/build** to your navigator ( <kbd>⌘</kbd><kbd>1</kbd> )

Now you can `import Shenanigans` to make your project Swift-y.

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

  ```ruby
  pod install
  ```

Now you can `import Shenanigans` to make your project Swift-y.

### [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

1. Open a terminal, change to your project directory, and run:

  ```bash
  git submodule add https://github.com/adrfer/Shenanigans.git
  ```
  
2. Drag the **Shenanigans.xcodeproj** to your project navigator ( <kbd>⌘</kbd><kbd>1</kbd> )
3. Select yout project and verify if the deployment target matches that of your application
4. Click the application target under the **Targets** heading in the sidebar and open the **General** panel
5. Add the **Shenanigans.framework** to the **Linked Frameworks and Libraries** section

Now you can `import Shenanigans` to make your project Swift-y.

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

Now you can `import Shenanigans` to make your project Swift-y.
