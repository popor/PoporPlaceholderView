<a href='https://github.com/popor/mybox'> MyBox </a>

# PoporPlaceholderView

[![CI Status](https://img.shields.io/travis/popor/PoporPlaceholderView.svg?style=flat)](https://travis-ci.org/popor/PoporPlaceholderView)
[![Version](https://img.shields.io/cocoapods/v/PoporPlaceholderView.svg?style=flat)](https://cocoapods.org/pods/PoporPlaceholderView)
[![License](https://img.shields.io/cocoapods/l/PoporPlaceholderView.svg?style=flat)](https://cocoapods.org/pods/PoporPlaceholderView)
[![Platform](https://img.shields.io/cocoapods/p/PoporPlaceholderView.svg?style=flat)](https://cocoapods.org/pods/PoporPlaceholderView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PoporPlaceholderView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
ruby
pod 'PoporPlaceholderView'

前提: UITableView和UICollectionView的刷新使用MFRefresh,假如数据为空则显示可以显示默认空白页.
假如需要替换PoporPlaceholderView, 继承PoporPlaceholderView一个即可.

```

<p>

<img src="https://github.com/popor/PoporPlaceholderView/blob/master/Example/PoporPlaceholderView/image/screen1.png" width="40%" height="40%">

</p>

1.02
增加了placeHolderEmptyBlock
假如section = 3, 只有最后section为空或者全部为空的时候显示placeHolderView, 这就需要自定义placeHolderEmptyBlock了.

## Author

popor, 908891024@qq.com

## License

PoporPlaceholderView is available under the MIT license. See the LICENSE file for more info.
