# Link Scraper API - Ruby Gem

Link Scraper is a website link extractor API that pulls internal and external links from any webpage URL in real time. It resolves relative paths to absolute URLs, strips empty fragments, and returns anchor text with internal and external counts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_linkscraper'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_linkscraper
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_linkscraper'

# Initialize the client
client = APIVerve::Linkscraper::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  url: "https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html",
  maxlinks: 20,
  includequery: false
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ url: "https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html", maxlinks: 20, includequery: false })
  puts response["data"]
rescue APIVerve::Linkscraper::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Linkscraper::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Linkscraper::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "url": "http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html",
    "linkCount": 16,
    "externalLinkCount": 13,
    "internalLinkCount": 3,
    "links": [
      {
        "text": "Documentation",
        "href": "http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html/index.html",
        "external": false
      },
      {
        "text": "Amazon EC2 Instance Types Guide",
        "href": "https://docs.aws.amazon.com/ec2/latest/instancetypes/instance-types.html",
        "external": true
      },
      {
        "text": "Amazon EC2 Auto Scaling",
        "href": "https://docs.aws.amazon.com/autoscaling/",
        "external": true
      }
    ],
    "uniqueDomains": [
      "docs.aws.amazon.com",
      "aws.amazon.com"
    ],
    "maxLinksReached": false
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/linkscraper?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/linkscraper?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/linkscraper?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
