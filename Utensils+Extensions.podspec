Pod::Spec.new do |spec|
  spec.name                  = 'Utensils+Extensions'
  spec.version               = '0.0.1'
  spec.summary               = 'An extension of Utentils with newer tooling and functionality'
  spec.homepage              = 'https://github.com/rbaumbach/utensils-extensions'
  spec.license               = { :type => 'MIT', :file => 'MIT-LICENSE.txt' }
  spec.author                = { 'Ryan Baumbach' => 'github@ryan.codes' }
  spec.source                = { :git => 'https://github.com/rbaumbach/Utensils-Extensions.git', :tag => spec.version.to_s }
  spec.requires_arc          = true
  spec.platform              = :ios
  spec.ios.deployment_target = '13.0'
  spec.source_files          = 'Sources/Utensils+Extensions/**/*.{swift}'
  spec.swift_version         = '5.5'
  
  spec.dependency 'Utensils', '~> 0.3.0'
end
