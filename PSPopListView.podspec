
Pod::Spec.new do |s|
s.name             = 'PSPopListView'
s.version          = '0.0.3'
s.summary          = 'A Awesome PopUp View'
s.homepage         = 'https://github.com/PengSiSi/PSPopListView.git'
s.license               = 'MIT'
s.author                = { 'PengSi' => '1299625033@qq.com' }
s.source           = { :git => 'https://github.com/PengSiSi/PSPopListView.git',:tag => s.version.to_s }
s.source_files     = 'PSPopListView/*.{h,m}'
s.frameworks       = 'UIKit', 'Foundation'
s.requires_arc     = true
s.ios.deployment_target = '7.0'

end
ss
