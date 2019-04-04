#
#  Be sure to run 'pod spec lint FQBaseKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "FQBaseKit"
  s.version      = "0.1.11"
  s.summary      = "FQBaseKit a collection of useful Objective-C Categories"
  s.description  = " FQBaseKit a collection of useful Objective-C Categories extending iOS Frameworks such as Foundation,UIKit,QuartzCore "

  s.homepage     = "https://github.com/fangqiu1991/FQBaseKit.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "fangqiu1991" => "519757546@qq.com" }
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/fangqiu1991/FQBaseKit.git", :tag => "#{s.version}" }
  s.public_header_files = 'FQBaseKit/FQBaseHeader.h'
  s.source_files  = 'FQBaseKit/FQBaseHeader.h' 
	
     s.subspec 'FQBaseFoundation' do |s|
    	s.source_files       = 'FQBaseKit/FQBaseFoundation/*.{h,m}'

     end

     s.subspec 'FQBaseHelper' do |s|
    	s.source_files       = 'FQBaseKit/FQBaseHelper/*.{h,m}'

     end

     s.subspec 'FQBaseQuartzCore' do |s|
    	s.source_files       = 'FQBaseKit/FQBaseQuartzCore/*.{h,m}'

     end
  
     s.subspec 'FQBaseTool' do |s|
    	s.source_files       = 'FQBaseKit/FQBaseTool/*.{h,m}'

     end
     
     s.subspec 'FQBaseUIKit' do |s|
    	s.source_files       = 'FQBaseKit/FQBaseUIKit/*.{h,m}'
	s.frameworks = 'Foundation','UIKit'

     end

     s.subspec 'FQBaseUtil' do |s|
    	s.source_files       = 'FQBaseKit/FQBaseUtil/*.{h,m}'

     end

end
