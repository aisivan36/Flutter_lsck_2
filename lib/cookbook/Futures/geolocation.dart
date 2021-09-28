import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    getPosition().then((Position myPos) {
      myPosition = 'Latitude: ' +
          myPos.latitude.toString() +
          ' -Longtitude: ' +
          myPos.longitude.toString();
      setState(() {
        myPosition = myPosition;
      });
    });
    super.initState();
  }

  Future<Position> getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location'),
      ),
      body: Center(
        child: Text(myPosition),
      ),
    );
  }
}
