import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constant.dart';
import '../models/hotel_model.dart';

class HotelService {
  final String _baseUrl = hotelAPI;

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
