Pod::Spec.new do |s|

  s.name         = "SwiftCommon"
  s.version      = "0.0.4"
  s.summary      = "Common Swift extensions and helpers."
  s.description  = <<-DESC
    Swift extensions and helpers for __ANY__ OS.  Collections, Strings etc.
  DESC

  s.homepage     = "https://bitbucket.org/NullPlague/swiftcommon"
  s.license      = { :type => "Belkin International Software License", :url => "http://www.belkin.com/us/end-user-license-agreement/" }
  s.author             = "Andrew Bradnan"
  s.social_media_url   = "http://twitter.com/NullPlague"
  
  # only because we are using frameworks
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://bitbucket.org/NullPlague/swiftcommon.git", :tag => s.version }
  s.source_files  = "Classes", "SwiftCommon/**/*.{swift}"
end