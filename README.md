# Shenanigans
Just a collection of some sleek Swift shenanigans.

Tested on `Xcode 8` and `Swift 3`.

## Install

Shenanigans can currently be installed in one of three ways:

* [Carthage](#carthage)
* [CocoaPods](#cocoapods)
* [Git Submodules](#git-submodules)

### Carthage

To install using [Carthage](https://github.com/Carthage/Carthage):

1. Add `github "adrfer/Shenanigans" "master"` to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile)
2. Run `carthage update` to build the framework
3. Drag and drop the **Shenanigans.framework** file from **Carthage/build** to your navigator ( <kbd>⌘</kbd><kbd>1</kbd> )

Now you can `import Shenanigans` to make your project swift-y.

### CocoaPods

To install using [CocoaPods](https://github.com/CocoaPods/CocoaPods):

1. Create a **Podfile** in your Xcode project directory and add the following:

  ```ruby
  source 'https://github.com/CocoaPods/Specs.git'
  platform :ios, '9.0'
  use_frameworks!

  target '<Target Name>' do
    pod 'Shenanigans', '~> 1.0'
  end
  ```
2. Open a terminal, change to your project directory, and run:

  ```ruby
  pod install
  ```
Now you can `import Shenanigans` to make your project swift-y.

### Git Submodules

To install using [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules):

1. Open a terminal, change to your project directory, and run:

    ```bash
    git submodule add https://github.com/adrfer/Shenanigans.git
    ```
2. Drag the **Shenanigans.xcodeproj** to your project navigator ( <kbd>⌘</kbd><kbd>1</kbd> )
3. Select yout project and verify if the deployment target matches that of your application
4. Click the application target under the **Targets** heading in the sidebar and open the **General** panel
5. Add the **Shenanigans.framework** to the **Linked Frameworks and Libraries** section

Now you can `import Shenanigans` to make your project swift-y.

--
Support for [Swift Package Manager](https://github.com/apple/swift-package-manager) is on the way.
