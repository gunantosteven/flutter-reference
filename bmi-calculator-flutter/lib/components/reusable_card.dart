import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.tapGesture});

  final Color colour;
  final Widget cardChild;
  final Function tapGesture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapGesture,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
