import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:task1/core/failures/failures.dart';

class DeviceLocation {
  Future<Either<Failure, LatLng>> getCurrentLocation() async {
    final location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return left(ServiceDisabledFailure());
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return left(PermissionNotGrantedFailure());
      }
    }
    final locationData = await location.getLocation();
    return right(LatLng(locationData.latitude!, locationData.longitude!));
  }
}
