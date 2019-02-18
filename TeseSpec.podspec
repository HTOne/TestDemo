#
#  Be sure to run `pod spec lint TeseSpec.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "TeseSpec"
  s.version      = "0.0.1"
  s.summary      = "A short description of TeseSpec."

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/HTOne/TestDemo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'whtgogoing@163.com' => 'wanhaitang@sinter.cn' }
  s.source           = { :git => 'https://github.com/HTOne/TestDemo.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  
  s.subspec 'Base' do |base|
      base.source_files = 'TestDemo/Base/*.{h,m}','TestDemo/Base/**/*.{h,m}','TestDemo/Define/UtilsMacros.h'
      base.dependency 'TeseSpec/Category'
  end
  
  s.subspec 'Category' do |category|
      category.source_files = 'TestDemo/Utils/Additions/**/*'

  end





end
