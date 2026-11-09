/// Response models for the Link Scraper API.

/// API Response wrapper.
class LinkscraperResponse {
  final String status;
  final dynamic error;
  final LinkscraperData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  LinkscraperResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory LinkscraperResponse.fromJson(Map<String, dynamic> json) => LinkscraperResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? LinkscraperData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Link Scraper API.

class LinkscraperData {
  String? url;
  num? linkCount;
  num? externalLinkCount;
  num? internalLinkCount;
  List<LinkscraperDataLinksItem>? links;
  List<String>? uniqueDomains;
  bool? maxLinksReached;

  LinkscraperData({
    this.url,
    this.linkCount,
    this.externalLinkCount,
    this.internalLinkCount,
    this.links,
    this.uniqueDomains,
    this.maxLinksReached,
  });

  factory LinkscraperData.fromJson(Map<String, dynamic> json) => LinkscraperData(
      url: json['url'],
      linkCount: json['linkCount'],
      externalLinkCount: json['externalLinkCount'],
      internalLinkCount: json['internalLinkCount'],
      links: (json['links'] as List?)?.map((e) => LinkscraperDataLinksItem.fromJson(e)).toList(),
      uniqueDomains: (json['uniqueDomains'] as List?)?.cast<String>(),
      maxLinksReached: json['maxLinksReached'],
    );
}

class LinkscraperDataLinksItem {
  String? text;
  String? href;
  bool? external;

  LinkscraperDataLinksItem({
    this.text,
    this.href,
    this.external,
  });

  factory LinkscraperDataLinksItem.fromJson(Map<String, dynamic> json) => LinkscraperDataLinksItem(
      text: json['text'],
      href: json['href'],
      external: json['external'],
    );
}

class LinkscraperRequest {
  String url;
  num? maxlinks;
  bool? includequery;

  LinkscraperRequest({
    required this.url,
    this.maxlinks,
    this.includequery,
  });

  Map<String, dynamic> toJson() => {
      'url': url,
      if (maxlinks != null) 'maxlinks': maxlinks,
      if (includequery != null) 'includequery': includequery,
    };
}
