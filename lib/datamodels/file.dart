import 'dart:convert';

class File {
  final String title;
  final String url;
  File({
    required this.title,
    required this.url,
  });

  File copyWith({
    String? title,
    String? url,
  }) {
    return File(
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
    };
  }

  factory File.fromMap(Map<String, dynamic> map) {
    return File(
      title: map['title'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory File.fromJson(String source) => File.fromMap(json.decode(source));

  @override
  String toString() {
    return 'File(title: $title, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is File && other.title == title && other.url == url;
  }

  @override
  int get hashCode {
    return title.hashCode ^ url.hashCode;
  }
}
