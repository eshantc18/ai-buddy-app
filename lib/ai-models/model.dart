class Model {
  late final String id;
  late final String root;
  late final int created;

  Model({required this.id, required this.root, required this.created});

  factory Model.fromJson(Map<String, dynamic> json) =>
      Model(id: json['id'], root: json['root'], created: json['created']);

  static List<Model> aiModelsFromSnapshot(List aiModels) {
    return aiModels.map((data) => Model.fromJson(data)).toList();
  }
}
