import 'package:flutter/material.dart';

class Content {
  final String name;
  final String imageUrl;
  final String? titleImageUrl; // Add nullable (?) type for optional properties
  final String? videoUrl; // Add nullable (?) type for optional properties
  final String? description; // Add nullable (?) type for optional properties
  final Color? color; // Add nullable (?) type for optional properties

  const Content({
    required this.name,
    required this.imageUrl,
    this.titleImageUrl,
    this.videoUrl,
    this.description,
    this.color,
  });
}
