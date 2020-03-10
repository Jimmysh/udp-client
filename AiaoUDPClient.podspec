
  Pod::Spec.new do |s|
    s.name = 'AiaoUDPClient'
    s.version = '0.0.1'
    s.summary = 'udp client'
    s.license = 'MIT'
    s.homepage = 'https://github.com/aiao-io/udp-client'
    s.author = 'jimmy'
    s.source = { :git => 'https://github.com/aiao-io/udp-client', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end
