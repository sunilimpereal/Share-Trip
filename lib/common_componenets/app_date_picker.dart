import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatefulWidget {
  final DateTime initaialDate;
  final Function(DateTime) onChanged;
  final double? width;

  const AppDatePicker({
    super.key,
    required this.initaialDate,
    required this.onChanged,
    this.width,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? picked;
  Future<void> _selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != DateTime.now()) {
      picked != null ? widget.onChanged(picked!) : null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
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
        child: AbsorbPointer(
          child: TextField(
            keyboardType: null,
            readOnly: true,
            style: const TextStyle(fontWeight: FontWeight.normal),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: picked != null ? DateFormat("dd/MM/yyyy").format(picked!) : "Pick",
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
