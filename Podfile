# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TodoRIBs' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'RxSwift', '6.0'
  pod 'RxDataSources', '5.0'
  
  # Pods for TodoRIBs
  pod 'RIBs',
    :git => 'https://github.com/uber/RIBs.git',
    :branch => 'master'
#  pod 'Texture'

  # UI
  pod 'SnapKit'

  #Networking
  pod 'Moya'
  pod 'Kingfisher'


  # Misc.
  pod 'SwiftLint'
  pod 'CocoaLumberjack/Swift'
  pod 'Then'

  target 'TodoRIBsTests' do
    inherit! :search_paths
    # Pods for testing

    pod 'Quick'
    pod 'RxNimble'
  end
end
