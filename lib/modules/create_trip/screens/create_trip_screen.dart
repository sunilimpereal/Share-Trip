import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_trip/common_componenets/app_date_picker.dart';
import 'package:share_trip/common_componenets/app_textField.dart';
import 'package:share_trip/common_componenets/app_time_picker.dart';
import 'package:share_trip/constants/image_constants.dart';
import 'package:share_trip/modules/create_trip/bloc/createtrip_bloc.dart';
import 'package:share_trip/modules/create_trip/models/create_trip_model.dart';
import 'package:share_trip/modules/create_trip/widgets/location_picker.dart';
import 'package:share_trip/modules/create_trip/widgets/vehichle_type.dart';

import '../widgets/container_box.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  String selectedVehicle = "car";
  DateTime selectedDate = DateTime.now();
  onSelectedVehicleChanged(String value) {
    log(value);
    setState(() {
      selectedVehicle = value;
      context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(vehicleType: value)));
    });
  }

  @override
  Widget build(BuildContext context) {
    log(FirebaseAuth.instance.currentUser?.uid.toString() ?? "No user");
    return BlocListener<CreateTripBloc, CreateTripState>(
      listener: (context, state) {
        if (state is CreateTripSuccessState) {
          return;
        }
      },
      child: BlocProvider(
        create: (context) => CreateTripBloc(),
        child: Builder(builder: (context) {
          return Scaffold(
            // resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text("Create Trip"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  locationDetails(),
                  vehicleTypeSelector(),
                  startDateTime(),
                  price(),
                  description(),
                  const SizedBox(
                    height: 24,
                  )
                ],
              ),
            ),
            bottomNavigationBar: createTripButton(),
          );
        }),
      ),
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
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          LocationPicker(
            hintText: 'Pick Start Location',
            onChanged: (value) {
              context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(startLocation: value)));
            },
          ),
          LocationPicker(
            hintText: 'Pick Destination',
            onChanged: (value) {
              context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(endLocation: value)));
            },
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Vehicle Type",
                        style: TextStyle(
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
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: Text(
                      "Seats \nFree",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AppTextField(
                    keyboardType: TextInputType.number,
                    hintText: "4",
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(seatsFree: value)));
                    },
                    width: MediaQuery.of(context).size.width * 0.15,
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
            AppDatePicker(
              initaialDate: DateTime.now(),
              width: MediaQuery.of(context).size.width * 0.32,
              onChanged: (value) {
                context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(date: value.toString())));
              },
            )
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
                AppTimePicker(
                    width: MediaQuery.of(context).size.width * 0.25,
                    onChanged: (value) {
                      context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(startTime: value.format(context))));
                    })
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
                AppTimePicker(
                    width: MediaQuery.of(context).size.width * 0.25,
                    onChanged: (value) {
                      context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(endTime: value.format(context))));
                    })
              ],
            ),
          ],
        ),
      ],
    ));
  }

  Widget description() {
    return ContainerBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Price Per Person",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        AppTextField(
          keyboardType: TextInputType.number,
          hintText: "300",
          textAlign: TextAlign.center,
          onChanged: (value) {
            context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(pricePerPerson: value.toString())));
          },
          width: MediaQuery.of(context).size.width * 0.25,
        ),
      ],
    ));
  }

  Widget price() {
    return ContainerBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Description",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        AppTextField(
          keyboardType: TextInputType.text,
          hintText: "anything to joiners?",
          textAlign: TextAlign.left,
          onChanged: (value) {
            context.read<CreateTripBloc>().add(CreateTripChangedEvent(createTripModel: CreateTripModel(pricePerPerson: value.toString())));
          },
          width: MediaQuery.of(context).size.width * 0.95,
        ),
      ],
    ));
  }

  Widget createTripButton() {
    return Material(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.75,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CreateTripBloc>().add(const CreateTripSubmitEvent());
                },
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
