class Hotel {
  final int id;
  final String title;
  final String description;
  final String address;
  final String smallImage;

  Hotel({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.smallImage,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      smallImage: json['image']['small'],
    );
  }
}
