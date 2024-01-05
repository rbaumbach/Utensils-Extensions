source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def shared_spec_pods
  pod 'Quick', '7.3.0'
  pod 'Moocher', '0.4.0'
end

target 'Utensils+Extensions' do
  pod 'Utensils', '0.3.1'
  pod 'SwiftLint', '0.54.0'
end

target 'Specs' do
  shared_spec_pods
end

target 'IntegrationSpecs' do
  shared_spec_pods

  pod 'Moocher/Polling', '0.4.0'
end


