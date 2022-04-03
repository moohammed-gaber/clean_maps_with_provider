import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task1/features/map/data/remote/models/customer.dart';

class MapRemoteDataSource {
  Future<List<Customer>> getCustomers() async {
    await Future.delayed(Duration(seconds: 3));
    return [
      Customer(name: 'Customer 1', id: '1', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 2', id: '2', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 3', id: '3', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 4', id: '4', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 5', id: '5', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 6', id: '6', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 7', id: '7', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 8', id: '8', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 9', id: '9', location: LatLng(10.8, 106.6)),
      Customer(name: 'Customer 10', id: '10', location: LatLng(10.8, 106.6))
    ];
  }
}
