import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_trip/constants/image_constants.dart';
import 'package:share_trip/modules/create_trip/widgets/container_box.dart';


class TripDetails extends StatefulWidget {
  const TripDetails({super.key});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return ContainerBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            locationDetails(),
            vehicleDetails(),
          ],
        ),
      ),
    );
  }

  Widget locationDetails() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Chennai",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Bengaluru",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget vehicleDetails() {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          //vehicle image
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
            child: SvgPicture.asset(
              ImageConstants.busSvg,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          // date time details
          Row(
            children: const [
              Icon(Icons.calendar_month_outlined),
              Text(
                "12-3-2022",
                style: TextStyle(),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "12:50 AM",
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "12:50 AM",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
