import 'package:flutter/material.dart';
import 'package:fluuter_front_end/Screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()),
                    (Route<dynamic> route) => false);
                //sharedPreferences.commit();
              },
              child: Text("Log Out", style: TextStyle(color: Colors.blue)),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('My App'),
              accountEmail: Text(''),
            ),
            Divider(),
            ListTile(
              title: Text('Text1'),
              trailing: Icon(Icons.fitness_center),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
