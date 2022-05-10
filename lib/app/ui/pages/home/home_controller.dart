import 'dart:async';

import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/map_style.dart';

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();
  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(25.2034482, -99.8459883),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    final marker = Marker(
        markerId: markerId,
        position: position,
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        onTap: () {
          _markersController.sink.add(id);
        },
        onDragEnd: (newPosition) {
          print("new position $newPosition");
        });
    _markers[markerId] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
