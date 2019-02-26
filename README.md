# IRBSandbox

[![CI Status](https://travis-ci.org/irobbin1024/IRBSandbox.svg)](https://travis-ci.org/robbin/IRBSandbox)
[![Version](https://img.shields.io/cocoapods/v/IRBSandbox.svg?style=flat)](https://cocoapods.org/pods/IRBSandbox)
[![License](https://img.shields.io/cocoapods/l/IRBSandbox.svg?style=flat)](https://cocoapods.org/pods/IRBSandbox)
[![Platform](https://img.shields.io/cocoapods/p/IRBSandbox.svg?style=flat)](https://cocoapods.org/pods/IRBSandbox)



💡inspire AirSandbox(https://github.com/music4kid/AirSandbox)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Manually display the sandbox

```objective-c
[[IRBSandboxManager sharedInstance] show];
```

or slide window display the sandbox

```objective-c
[[IRBSandboxManager sharedInstance] enable];
```
<img src="https://raw.githubusercontent.com/irobbin1024/IRBSandbox/master/1.gif" width="320" />



## Features

- [x] Display file content
- [x] Show sandbox file
- [x] Airdrop pass file
- [x] Easy to delete files

## TODO

- [ ] Show Sqlite file content, and more type of file...
- [ ] Multi-select files and operate

## Installation

IRBSandbox is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IRBSandbox'
```

## Author

irobbin, irobbin1024@gmail.com

## License

IRBSandbox is available under the MIT license. See the LICENSE file for more info.
