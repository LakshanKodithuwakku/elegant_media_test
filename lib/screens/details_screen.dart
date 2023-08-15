import 'package:elegant_media_test/screens/map_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'hotel_list_screen.dart';

class DetailScreen extends StatefulWidget {
  final int hotelId;
  const DetailScreen({
    Key? key,
    required this.hotelId,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final int index = widget.hotelId - 1;
    final hotel = hotels[index];
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
          'Details',
          style: new TextStyle(
            color: textBlack,
            fontSize: width * 0.06,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_pin,color: textBlack,size: 30,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => MapScreen(hotelId: hotel.id,
              ))));
            },
          ),
        ],
        backgroundColor: appbarcolor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: width * 0.5,
            height: width * 0.5,
            decoration: BoxDecoration(
              color: appbarcolor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(//(hotel.smallImage),
                    "https://assets.vogue.in/photos/5ce435fecc50be4b0d1402b4/2:3/w_2560%2Cc_limit/Shivani-the-Indian-artist-from-Now-United.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hotel.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              hotel.description,
              style: TextStyle(
                color: textGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
