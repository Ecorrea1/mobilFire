import 'package:mobilfire/common/Validate.dart';
import 'package:mobilfire/src/providers/endPoint.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  String image;

  User(
      {this.id = 0,
      this.name = "",
      this.username = "",
      this.email = "",
      this.image = ""});

  factory User.fromJson(Map<dynamic, dynamic> data) {
    if (data == null) return null;

    Validate validate = Validate(data);

    return User(
        id: validate.keyExist('id', defaul: 0),
        name: validate.keyExist('name'),
        username: validate.keyExist('username'),
        email: validate.keyExist('email'),
        image: validate.keyExist('image'));
  }

  Future getUser(id) async {
    var data = await EndPoint.getUser(id);
    return Validate(data).isWidget(getObject);
  }

  getObject(data) {
    return User.fromJson(data);
  }
}
