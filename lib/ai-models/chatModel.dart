class chatModel {
  final String msg;
  final int index;

  chatModel({required this.msg, required this.index});

  factory chatModel.fromJson(Map<String, dynamic> json) =>
      chatModel(msg: json['msg'], index: json['index']);
}
