import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VehicleBox extends StatefulWidget {
  final String svgIcon;
  final String value;
  final Function(String) onChanged;
  final String selectedValue;
  const VehicleBox({super.key, required this.onChanged, required this.svgIcon, required this.value, required this.selectedValue});

  @override
  State<VehicleBox> createState() => _VehicleBoxState();
}

class _VehicleBoxState extends State<VehicleBox> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedValue == widget.value;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          widget.onChanged(widget.value);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.5,color: isSelected ? Colors.blue.shade300 : Colors.grey.shade300 ),
            color: isSelected ? Colors.blue.shade200 : Colors.grey.shade200,
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              widget.svgIcon,
              color: isSelected?Colors.black: Colors.black,
            ),
          )),
        ),
      ),
    );
  }
}
