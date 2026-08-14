import 'package:flutter/material.dart';

/// Represents a menu food category with presentation metadata.
class CategoryModel {
  final String id;
  final String name;
  final IconData icon;
  final String assetImage;
  final int itemCount;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.assetImage,
    this.itemCount = 0,
  });
}
