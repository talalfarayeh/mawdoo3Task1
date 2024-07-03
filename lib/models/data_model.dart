class DataModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  DataModel({this.userId, this.id, this.title, this.body});

  DataModel.fromJson(Map<String, dynamic> json) {
    userId = _toInt(json['userId']);
    id = _toInt(json['id']);
    title = json['title']?.toString();
    body = json['body']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
