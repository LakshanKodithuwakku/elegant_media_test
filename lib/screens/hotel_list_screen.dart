import 'package:elegant_media_test/screens/details_screen.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/hotel_model.dart';
import '../services/hotel_service.dart';


List<Hotel> hotels = [];
class HotelListScreen extends StatefulWidget {
  final String fbName;
  final String fbEmail;
  final String fbId;
  final String fbAccessToken;

  const HotelListScreen(
      {Key? key,
        required this.fbName,
        required this.fbEmail,
        required this.fbId,
        required this.fbAccessToken})
      : super(key: key);

  @override
  _HotelListScreenState createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  bool isLoading = true;
  final HotelService _hotelService = HotelService();


  @override
  void initState() {
    super.initState();
    _fetchHotels();
  }

  Future<void> _fetchHotels() async {
    try {
      final _hotels = await _hotelService.fetchHotels();
      setState(() {
        hotels = _hotels;
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      print('Error fetching hotels: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('List View',
          style: new TextStyle(
            color: textBlack,
            fontSize: width * 0.06,
            fontWeight: FontWeight.w500,
          ),),
        backgroundColor: appbarcolor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex:
            1, // You can adjust the flex value to control the distribution of remaining space
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Text(widget.fbName, style: TextStyle(fontSize: 25),),
                    Text(widget.fbEmail, style: TextStyle(
                      color: textGrey,
                    ),),
                    ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: appbarcolor, // Set the background color
                        onPrimary: textWhite, // Set the text color
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10), // Set padding
                        textStyle: TextStyle(fontSize: 18), // Set text style
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Set border radius
                        ),
                      ),
                      child: Text("Logout"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: height * 0.7,
            child: isLoading ? Center(child: CircularProgressIndicator(color: appbarcolor,)) : ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(hotel.title,style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),),
                      subtitle: Text(hotel.address,
                        style: TextStyle(
                            color: textGrey,
                        ),
                      ),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: appbarcolor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://assets.vogue.in/photos/5ce435fecc50be4b0d1402b4/2:3/w_2560%2Cc_limit/Shivani-the-Indian-artist-from-Now-United.jpg"),
                    //  hotel.smallImage),
                          ),
                        ),
                      ), //Icon(Icons.star),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => DetailScreen(hotelId: hotel.id,))));
                      },
                    ),
                    Container(
                      width: width*0.9,
                      child: Divider(
                        height: 1,
                        color: textGrey,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

