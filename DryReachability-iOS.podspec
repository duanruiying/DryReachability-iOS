#
# Be sure to run `pod lib lint DryReachability-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
# 提交仓库:
# pod spec lint DryReachability-iOS.podspec --allow-warnings
# pod trunk push DryReachability-iOS.podspec --allow-warnings
#

Pod::Spec.new do |s|
  
  # Git
  s.name        = 'DryReachability-iOS'
  s.version     = '0.0.1'
  s.summary     = 'DryReachability-iOS'
  s.homepage    = 'https://github.com/duanruiying/DryReachability-iOS'
  s.license     = { :type => 'MIT', :file => 'LICENSE' }
  s.author      = { 'duanruiying' => '2237840768@qq.com' }
  s.source      = { :git => 'https://github.com/duanruiying/DryReachability-iOS.git', :tag => s.version.to_s }
  s.description = <<-DESC
  TODO: iOS网络状态监控.
  DESC
  
  # User
  s.swift_version         = '5.0'
  s.ios.deployment_target = '10.0'
  s.requires_arc          = true
  s.user_target_xcconfig  = {'OTHER_LDFLAGS' => ['-w']}
  
  # Pod
  #s.static_framework      = true
  s.pod_target_xcconfig   = {'OTHER_LDFLAGS' => ['-w']}
  
  # Code
  s.source_files          = 'DryReachability-iOS/Classes/Code/**/*'
  #s.public_header_files   = 'DryReachability-iOS/Classes/Code/Public/**/*.h'
  
  # System
  #s.libraries  = ''
  s.frameworks = 'UIKit', 'Foundation', 'SystemConfiguration'
  
  # ThirdParty
  #s.vendored_libraries  = ''
  #s.vendored_frameworks = ''
  s.dependency 'ReachabilitySwift'
  
end
