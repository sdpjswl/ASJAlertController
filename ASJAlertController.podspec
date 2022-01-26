Pod::Spec.new do |s|
  s.name          = 'ASJAlertController'
  s.version       = '1.3'
  s.platform      = :ios, '9.0'
  s.license       = { :type => 'MIT' }
  s.homepage      = 'https://github.com/sdpjswl/ASJAlertController'
  s.authors       = { 'Sudeep' => 'sdpjswl1@gmail.com' }
  s.summary       = 'Present a UIAlertController from any class using "show" method like UIAlertView'
  s.source        = { :git => 'https://github.com/sdpjswl/ASJAlertController.git', :tag => s.version }
  s.source_files  = 'ASJAlertController/*.{h,m}'
  s.requires_arc  = true
end