import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController cityTextController;
  final FocusNode focusNode;
  const CustomTextField({
    Key? key,
    required this.cityTextController,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final hintText = "City";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingNormal,
      child: TextFormField(
          controller: widget.cityTextController,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(context.normalRadius),
            ),
          ),
          textAlign: TextAlign.center),
    );
  }
}
