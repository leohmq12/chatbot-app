class TaxModel {
  final String title;
  final String description;

  TaxModel({required this.title, required this.description});

  factory TaxModel.fromMap(Map<String, dynamic> data) {
    return TaxModel(
      title: data['title'],
      description: data['description'],
    );
  }
}