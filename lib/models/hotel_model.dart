class Hotel {
  final int id;
  final String title;
  final String description;
  final String address;
  final String smallImage;
  final String latitude;
  final String longitude;

  Hotel({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.smallImage,
    required this.longitude,
    required this.latitude
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      smallImage: json['image']['small'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
