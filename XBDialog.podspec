Pod::Spec.new do |s|

  s.name             = "XBDialog"
  s.version          = "1.6.0"
  s.summary          = "Custom Dialog"

  s.description      = <<-DESC
    This is an Custom Dialog
                       DESC

  s.homepage         = "https://github.com/LiuSky/XBDialog"
  s.license          = 'MIT'
  s.author           = { "xiaobin liu" => "327847390@qq.com" }
  s.source           = { :git => "https://github.com/LiuSky/XBDialog.git", :tag => s.version.to_s }
 
  s.swift_version         = '5.0'
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.source_files = 'XBDialog/Classes/**/*'
  s.frameworks = 'Foundation'
  s.frameworks = 'UIKit'
end
