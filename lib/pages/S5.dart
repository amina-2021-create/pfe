
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pfe/pages/choix.dart';

import 'menu_chef.dart';


class S5 extends StatefulWidget {
  S5({Key? key});

  @override
  _GIState createState() => _GIState();
}

class _GIState extends State<S5> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('List absence S5 '))),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 10, 48, 79),
          child: ListView(
            // Remove padding
            padding: EdgeInsets.zero,
            children: [
              
              UserAccountsDrawerHeader(
                accountName: Text('X'),
                accountEmail: Text('X@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 67, 112),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                ),
              ),

              // afficher les absences des etudiants

              ListTile(
                leading: Icon(
                  Icons.view_list,
                  color: Colors.blue,
                ),
                title: Text(
                  'Choisir une semestre',
                  style: TextStyle(fontSize: 15, color: Colors.blue[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => chef(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.blue[800],
                ),
                title: Text(
                  'Déconnection',
                  style: TextStyle(fontSize: 17, color: Colors.blue[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Choix(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late List<dynamic> data = [];

 Future<void> getData() async {
  final response = await http.get(Uri.parse('http://10.0.2.2/api_data/api_chef/S5.php'));

  if (response.statusCode == 200) {
    setState(() {
      data = json.decode(response.body);
    });
  } else {
    throw Exception('Failed to load data');
  }
}



  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          // width: double.infinity,
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: const [
                    //DataColumn(label: Text('Cne')),
                    DataColumn(label: Text('Nom')),
                    DataColumn(label: Text('Prenom')),
                    // DataColumn(label: Text('Email')),
                    // DataColumn(label: Text('Etat')),
                    // DataColumn(label: Text('Statut')),
                    DataColumn(label: Text('date_D')),
                    DataColumn(label: Text('date_F')),
                    DataColumn(label: Text('Element')),
                    // DataColumn(label: Text('Total_heures')),
                    //DataColumn(label: Text('Avertissements')),
                    DataColumn(label: Text('Absence')),
                  ],
                  rows: List<DataRow>.generate(data.length, (index) {
                    final _data = data[index];

                    bool isAbsent = true;
                    return DataRow(
                      cells: [
                        // DataCell(Text(_data['CNE_ET'].toString())),
                        DataCell(Text(_data['NOM_USER'].toString())),
                        DataCell(Text(_data['PRENOM_USER'].toString())),
                        // DataCell(Text(_data['EMAIL_USER'].toString())),
                        //  DataCell(Text(_data['ETAT'].toString()),),

                        //DataCell(Text(_data['STATUT'].toString())),
                        DataCell(Text(_data['date_D'])),
                        DataCell(Text(_data['date_F'])),
                        DataCell(Text(_data['NOM_ELEMENT'].toString())),
                        //  DataCell(Text(_data['Total_heures'])),
                        // DataCell(Text(_data['AVERTISEMENT_ET'].toString())),
                        DataCell(
                          Checkbox(
                            value: isAbsent,
                            onChanged: (newValue) {
                              setState(() {
                                isAbsent = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  })),
            ),
    );
  }
}