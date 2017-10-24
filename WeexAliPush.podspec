# coding: utf-8

Pod::Spec.new do |s|
  s.name         = "WeexAliPush"
  s.version      = "0.0.2"
  s.summary      = "Weex ali推送"

  s.description  = <<-DESC
                   Weex alicloudPush
                   DESC

  s.homepage     = "https://github.com/WUBOSS/weex-aliPush"
  s.license = {
    :type => 'MIT',
    :text => <<-LICENSE
            copyright
    LICENSE
  }
  s.authors      = {
                     "WUBOSS" =>"1054258896@qq.com"
                   }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source       = { :git => 'https://github.com/WUBOSS/weex-aliPush.git', :tag => '0.0.2' }
  s.source_files  = "ios/Sources/*.{h,m,mm}"
  s.requires_arc = true
  s.dependency "WeexPluginLoader"
  s.dependency "WeexSDK"
  s.vendored_frameworks = "ios/Sources/CloudPushSDK.framework","ios/Sources/AlicloudUtils.framework","ios/Sources/UTDID.framework"
  s.libraries  = "z","sqlite3","resolv"
  s.framework = "SystemConfiguration","CoreTelephony"


end
