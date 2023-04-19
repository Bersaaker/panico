import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panico1000/screens/register_screen.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _email = '';
  String _password = '';

  void _submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error de inicio de sesión'),
              content:
                  Text('El correo electrónico o la contraseña no son válidos'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Correo electrónico'),
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es obligatorio' : null,
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es obligatorio' : null,
              onSaved: (value) => _password = value!,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Iniciar sesión'),
              onPressed: _submit,
            ),
            ElevatedButton(
                child: Text('¿No tienes una cuenta? Regístrate'),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    )),
          ],
        ),
      ),
    );
  }
}
