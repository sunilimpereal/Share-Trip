import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final double? width;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final Function(String)? onChanged;
  const AppTextField({
    super.key,
    this.width,
    this.keyboardType,
    this.textAlign,
    required this.hintText,
     this.controller, this.onChanged
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 0.5,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign ?? TextAlign.left,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: widget.hintText, isDense: true, contentPadding: const EdgeInsets.symmetric(vertical: 8)),
      ),
    );
  }
}
