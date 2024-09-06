class ExampleDTO {
  final int id;

  ExampleDTO({required this.id});

  Map<String, dynamic> toQueryParams() => {'id': id};
}
