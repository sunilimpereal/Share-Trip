import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:share_trip/common_componenets/app_textField.dart';
import 'package:share_trip/constants/image_constants.dart';
import 'package:share_trip/modules/create_trip/widgets/date_picker.dart';
import 'package:share_trip/modules/create_trip/widgets/location_picker.dart';
import 'package:share_trip/modules/create_trip/widgets/vehichle_type.dart';

import '../widgets/container_box.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  TextEditingController startLocation = TextEditingController();
  TextEditingController endLocation = TextEditingController();
  TextEditingController noOfSeats = TextEditingController();
  TextEditingController pricePerPerson = TextEditingController();
  String selectedVehicle = "";
  DateTime selectedDate = DateTime.now();
  onSelectedVehicleChanged(String value) {
    log(value);
    setState(() {
      selectedVehicle = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Trip"),
      ),
      body: Column(
        children: [
          locationDetails(),
          vehicleTypeSelector(),
          startDateTime(),
          price()
        ],
      ),
      bottomNavigationBar: createTripButton(),
      
       
    );
  }

  Widget locationDetails() {
    return ContainerBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Location Details",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          LocationPicker(
            hintText: 'Pick Start Location',
            onChanged: (value) {},
            controller: startLocation,
          ),
          LocationPicker(
            hintText: 'Pick Destination',
            onChanged: (value) {},
            controller: endLocation,
          )
        ],
      ),
    );
  }

  Widget vehicleTypeSelector() {
    return ContainerBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Vehicle Type",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        VehicleBox(
                          onChanged: onSelectedVehicleChanged,
                          svgIcon: ImageConstants.bikeSvg,
                          value: 'bike',
                          selectedValue: selectedVehicle,
                        ),
                        VehicleBox(
                          onChanged: onSelectedVehicleChanged,
                          svgIcon: ImageConstants.carSvg,
                          value: 'car',
                          selectedValue: selectedVehicle,
                        ),
                        VehicleBox(
                          onChanged: onSelectedVehicleChanged,
                          svgIcon: ImageConstants.jeepSvg,
                          value: 'jeep',
                          selectedValue: selectedVehicle,
                        ),
                        VehicleBox(
                          onChanged: onSelectedVehicleChanged,
                          svgIcon: ImageConstants.busSvg,
                          value: 'bus',
                          selectedValue: selectedVehicle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Seats Free",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AppTextField(
                    keyboardType: TextInputType.number,
                    hintText: "4",
                    textAlign: TextAlign.center,
                    width: MediaQuery.of(context).size.width * 0.15,
                    controller: noOfSeats,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget startDateTime() {
    return ContainerBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Date"),
            const SizedBox(
              height: 4,
            ),
            AppTextField(
              keyboardType: TextInputType.number,
              hintText: "12-2-2023",
              textAlign: TextAlign.center,
              width: MediaQuery.of(context).size.width * 0.32,
              controller: noOfSeats,
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Start Time"),
                const SizedBox(
                  height: 4,
                ),
                AppTextField(
                  keyboardType: TextInputType.number,
                  hintText: "12:00 AM",
                  textAlign: TextAlign.center,
                  width: MediaQuery.of(context).size.width * 0.25,
                  controller: noOfSeats,
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("End Time"),
                const SizedBox(
                  height: 4,
                ),
                AppTextField(
                  keyboardType: TextInputType.number,
                  hintText: "12:90 PM",
                  textAlign: TextAlign.center,
                  width: MediaQuery.of(context).size.width * 0.25,
                  controller: noOfSeats,
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }

  Widget price() {
    return ContainerBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Price Per Person",style: TextStyle(
          fontWeight: FontWeight.w500

        ),),
          AppTextField(
                  keyboardType: TextInputType.number,
                  hintText: "300",
                  textAlign: TextAlign.center,
                  width: MediaQuery.of(context).size.width * 0.25,
                  controller: noOfSeats,
                ),
      ],
    ));
  }

  Widget createTripButton() {
    return Material(
      elevation: 2,

      child: Container(
        padding: const EdgeInsets.symmetric(vertical:16,horizontal:8),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.75,
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Create Trip"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

