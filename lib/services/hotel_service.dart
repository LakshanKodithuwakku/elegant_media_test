import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hotel_model.dart';

class HotelService {
  final String _baseUrl =
      'https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json';

  Future<List<Hotel>> fetchHotels() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final hotelList = data['data'] as List<dynamic>;
      return hotelList.map((json) => Hotel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch hotels');
    }
  }
}
