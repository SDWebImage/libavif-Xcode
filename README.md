# libavif + Xcode

[![CI Status](http://img.shields.io/travis/SDWebImage/libavif-Xcode.svg?style=flat)](https://travis-ci.org/SDWebImage/libavif-Xcode)
[![Version](https://img.shields.io/cocoapods/v/libavif.svg?style=flat)](http://cocoapods.org/pods/libavif)
[![License](https://img.shields.io/cocoapods/l/libavif.svg?style=flat)](http://cocoapods.org/pods/libavif)
[![Platform](https://img.shields.io/cocoapods/p/libavif.svg?style=flat)](http://cocoapods.org/pods/libavif)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/SDWebImage/libavif-Xcode)

A wrapper for [libavif](https://github.com/AOMediaCodec/libavif) + Xcode project.
This enables Carthage support

This repo also including the CocoaPods's spec file to use libavif.

## Requirements

+ iOS 8
+ macOS 10.7
+ tvOS 9.0 (rav1e unavailable)
+ watchOS 2.0 (rav1e unavailable)

## aom && dav1d && rav1e

### aom

By default, libavif is built with [aom](https://aomedia.googlesource.com/aom/) codec support. aom is the first AV1 codec during the standard draft implementation.

### dav1d (Decoding)

[dav1d](https://github.com/videolan/dav1d) is the new and next generation AV1 codec, focused on speed and correctness.

See more about [explanation for why starting a new project but not improving aom](https://github.com/videolan/dav1d#why-do-you-not-improve-libaom-rather-than-starting-a-new-project)

From v0.3.0, libavif can built with dav1d. For CocoaPods user, you can simply use the subspec for this. Carthage for optional dav1d codec is not supported currently.

### rav1e (Encoding)

[rav1e](https://github.com/xiph/rav1e) is the fastest and safest AV1 encoder. Which use [Rust programming](https://www.rust-lang.org/) to provide fast and safe codec compared to aom. Its current form it is most suitable for cases where libaom (the reference encoder) is too slow.

See more about [performance](https://github.com/xiph/rav1e/issues/1248)

From v0.4.3, libavif can built with rav1e. For CocoaPods user, you can simply use the subspec for this. Carthage for optional rav1c codec is not supported currently.

Note rav1e currently only support iOS && macOS. watchOS and tvOS supports need Rust community upstream support.

## Installation

### Carthage

libavif is (via this repo) available through [Carthage](https://github.com/Carthage/Carthage).

```
github "SDWebImage/libavif-Xcode"
```

### CocoaPods

libavif is available through [CocoaPods](https://github.com/CocoaPods/CocoaPods).

By default, libavif is built with aom decoding/encoding codec, which is stable, but slow.

```
pod 'libavif'
```

If you need the dav1d decoding codec, use the subspec:

```
pod 'libavif/libdav1d'
```

If you need the rav1e encoding codec, use the subspec:

```
pod 'libavif/librav1e'
```

## Usage

Use libavif as you would normally, this is just a repo that adds an Xcode proj.

## License

libavif is available under the [BSD License](https://github.com/AOMediaCodec/libavif/blob/master/LICENSE).


