import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String? image;
  final String category;
  final String name;
  final String subCategory;
  final double price;
  final Color bgColor;
  final IconData icon;
  final String mainPicture;

  ProductModel( {
    required this.id,
    required this.category,
    this.image,
    required this.name,
    required this.price,
    required this.subCategory,
    required this.bgColor,
    required this.icon,
    required this.mainPicture,
  });
}
