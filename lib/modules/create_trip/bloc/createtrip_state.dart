part of 'createtrip_bloc.dart';

class CreateTripState {
  final CreateTripModel? createTripModel;
  const CreateTripState({this.createTripModel});

  CreateTripState copyWith({CreateTripModel? createTripModel}) {
    return CreateTripState(
      createTripModel: CreateTripModel(
        startLocation: createTripModel?.startLocation ?? this.createTripModel?.startLocation,
        endLocation: createTripModel?.endLocation ?? this.createTripModel?.endLocation,
        vehicleType: createTripModel?.vehicleType ?? this.createTripModel?.vehicleType,
        date: createTripModel?.date ?? this.createTripModel?.date,
        seatsFree: createTripModel?.seatsFree ?? this.createTripModel?.seatsFree,
        startTime: createTripModel?.startTime ?? this.createTripModel?.startTime,
        endTime: createTripModel?.endTime ?? this.createTripModel?.endTime,
        description: createTripModel?.description ?? this.createTripModel?.description,
        pricePerPerson: createTripModel?.pricePerPerson ?? this.createTripModel?.pricePerPerson,
        createdAt: createTripModel?.createdAt ?? this.createTripModel?.createdAt,
        userId: createTripModel?.userId ?? this.createTripModel?.userId,
      ),
    );
  }
}

class CreateTripInitialState extends CreateTripState {
  const CreateTripInitialState();
}

class CreateTripLoadingState extends CreateTripState {
  const CreateTripLoadingState();
}

class CreateTripSuccessState extends CreateTripState {
  final String id;
  const CreateTripSuccessState({required this.id});
}

class CreateTripErrorState extends CreateTripState {
  const CreateTripErrorState();
}
