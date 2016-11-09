Pod::Spec.new do |s|
  s.name = 'Shenanigans'
  s.version = '1.0.0'
  s.summary = 'Just a collection of some sleek Swift shenanigans.'
  s.homepage = 'https://github.com/adrfer/Shenanigans'
  s.license = { :type => 'WTFPL', :file => 'LICENSE' }
  s.author = { 'Adriano Ferreira' => 'adriano.ferreira@me.com' }
  s.source = { :git => 'https://github.com/adrfer/Shenanigans.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/*.swift'
end
