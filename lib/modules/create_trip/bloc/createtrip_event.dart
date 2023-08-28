part of 'createtrip_bloc.dart';

abstract class CreateTripEvent {
  const CreateTripEvent();
}

class CreateTripInitialEvent extends CreateTripEvent {
  const CreateTripInitialEvent();
}

class CreateTripSubmitEvent extends CreateTripEvent {
  const CreateTripSubmitEvent();
}

class CreateTripChangedEvent extends CreateTripEvent {
  final CreateTripModel createTripModel;
  const CreateTripChangedEvent({required this.createTripModel});
}

class CreateTripErrorEvent extends CreateTripEvent {
  const CreateTripErrorEvent();
}
