class FilteredModel {
  final int id;
  final String name;
  final String imageURL;

  FilteredModel({
    required this.id,
    required this.name,
    required this.imageURL,
  });

  factory FilteredModel.fromJson(Map<String, dynamic> json) {
    print("Parsing Restaurant JSON: $json");

    return FilteredModel(
      id: json.containsKey('id')
          ? (json['id'] is int
              ? json['id']
              : int.tryParse(json['id'].toString()) ?? 0)
          : 0,
      name: json.containsKey('restaurantName')
          ? json['restaurantName'].toString()
          : 'Unknown',
      imageURL: json.containsKey('image') ? json['image'].toString() : '',
    );
  }
}
