![Tooploox](https://github.com/tooploox/SnappyTestCase/raw/master/tooploox-logo.png)

SnappyTestCase
======

iOS Simulator type agnostic snapshot testing, built on top of the [FBSnapshotTestCase](https://github.com/facebook/ios-snapshot-test-case).

Why?
----

Snapshot testing helps to deliver views that scale correctly with a wide range of screen sizes. When it comes to view controllers, we usually want to ensure they keep visual quality on a various set of existing devices, in each supported orientation. Test suite could be run on numerous variants of iOS Simulators. However, this could be a really time-consuming task, for sure not acceptable during a development process. SnappyTestCase tackles this issue by combining test with a set of device definitions (each one including screen size, scale, and orientation) to validate with, ignoring real device simulator context information.

## Features

- Simulator type insensitive snapshot testing => restart free, quick various device testing
- Handy definitions of iOS devices to test with - both iPhone and iPad, with chainable filtering API
- Forcing simulator to adopt `scale` and `orientation` according to test device definition
- Adding device type and orientation to reference file names
- You can resize one and validate snapshot of another view (for example, you can resize whole window with `UITabBarController` and validate snapshot of its tab bar only)
- Optional closure executed just before verifying view

Getting Started
-----------

Validating view controller on all existing iPhones, with portrait orientation (default):

```swift
func testAllDevices() {
    let window = UIWindow()
    window.makeKeyAndVisible()
    window.rootViewController = ExampleViewController(nibName: nil, bundle: nil)
    
    verifyViewSnaps(DeviceRack.iPhone.all, view: window)
}
```

For more examples of usage check out `SnappyDemo` project.

Defining device set cheat sheet
-------------------------------

| Expression                               | Device set description                   | Snapshot count |
| ---------------------------------------- | ---------------------------------------- | :------------: |
| `DeviceRack.iPhone.all.landscape`        | All iPhones, in landscape orientation    |       4        |
| `DeviceRack.iPhone.all.portrait.uniqueWidths` | Set of iPhones covering all possible screen widths in portrait orientation |       3        |
| ` DeviceRack.iPad.retina.landscape`      | Retina 9.7" / 7.9" iPad, landscape       |       1        |

Installation using CocoaPods
----------------------------

Add following line to your test target pods list in `Podfile`:

`pod 'SnappyTestCase'`

License
-------

`SnappyTestCase` is distributed under the Apache 2.0 license.

## Feedback

We love receiving feedback and we encourage you to contact us and share your thoughts either via e-mail [hello@tooploox.com](mailto:hello@tooploox.com) or Twitter by mentioning [@tooploox](https://twitter.com/tooploox).
