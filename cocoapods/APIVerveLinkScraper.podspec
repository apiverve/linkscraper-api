Pod::Spec.new do |s|
  s.name             = 'APIVerveLinkScraper'
  s.version          = '1.2.3'
  s.summary          = 'Link Scraper is a website link extractor API that pulls internal and external links from any webpage URL in real time.'
  s.description      = <<-'DESC'
Link Scraper is a website link extractor API that pulls internal and external links from any webpage URL in real time. It resolves relative paths to absolute URLs, strips empty fragments, and returns anchor text with internal and external counts.

This iOS/macOS SDK provides a convenient way to access the Link Scraper from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/linkscraper?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/linkscraper-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveLinkScraper/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
