import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/colors.dart';
import 'hotel_list_screen.dart';

class MapScreen extends StatefulWidget {
  final int hotelId;
  const MapScreen({Key? key, required this.hotelId}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  @override
  Widget build(BuildContext context) {
    final int index = widget.hotelId - 1;
    final hotel = hotels[index];
    double latValue = double.parse(hotel.latitude) ;
    double lngValue = double.parse(hotel.longitude) ;
    LatLng sourceLocation = LatLng(latValue, lngValue);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Map',
          style: new TextStyle(
            color: textBlack,
            fontSize: width * 0.06,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: appbarcolor,
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: sourceLocation,
        ),
        markers: {
          Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
        },
      ),
    );
  }
}
