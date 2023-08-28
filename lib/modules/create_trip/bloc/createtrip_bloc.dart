import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_trip/modules/create_trip/services/create_trip_services.dart';
import '../models/create_trip_model.dart';
part 'createtrip_event.dart';
part 'createtrip_state.dart';

class CreateTripBloc extends Bloc<CreateTripEvent, CreateTripState> {
  CreateTripBloc() : super(const CreateTripState()) {
    on<CreateTripInitialEvent>((event, emit) {});
    on<CreateTripSubmitEvent>((event, emit) async {
      log(state.createTripModel?.toJson().toString() ?? 'no model');
      state.createTripModel?.userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      String? id = await CreateTripServices().createTrip(createTripModel: state.createTripModel!);
      emit(CreateTripSuccessState(id: id ?? "No ID"));
    });
    on<CreateTripChangedEvent>((event, emit) {
      emit(
        state.copyWith(createTripModel: event.createTripModel),
      );
    });
  }
}
