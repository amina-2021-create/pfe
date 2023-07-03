import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'menu_chef.dart';

class Auth1 extends StatefulWidget {
  Auth1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Auth1State();
}

class _Auth1State extends State<Auth1> {
  bool _isObscure = true;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Center(child: Text("Login Page")),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Utiliser SingleChildScrollView ici
        child: Column(
          children: [
            Container(
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img/14.jfif',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 60, right: 60),
              child: TextFormField(
                controller: loginController,
                key: _formKey,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    size: 20,
                  ),
                  hintText: 'Saisissez votre Email',
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 60, right: 60),
              child: TextFormField(
                controller: passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () => setState(() => _isObscure = !_isObscure),
                    child: Icon(
                      !_isObscure ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                    ),
                  ),
                  hintText: 'Saisissez votre mot de passe',
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 45),
              width: 200,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  onPressed: () {
                    handleLogin();
                  },
                  child: Text(
                    'Connexion',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    try {
      Response response = await http.post(
        Uri.parse('http://10.0.2.2/api_data/api_chef/login.php'),
        body: {
          'email': loginController.text,
          'password': passwordController.text
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(data['message']);
        if (data['message'] == 'ok') {
          print('Login successfully');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => chef()),
          );
        } else {
          print(response.body);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: const Text('Fermer'),
                )
              ],
              title: const Text(
                'Erreur',
                style: TextStyle(color: Colors.red),
              ),
              content: const Text('Email ou mot de passe incorrect'),
            ),
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void handleLogin() {
    
      login();
    }
  }

