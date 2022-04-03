import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task1/features/map/data/remote/models/customer.dart';

class CustomersState {}

class CustomersIdle extends CustomersState {}

class CustomersLoadingInProgress extends CustomersState {}

class CustomersLoadingSuccess extends CustomersState {
  final List<Customer> customers;

  CustomersLoadingSuccess({required this.customers});
}

class CurrentLocationState {}

class CurrentLocationIdle extends CurrentLocationState {}

class CurrentLocationLoadingInProgress extends CurrentLocationState {}

class CurrentLocationLoadingSuccess extends CurrentLocationState {
  final LatLng currentLocation;

  CurrentLocationLoadingSuccess({required this.currentLocation});
}

class CurrentLocationStateFailure extends CurrentLocationState {}

class CurrentLocationServiceDisabledFailure
    extends CurrentLocationStateFailure {}

class CurrentLocationPermissionNotGrantedFailure
    extends CurrentLocationStateFailure {}
