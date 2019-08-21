#
# Be sure to run `pod lib lint TestLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'libavif'
  s.version          = '0.2.0'
  s.summary          = 'libavif - Library for encoding and decoding .avif files'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library aims to be a friendly, portable C implementation of the AV1 Image File Format, as described here:
https://aomediacodec.github.io/av1-avif/
It is a work-in-progress, but can already encode and decode all AOM supported YUV formats and bit depths (with alpha).
                       DESC

  s.homepage         = 'https://github.com/joedrago/avif/'
  s.license          = { :type => 'BSD' }
  s.author           = { 'Joe Drago' => 'joedrago@gmail.com' }
  s.source           = { :git => 'https://github.com/AOMediaCodec/libavif.git', :tag => 'v' + s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.7'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'src/**/*.{h,c,cc}', 'ext/gb/*.{h,c,cc}', 'include/avif/*.h'
  s.public_header_files = 'include/avif/avif.h'
  s.preserve_paths = 'src', 'include/avif', 'ext/gb'

  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/libavif/include $(PODS_TARGET_SRCROOT)/include ${PODS_ROOT}/libaom/aom',
  }
  s.dependency 'libaom', '>= 1.0.1'
end
