import 'dart:convert';

import 'package:flutter/material.dart';

enum View {
  List,
  Grid,
}

class Folder {
  String title;

  Folder({
    required this.title,
  });

  Folder copyWith({
    String? title,
    DateTime? createdAt,
    String? description,
    String? id,
  }) {
    return Folder(
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Folder.fromMap(Map<String, dynamic> map) {
    return Folder(
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Folder.fromJson(String source) => Folder.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Folder(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Folder && other.title == title;
  }

  @override
  int get hashCode {
    return title.hashCode;
  }
}
