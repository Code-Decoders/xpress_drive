import 'dart:convert';

import 'package:flutter/material.dart';

class Folder {
  final String title;
  final DateTime createdAt;
  final String type;
  final int id;

  Folder({
    required this.title,
    required this.createdAt,
    required this.type,
    required this.id,
  });

  Folder copyWith({
    String? title,
    DateTime? createdAt,
    String? type,
    int? id,
  }) {
    return Folder(
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'createdAt': createdAt,
      'type': type,
      'id': id,
    };
  }

  factory Folder.fromMap(Map<String, dynamic> map) {
    return Folder(
      title: map['title'] ?? '',
      createdAt: map['createdAt'] ?? '',
      type: map['type'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Folder.fromJson(String source) => Folder.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Folder(title: $title, createdAt: $createdAt, type: $type, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Folder &&
      other.title == title &&
      other.createdAt == createdAt &&
      other.type == type &&
      other.id == id;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      createdAt.hashCode ^
      type.hashCode ^
      id.hashCode;
  }
}
