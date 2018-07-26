Pod::Spec.new do |s|
  s.name = 'SourceEditor'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A native source editor for iOS and macOS.'
  s.homepage = 'https://github.com/louisdh/source-editor'
  s.social_media_url = 'http://twitter.com/LouisDhauwe'
  s.authors = { 'Louis D\'hauwe' => 'louisdhauwe@silverfox.be' }
  s.source = { :git => 'https://github.com/louisdh/source-editor.git', :tag => s.version }
  s.module_name  = 'SourceEditor'

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target  = '10.13'

  s.source_files = 'Sources/**/*.swift'

  s.dependency 'SavannaKit'

end
