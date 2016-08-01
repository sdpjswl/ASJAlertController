Pod::Spec.new do |s|
  s.name          = 'ASJAlertController'
  s.version       = '1.0'
  s.platform      = :ios, '8.0'
  s.license       = { :type => 'MIT' }
  s.homepage      = 'https://github.com/sudeepjaiswal/ASJAlertController'
  s.authors       = { 'Sudeep Jaiswal' => 'sudeepjaiswal87@gmail.com' }
  s.summary       = 'Present a UIAlertController from any class using "show" method like UIAlertView'
  s.source        = { :git => 'https://github.com/sudeepjaiswal/ASJAlertController.git', :tag => s.version }
  s.source_files  = 'ASJAlertController/*.{h,m}'
  s.requires_arc  = true
end