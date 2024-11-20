import 'package:flutter/material.dart';

class CoffeeItem {
  final String name;
  final double price;
  final String imageUrl;
  bool isLiked;
  final String description;
  final double rating;
  final String type; // Coffee type (e.g., Espresso, Latte, etc.)
  final String flavor; // Coffee flavor (e.g., Vanilla, Hazelnut, etc.)
  final String brewTime; // Brew time (e.g., 5 minutes)
  int count = 1; // Selected count
  final List<Color> gradientColors; // Color gradient for the coffee item

  // Constructor to accept new fields including gradientColors
  CoffeeItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isLiked,
    required this.description,
    required this.rating,
    required this.type,
    required this.flavor,
    required this.brewTime,
    required this.gradientColors, // Accepting gradientColors as a parameter
  });
}
