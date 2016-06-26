Pod::Spec.new do |s|
  s.name             = 'FlurryEventLogger'
  s.version          = '0.1.0'
  s.summary          = 'Event logging wrapper for Flurry iOS SDK'

  s.description      = <<-DESC
Event logging wrapper for Flurry iOS SDK. Easy implementation with an enum.
                       DESC

  s.homepage         = 'https://github.com/anilgoktas/FlurryEventLogger'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anıl Göktaş' => 'goktas.anil@gmail.com' }
  s.source           = { 
    :git => 'https://github.com/anilgoktas/FlurryEventLogger.git', 
    :tag => s.version
  }
  s.social_media_url = 'https://twitter.com/goktasanil'

  s.ios.deployment_target = '9.0'

  s.source_files = 'FlurryEventLogger/*'
  
  s.dependency 'Flurry-iOS-SDK/FlurrySDK'
end
