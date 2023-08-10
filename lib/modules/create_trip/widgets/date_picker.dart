import 'dart:developer';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:share_trip/constants/color_constants.dart';

class DateAndTimePicker extends StatefulWidget {
  final Function(DateTime) onChanged;
  const DateAndTimePicker({super.key, required this.onChanged});

  @override
  State<DateAndTimePicker> createState() => _DateAndTimePickerState();
}

class _DateAndTimePickerState extends State<DateAndTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Start Date and Time",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          // Material(
          //   elevation: 2,
          //   child: InkWell(
          //     onTap: () {
          //       log("message");

          //     },
          //     child: Container(
          //       padding: const EdgeInsets.all(8),
          //       width: MediaQuery.of(context).size.width * 0.32,
          //       decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2, color: ColorConstants.primaryColor))),
          //       child: const Column(
          //         children: [
          //           Text(
          //             "dd/MMM/YYY",
          //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          //           ),
          //           Text(
          //             "4:00 PM",
          //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          Container(
            // width: 300,
            height: 50,
            child: DateTimePicker(
              type: DateTimePickerType.dateTime,
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Start Date Time',
              decoration: const InputDecoration(contentPadding: EdgeInsets.only()),
              onChanged: (val) {
                widget.onChanged(DateTime.parse(val));
              },
              validator: (val) {
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
