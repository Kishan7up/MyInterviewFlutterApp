

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LocationPermission? permission;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location Track App"),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {


               /* final LocationSettings locationSettings = LocationSettings(
                  accuracy: LocationAccuracy.high,
                  distanceFilter: 100,
                );
                StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
                        (Position? position) {
                      print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
                    });*/



                permission = await Geolocator.checkPermission();
                if (permission == LocationPermission.denied) {
                  permission = await Geolocator.requestPermission();
                  if (permission == LocationPermission.denied) {
                    // Permissions are denied, next time you could try
                    // requesting permissions again (this is also where
                    // Android's shouldShowRequestPermissionRationale
                    // returned true. According to Android guidelines
                    // your App should show an explanatory UI now.
                    return Future.error('Location permissions are denied');
                  }
                }

               else if (permission == LocationPermission.deniedForever) {
                  // Permissions are denied forever, handle appropriately.
                  return Future.error(
                      'Location permissions are permanently denied, we cannot request permissions.');
                }

                // When we reach here, permissions are granted and we can
                // continue accessing the position of the device.
                else{

                  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

                  print(position.latitude.toString() + " Longitude : " + position.longitude.toString());

                }

              },
              child: Text("Start",style: TextStyle(fontSize: 18),),
            ),
          ),
          SizedBox(width: 20,),
          Center(
            child: ElevatedButton(
              onPressed: (){

              },
              child: Text("Show Co-Ordinates",style: TextStyle(fontSize: 18),),
            ),
          ),
        ],
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }




}
