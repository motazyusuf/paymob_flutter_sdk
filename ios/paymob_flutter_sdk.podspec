Pod::Spec.new do |s|
  s.name             = 'paymob_flutter_sdk'
  s.version          = '1.0.0'
  s.summary          = 'A Flutter plugin for integrating Paymob payment gateway.'
  s.description      = <<-DESC
A Flutter plugin for integrating Paymob payment gateway with native Android and iOS SDKs support.
                       DESC
  s.homepage         = 'https://github.com/yourusername/paymob_flutter_sdk'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  
  # This points to the folder you created
  s.vendored_frameworks = 'Frameworks/PaymobSDK.xcframework'
  
  s.dependency 'Flutter'
  
  # REMOVED: s.dependency 'PaymobSDK' 
  # We removed the line above because we are using the vendored_framework instead.
  
  s.platform = :ios, '13.0'

  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' 
  }
  s.swift_version = '5.0'
end