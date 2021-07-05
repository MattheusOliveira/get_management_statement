

class Users {
  late List<User> users;

  Users({required this.users});

  Users.fromJson(List<dynamic> json) {
    users = json.map((e) => User.fromJson(e)).toList();
  }

  List<dynamic> toJson() {
    return users;
  }
}


class User {
  late String id;
  late String name;
  late String username;

  User({required this.id, required this.name, required this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String,dynamic> toJson() {
    return {
      id:'id',
      name: 'name',
      username: 'username' 
    };
  }


}