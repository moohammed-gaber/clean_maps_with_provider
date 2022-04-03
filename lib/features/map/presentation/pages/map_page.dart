import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';
import 'package:task1/core/device/device_location/device_location.dart';
import 'package:task1/features/map/data/remote/data_sources/map_remote_data_source.dart';
import 'package:task1/features/map/presentation/manager/manager.dart';
import 'package:task1/features/map/presentation/manager/states.dart';

class MapPageProvider extends StatelessWidget {
  const MapPageProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) {
          return MapManager(MapRemoteDataSource(), DeviceLocation());
        },
        child: MapPage());
  }
}

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*
    OneContext().showSnackBar(builder: (BuildContext? x) {
      return SnackBar(content: Text('الموقع غير متاح قم بتفعيل ال gps'));
    });
*/
    return Scaffold(
      body: Consumer<MapManager>(
        builder: (context, value, child) {
          final state = value.customersState;
          if (state is CustomersLoadingSuccess) {
            return GoogleMap(
              circles: {
                Circle(
                    circleId: CircleId('1'),
                    center: LatLng(30, 30),
                    radius: 50),
              },
              myLocationButtonEnabled: true,
              buildingsEnabled: true,
              markers: state.customers
                  .map((customer) => Marker(
                        markerId: MarkerId(customer.id),
                        position: customer.location,
                        infoWindow: InfoWindow(
                          title: customer.name,
                          snippet: customer.name,
                        ),
                      ))
                  .toSet(),
              onMapCreated: value.onMapCreated,
              initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
