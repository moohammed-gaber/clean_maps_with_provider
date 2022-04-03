import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task1/core/device/device_location/device_location.dart';
import 'package:task1/features/map/data/remote/data_sources/map_remote_data_source.dart';
import 'package:task1/features/map/presentation/manager/states.dart';

class MapManager with ChangeNotifier {
  MapManager(this._mapRemoteDataSource, this.deviceLocation) {
    customersState = CustomersIdle();
    getCustomers();
  }

  final Completer<GoogleMapController> googleMapCompleter = Completer();

  final MapRemoteDataSource _mapRemoteDataSource;
  final DeviceLocation deviceLocation;

  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CustomersState customersState = CustomersState();

  Future<void> getCurrentLocation(BuildContext context) async {
    final currentLocation = await deviceLocation.getCurrentLocation();
    currentLocation.fold((l) {
      if (l is CurrentLocationServiceDisabledFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('الموقع غير متاح قم بتفعيل ال gps')));
      }
      if (l is CurrentLocationPermissionNotGrantedFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('صلاحيه الوصول الموقع غير مفعله قم بتفعيلها')));
      }
    }, (r) async {
      final googleMapController = await googleMapCompleter.future;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(r.latitude, r.longitude),
            zoom: 15,
          ),
        ),
      );
    });
  }

  Future<void> getCustomers() async {
    customersState = CustomersLoadingInProgress();
    notifyListeners();
    final customers = await _mapRemoteDataSource.getCustomers();
    customersState = CustomersLoadingSuccess(customers: customers);
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapCompleter.complete(controller);
  }
}
