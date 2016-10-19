Pod::Spec.new do |s|

  s.name         = "SwiftCommon"
  s.version      = "1.0.4"
  s.summary      = "Common Swift extensions and helpers."
  s.description  = <<-DESC
    Swift extensions and helpers for __ANY__ OS.  Collections, Strings etc.
  DESC

  s.homepage     = "https://github.com/andrewbradnan/swiftcommon"
  s.author       = "Andrew Bradnan"

  # only because we are using frameworks
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/andrewbradnan/swiftcommon.git", :tag => s.version }
  s.source_files  = "Classes", "SwiftCommon/**/*.{swift}"
end
