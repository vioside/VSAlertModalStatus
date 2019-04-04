Pod::Spec.new do |s|
  s.name         = "VSAlertModalStatus"
  s.version      = "0.0.4"
  s.summary      = "Status alert popup identical to iOS Music app status changes"
  s.description  = <<-DESC
  A quick and easy way to create iOS-app-like (example Music app) status modal alerts using one line of code.
                   DESC
  s.homepage     = "https://github.com/vioside/VSAlertModalStatus"
  s.license      = "MIT"
  s.authors            = { "Steve" => "stevescerri@vioside.com", "Vioside" => "team@vioside.com" }
  s.social_media_url   = "https://twitter.com/SteveScerri"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/vioside/VSAlertModalStatus.git", :tag => "v0.0.4" }
  s.source_files = "VSAlertModalStatus/*.{swift,h}"
  s.resources = 'VSAlertModalStatus/*.{xib}'
  s.swift_version = "4.2"

end
