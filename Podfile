platform :ios, '12.0'

target 'OKR-List' do

use_frameworks!
inhibit_all_warnings!

# enforce Swift style and conventions
pod 'SwiftLint', '0.35.0'

# Keychain
pod 'SwiftKeychainWrapper', '3.4.0'

# Logger
pod 'SwiftyBeaver', '1.8.0'

# Networking
pod 'Alamofire', '4.9.0'
pod 'Moya', '12.0.1'

# Data Mapping
pod 'Moya-ObjectMapper', '2.8'

# UI
pod 'MBProgressHUD', '1.1.0'
pod 'IQKeyboardManagerSwift', '6.5.1'

# Images
pod 'AlamofireImage', '3.5.2'

# Database
pod 'RealmSwift', '3.19.0'

# Painless Attributed Strings
pod 'SwiftRichString', '3.0.3'

# Color
pod 'Hue', '5.0.0'

target 'OKR-ListTests' do
    inherit! :search_paths
end

post_install do |installer|
installer.pods_project.build_configurations.each do |config|
config.build_settings.delete('CODE_SIGNING_ALLOWED')
config.build_settings.delete('CODE_SIGNING_REQUIRED')
end
end

end
