source 'https://github.com/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'ListUsers' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'SnapKit', '~> 5.6.0'

  target 'ListUsersTests' do
    inherit! :search_paths
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts "Target -> #{target.name}"
    target.build_configurations.each do |config|
      config.build_settings.delete "IPHONEOS_DEPLOYMENT_TARGET"
    end
  end
end
