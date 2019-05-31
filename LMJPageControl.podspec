Pod::Spec.new do |s|
s.name          = 'LMJPageControl'
s.version       = '2.0.2'
s.summary       = 'An easy way to use ios page-control in Swift'
s.homepage      = 'https://github.com/JerryLMJ/LMJPageControl'
s.license       = {:type => 'MIT', :file => 'LICENSE' }
s.authors       = {'JerryLMJ' => 'limingjie_mail@163.com'}
s.platform      = :ios, '8.0'
s.source        = {:git => 'https://github.com/JerryLMJ/LMJPageControl.git', :tag => s.version}
s.source_files  = 'LMJPageControl/**/*'
s.swift_version = '5.0'
end
