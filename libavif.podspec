#
# Be sure to run `pod lib lint TestLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'libavif'
  s.version          = '0.4.1'
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

  s.subspec 'libaom' do |ss|
    ss.dependency 'libaom', '>= 1.0.1'
    ss.source_files = 'src/**/*.{h,c,cc}', 'include/avif/*.h', 'src/codec_aom.c'
    ss.public_header_files = 'include/avif/avif.h'
    ss.exclude_files = 'src/codec_dav1d.c'
    ss.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/libavif/include $(PODS_TARGET_SRCROOT)/include ${PODS_ROOT}/libaom/aom',
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) AVIF_CODEC_AOM=1'
    }
  end

  s.subspec 'libdav1d' do |ss|
    ss.dependency 'libdav1d', '>= 0.4.0'
    ss.dependency 'libavif/libaom' # AVIF Encoding still need aom
    ss.source_files = 'src/codec_dav1d.c'
    ss.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libdav1d/dav1d/include',
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) AVIF_CODEC_DAV1D=1'
    }
  end

  # default with aom
  s.default_subspecs = 'libaom'
  s.preserve_paths = 'src', 'include/avif'
end
