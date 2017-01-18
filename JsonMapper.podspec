#
# JsonMapper.podspec
#

Pod::Spec.new do |s|
  s.name             = 'JsonMapper'
  s.version          = '0.1.0'
  s.summary          = 'JsonMapper allows you to easily map JSON to objects with minimum code'
  s.description      = 'With JsonMapper you can map JSON to objects with minimum code. This library also saves you from writing boiler-plate code when making HTTP requests so you can send and retrieve objects from your API endpoints without writing any parsing code.'
  s.homepage         = 'https://github.com/tlextrait/JsonMapper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thomas Lextrait' => 'thomas.lextrait@gmail.com' }
  s.source           = { :git => 'https://github.com/tlextrait/JsonMapper.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'JsonMapper/Classes/**/*'
  s.frameworks = 'UIKit'
end
