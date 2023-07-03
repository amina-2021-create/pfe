import 'package:flutter/material.dart';
import 'package:pfe/pages/S1.dart';
import 'package:pfe/pages/S4.dart';
import 'package:pfe/pages/S5.dart';
import 'package:pfe/pages/S6.dart';
import 'S2.dart';
import 'S3.dart';
import 'choix.dart';

class chef extends StatefulWidget {
  @override
  _chefState createState() => _chefState();
}

class _chefState extends State<chef> {
  bool showButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.analytics_outlined,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              title: Text('les absences'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => chef()),
                ); 
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              title: Text('Déconnexion'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Choix()),
                ); 
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showButtons = !showButtons;
                });
              },
              child: Text('DUT'),
            ),
            SizedBox(height: 30,
             width: 15,
            ),
            if (showButtons)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => S1()),
          );
                    },
                    child: Text('S1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => S2()),
                      );
                    },
                    child: Text('S2'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => S3()),
                      );
                    },
                    child: Text('S3'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => S4()),
                      );
                    },
                    child: Text('S4'),
                  ),
                ],
              ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showButtons = !showButtons;
                });
              },
              child: Text('License professionnelle'),
            ),
            if (showButtons)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => S5()),
                      );
                    },
                    child: Text('S5'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                     Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => S6()),
                      );
                    },
                    child: Text('S6'),
                  )
                ]
              )
          ],
        ),
      ),
    );
  }
}
