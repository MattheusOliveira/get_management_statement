class MyModel {

  int?id;
  String? title;
  String? body;

  MyModel({this.id, this.title, this.body});

  MyModel.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body
    };
  }

}