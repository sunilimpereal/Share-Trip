import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  final Widget child;
  const ContainerBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        elevation: 0.4,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
              // color: Colors.white,
              border: Border.all(width: 0.1, color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
