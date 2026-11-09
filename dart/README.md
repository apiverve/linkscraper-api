# Link Scraper API - Dart/Flutter Client

Link Scraper is a website link extractor API that pulls internal and external links from any webpage URL in real time. It resolves relative paths to absolute URLs, strips empty fragments, and returns anchor text with internal and external counts.

[![pub package](https://img.shields.io/pub/v/apiverve_linkscraper.svg)](https://pub.dev/packages/apiverve_linkscraper)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Link Scraper API](https://apiverve.com/marketplace/linkscraper?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_linkscraper: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_linkscraper/apiverve_linkscraper.dart';

void main() async {
  final client = LinkscraperClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'url': 'https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html',
      'maxlinks': 20,
      'includequery': false
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Link Scraper API](https://apiverve.com/marketplace/linkscraper?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/linkscraper](https://docs.apiverve.com/ref/linkscraper?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
