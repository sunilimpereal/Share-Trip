import 'package:flutter/material.dart';

class AppTimePicker extends StatefulWidget {
  final TimeOfDay? initaialDate;
  final Function(TimeOfDay) onChanged;
  final double? width;

  const AppTimePicker({
    super.key,
    this.initaialDate,
    required this.onChanged,
    this.width,
  });

  @override
  State<AppTimePicker> createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
  TimeOfDay? picked;
  Future<void> _selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Center(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          ),
        );
      },
    );
    if (picked != null) {
      setState(() {});
      picked != null ? widget.onChanged(picked!) : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectTime(context);
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
              hintText: picked != null ? picked!.format(context) : "Pick",
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
