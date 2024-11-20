import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class RateWidget extends StatefulWidget {
  final double value;
  final Color color;

  const RateWidget({super.key, required this.value, required this.color});

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {


  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: widget.value,
      valueLabelVisibility: false,
      starBuilder: (index, color) =>
          Icon(
            Icons.star_rate_rounded,
            color: color,
          ),
      starCount: 5,
      starSize: 20,
      maxValue: 5,
      starSpacing: 2,
      animationDuration: const Duration(milliseconds: 1000),
      starColor:  widget.color,
      starOffColor: Colors.transparent,
    );
  }
}