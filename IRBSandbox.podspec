#
# Be sure to run `pod lib lint IRBSandbox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IRBSandbox'
  s.version          = '1.0.0'
  s.summary          = 'easy to find file from sandbox in device, and share with Airdrop, delete file, to show file content'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
easy to find file from sandbox in device, and share with Airdrop, delete file, to show file content
                       DESC

  s.homepage         = 'https://github.com/irobbin1024/IRBSandbox'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'robbin' => 'longbin.lai@quvideo.com' }
  s.source           = { :git => 'https://github.com/irobbin1024/IRBSandbox.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'IRBSandbox/Classes/**/*'
  
  s.dependency 'SSZipArchive'
  
  # s.resource_bundles = {
  #   'IRBSandbox' => ['IRBSandbox/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
