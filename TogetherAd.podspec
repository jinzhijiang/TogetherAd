#
# Be sure to run `pod lib lint TogetherAd.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TogetherAd'
  s.version          = '0.1.1'
  s.summary          = '广告聚合：帮助 iOS 开发者快速、便捷、灵活的接入国内多家主流广告 SDK。穿山甲。开屏广告、Banner横幅广告、插屏广告、激励广告、全屏广告。'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
这是一个iOS广告聚合，为了方便在iOS中接入不同平台的广告。起因是需要在flutter中接入广告，Android端在Github中找到了一个叫比较好的TogetherAd（https://github.com/ifmvo/TogetherAd）的聚合，于是在iOS端写了一个同样流程的swift版本接入不同平台的广告SDK。
目前只接入了：穿山甲平台的广告
                       DESC

  s.homepage         = 'https://github.com/xujiaji/TogetherAd'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xujiaji' => 'jiajixu@qq.com' }
  s.source           = { :git => 'https://github.com/xujiaji/TogetherAd.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TogetherAd/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TogetherAd' => ['TogetherAd/Assets/*.png']
  # }

  s.public_header_files = 'TogetherAd/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.static_framework = true
  
  # 广点通SDK
  s.dependency 'GDTMobSDK'
  # 穿山甲SDK
  s.dependency 'Ads-CN'
end
