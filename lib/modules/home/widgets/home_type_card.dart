import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';

class HomeTypeCard extends StatelessWidget {
  final String title;
  final Function ontap;
  const HomeTypeCard({super.key,required this.ontap,required this.title,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ColorConstants.primaryColor,),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),),
        ),
      ),
    );
  }
}
