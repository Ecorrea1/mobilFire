import 'package:flutter/material.dart';
import 'package:mobilfire/src/models/userModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = User();

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawer(),
        appBar: _appBar(),
        body: _body(),
        floatingActionButton: _floatButton());
  }

  getProfile() async {
    var user = await User().getUser(1);
    if (user != null && user is! Widget) {
      setState(() {
        this.user = user;
      });
    }
  }

  _drawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(this.user.name),
            accountEmail: Text(this.user.email),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(this.user.image), fit: BoxFit.fill)),
            ),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      //leading: I,
      title: Text(
          'Bienvenido ${user.name.split(" ")[0]}'), //Sirve solo para que muestre el nombre y no todo el string
    );
  }

  _body() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            'Que te trae por aca ${user.name} hace rato que no te vemos por aca'),
      ),
    );
  }

  _floatButton() {
    return FloatingActionButton(child: Icon(Icons.add), onPressed: () {});
  }
}
