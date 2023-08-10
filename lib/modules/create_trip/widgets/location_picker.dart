import 'package:flutter/material.dart';

class LocationPicker extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController controller;
  
  const LocationPicker({super.key, required this.hintText, required this.onChanged, required this.controller});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 70,
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
