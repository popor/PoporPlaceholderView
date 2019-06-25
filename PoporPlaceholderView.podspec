#
# Be sure to run `pod lib lint PoporPlaceholderView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name        = 'PoporPlaceholderView'
  s.version     = '0.0.05'
  s.summary     = 'PlaceholderView uesd for UITableView and UICollectionView.'

  s.homepage    = 'https://github.com/popor/PoporPlaceholderView'
  s.license     = { :type => 'MIT', :file => 'LICENSE' }
  s.author      = { 'popor' => '908891024@qq.com' }
  s.source      = { :git => 'https://github.com/popor/PoporPlaceholderView.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '8.0'
  
  s.source_files = 'PoporPlaceholderView/Classes/*.{h,m}'
  s.resource     = 'PoporPlaceholderView/Classes/PoporPlaceholderView.bundle'
  
  s.dependency 'Masonry'
  s.dependency 'MJRefresh'
  s.dependency 'PoporFoundation/PrefixCore'
  s.dependency 'PoporFoundation/NSObject'
  s.dependency 'PoporUI/UIImage'
  
end
