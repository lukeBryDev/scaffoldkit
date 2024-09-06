class ExampleModel {
  final int? id;
  final String? name;

  ExampleModel({this.id, this.name});

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(
      id: int.tryParse('${json['id']}'),
      name: json['name'],
    );
  }
}
