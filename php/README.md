# Link Scraper API - PHP Package

Link Scraper is a simple tool for scraping web page links. It returns all the links on a web page.

## Installation

Install via Composer:

```bash
composer require apiverve/linkscraper
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Linkscraper\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'url' => 'https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html',
    'maxlinks' => 20,
    'includequery' => false
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Linkscraper\Client;
use APIVerve\Linkscraper\Exceptions\APIException;
use APIVerve\Linkscraper\Exceptions\ValidationException;

try {
    $response = $client->execute(['url' => 'https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html', 'maxlinks' => 20, 'includequery' => false]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/linkscraper?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://linkscraper.apiverve.com?utm_source=php&utm_medium=readme](https://linkscraper.apiverve.com?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
