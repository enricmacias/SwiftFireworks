# SwiftFireworks

[![CI Status](http://img.shields.io/travis/enric_maciaslopez/SwiftFireworks.svg?style=flat)](https://travis-ci.org/enricmacias/SwiftFireworks)
[![Version](https://img.shields.io/cocoapods/v/SwiftFireworks.svg?style=flat)](http://cocoapods.org/pods/SwiftFireworks)
[![License](https://img.shields.io/cocoapods/l/SwiftFireworks.svg?style=flat)](http://cocoapods.org/pods/SwiftFireworks)
[![Platform](https://img.shields.io/cocoapods/p/SwiftFireworks.svg?style=flat)](http://cocoapods.org/pods/SwiftFireworks)

## Description

A library to easily show 2D animated fireworks on a UIView

![alt tag](https://github.com/enricmacias/SwiftFireworks/blob/master/Preview/SwiftFireworks.gif)

## Requirements

- iOS 8.0

## In detail

SwiftFireworks is a light library that let's you show animated fireworks using CoreAnimation.
You only need to specify which UIView you want to show the firework and the position of this one.
The library provides two different methods to show them:

```ruby
// Shows only one firework at a time.
func showFirework(inView view:UIView, andPosition position:CGPoint, radius:CGFloat? = nil, sparkLength:CGFloat? = nil, sparkThickness:CGFloat? = nil, sparkSeparation:CGFloat? = nil, color:UIColor? = nil)
```

```ruby
// Shows a set of fireworks
func showFireworkSet(inView view:UIView, andPosition position:CGPoint, numberOfFireworks num:UInt? = nil) 
```

## Usage

1. Import SwiftFireworks library into the file you want to show the fireworks
```ruby
import SwiftFireworks
```

2. Shoot a firework to the UIView you want
```ruby
SwiftFireworks.sharedInstance.showFirework(inView: view,　andPosition: CGPoint(x: posX, y: posY))
```

## Installation

### Cocoapods

To install it, simply add the following line to your Podfile:

```ruby
pod "SwiftFireworks"
```

### Carthage

To install it, add the following line to your Cartfile:

```ruby
github "enricmacias/SwiftFireworks"
```

Run ```carthage update``` to build the framework and drag the built ```SwiftFireworks.framework``` into your Xcode project.

## Author

Enric Macias Lopez, enric.macias.lopez@gmail.com

## License

SwiftFireworks is available under the MIT license. See the LICENSE file for more info.
