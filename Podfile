platform :ios, '12.0'

target 'OKR-List' do

use_frameworks!
inhibit_all_warnings!

# enforce Swift style and conventions
pod 'SwiftLint'

# Keychain
pod 'SwiftKeychainWrapper'

# Logger
pod 'SwiftyBeaver'

# Networking
pod 'Alamofire'
pod 'Moya'

# Data Mapping
pod 'Moya-ObjectMapper'

# UI
pod 'MBProgressHUD'
pod 'IQKeyboardManagerSwift'

# Images
pod 'Kingfisher'

# Database
pod 'RealmSwift'

# Firebase
pod 'Firebase/Core'
pod 'Firebase/Messaging'

pod 'Fabric'
pod 'Crashlytics'

# Painless Attributed Strings
pod 'SwiftRichString'

# Color
pod 'Hue'

target 'OKR-ListTests' do
    inherit! :search_paths
    pod 'Firebase/Core'
end

post_install do |installer|
installer.pods_project.build_configurations.each do |config|
config.build_settings.delete('CODE_SIGNING_ALLOWED')
config.build_settings.delete('CODE_SIGNING_REQUIRED')
end
end

end
