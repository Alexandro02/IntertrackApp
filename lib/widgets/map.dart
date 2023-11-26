// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class InterMap extends StatefulWidget {
  const InterMap({
    Key? key,
  }) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<InterMap> {
  // Setting up MAP
  final String apiKey = "E5W2G5zaKeyf8sGShKMGTaUiYABLKNgp";
  final tomtomZoom = 18.0;
  late LatLng tomtomHQ = LatLng(13.7812, -12.5251);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    timer = Timer.periodic(
        Duration(seconds: 10), (Timer t) => getCurrentLocation());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  //Se utiliza el método getCurrentLocation para obtener las coordenadas actuales del dispositivo
  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.checkPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        tomtomHQ = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen's width and height.
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              initialCenter: tomtomHQ,
              initialZoom: tomtomZoom,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                    "{z}/{x}/{y}.png?key={apiKey}",
                additionalOptions: {"apiKey": apiKey},
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: tomtomHQ,
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
