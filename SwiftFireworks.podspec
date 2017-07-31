Pod::Spec.new do |s|
  s.name             = 'SwiftFireworks'
  s.version          = '0.1.0'
  s.summary          = 'A library to easily show 2D animated fireworks on a UIView.'
  s.description      = <<-DESC
Shows animated 2D fireworks in the UIView you specify.
Fireworks can be fully customized: position, radius, color, sparks thickness, length and separation.
                       DESC

  s.homepage         = 'https://github.com/enricmacias/SwiftFireworks'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'enricmacias' => 'enric.macias.lopez@gmail.com' }
  s.source           = { :git => 'https://github.com/enricmacias/SwiftFireworks.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftFireworks/Classes/**/*'
end
