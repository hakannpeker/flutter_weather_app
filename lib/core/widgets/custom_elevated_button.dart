import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomElevatedButton extends StatefulWidget {
  final Function() onPressed;
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  final String elevatedButtonText = "Search for Forecast";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(elevatedButtonText),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(context.lowRadius),
      )),
    );
  }
}
