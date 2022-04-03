import 'package:google_maps_flutter/google_maps_flutter.dart';

class Customer {
  final String name, id;
  final LatLng location;

//<editor-fold desc="Data Methods">

  const Customer({
    required this.name,
    required this.id,
    required this.location,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          location == other.location);

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ location.hashCode;

  @override
  String toString() {
    return 'Customer{' +
        ' name: $name,' +
        ' id: $id,' +
        ' location: $location,' +
        '}';
  }

  Customer copyWith({
    String? name,
    String? id,
    LatLng? location,
  }) {
    return Customer(
      name: name ?? this.name,
      id: id ?? this.id,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'id': this.id,
      'location': this.location,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] as String,
      id: map['id'] as String,
      location: map['location'] as LatLng,
    );
  }

//</editor-fold>
}
