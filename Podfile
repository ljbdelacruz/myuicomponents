# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'UIComponentsFramework' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'GoogleMaps'
  # Pods for UIComponentsFramework
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
      config.build_settings['ENABLE_BITCODE'] = 'YES'
    end
  end
end
