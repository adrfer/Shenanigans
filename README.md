# Shenanigans
Just a collection of some sleek Swift shenanigans.

The code was tested on `Xcode 7.3` and `Swift 2.2`.

## Install

### Carthage

To install using [Carthage](https://github.com/Carthage/Carthage):

1. Add `github "adrfer/Shenanigans" "master"` to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile)
2. Run `carthage update` to build the framework
3. Drag and drop the **Shenanigans.framework** file from **Carthage/build** to your navigator ( <kbd>⌘</kbd><kbd>1</kbd> ).

Now you can `import Shenanigans` to make your project swift-y.

### Git Submodules

To install it using [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules):

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
Support for [Swift Package Manager](https://github.com/apple/swift-package-manager) and [Cocoapods](https://github.com/CocoaPods/CocoaPods) is on the way.
