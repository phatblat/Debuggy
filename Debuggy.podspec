Pod::Spec.new do |s|
  s.name             = 'Debuggy'
  s.version          = '0.1.0'
  s.summary          = 'Experiment of turning DebugDemo into a framework.'
  s.description      = <<-DESC
Debuggy add several helpful UI testing tools to your app.
Make your UX and QA colleagues happy.
  DESC

  s.homepage         = 'https://github.com/phatblat/Debuggy'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { 'Ben Chatelain' => 'ben@octop.ad' }
  s.source           = { git: 'https://github.com/phatblat/Debuggy.git', tag: s.version.to_s }
  s.social_media_url = 'https://twitter.com/phatblat'

  s.ios.deployment_target = '13.0'
  s.swift_versions = '5.0'
  s.source_files = 'Debuggy/Source/**/*'

   s.resource_bundles = {
     'Debuggy' => ['Debuggy/Assets/*.xib']
   }

  s.frameworks = 'UIKit'
end
