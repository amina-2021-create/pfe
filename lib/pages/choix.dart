import 'package:flutter/material.dart';
import 'loginchef.dart';
import 'login.dart';

class Choix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Auth1()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/img/DEP.png',
                  width: 310,
                  height: 250,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Auth()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/img/professeur.png',
                  width: 300,
                  height: 250,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
