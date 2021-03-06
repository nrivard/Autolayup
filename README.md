# Autolayup
*Everyone can use autolayout this close to the basket.*

Autolayup is a framework for easy, succint, and standard use of autolayout on iOS and tvOS. It is available in both Swift and Objective-C. It's primary goal is to get rid of a lot of the boilerplate of using pure, code-driven autolayout constraints. `NSLayoutAnchor` made things slightly less verbose but you still end up with a lot of code like this:

```swift
subview.translatesAutoresizingMaskIntoConstraints = false
subview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
subview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
subview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
subview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
```

In Autolayup, this is an easy to understand one-liner:

```swift
subview.constraintsEqualTo(view, boundTo: [.frame])
```

or

```objective-c
[subview constraintsEqualToGuide:view boundToAnchors:LayoutAnchorRelationFrame constant:0.0 activate:YES];
```

Autolayup takes care of making sure your autoresizing mask is turned off, by default activates your constraints, and lets you specify actual relationships much more easily. Another common scenario is creating constraints that are set off by the same amount, like leading and trailing margin from your superview:

```swift
subview.opposingConstraintsFor(view, boundTo: [.leading, .trailing], offsetBy: 8.0)
```

or

```objective-c
[subview opposingConstraintsForGuide:view boundToAnchors:(LayoutAnchorRelationLeading | LayoutAnchorRelationTrailing) offset:8.0 activate:YES];
```

Autolayup also has full `UILayoutGuide` support by default. Many new features in iOS and tvOS 11 are related to newly vended layout guides. This isn't a problem for Autolayup:

```swift
subview.constraintsEqualTo(view.safeAreaLayoutGuide, boundTo: [.frame])
```

or

```objective-c
[subview constraintsEqualToGuide:view.safeAreaLayoutGuide boundToAnchors:LayoutAnchorRelationFrame constant:0.0 activate:YES];
```

# Installation using CocoaPods

CocoaPods is a dependency manager for Apple platform development which automates and simplifies the process of using 3rd-party libraries in your projects.

Just create a Podfile and add the following:

```
pod 'Autolayup'
```
# Author

[Nate Rivard](http://nrivard.github.io)

# License

Autolayup is provided for free under the MIT license. See the [License](LICENSE) for more information.
