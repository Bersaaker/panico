import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';
  String _secondPhoneNumber = '';

  void _submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'firstName': _firstName,
          'lastName': _lastName,
          'email': _email,
          'password': _password,
          'phoneNumber': _phoneNumber,
          'secondPhoneNumber': _secondPhoneNumber,
        });
        Navigator.pop(context);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es obligatorio' : null,
              onSaved: (value) => _firstName = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Apellido'),
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es obligatorio' : null,
              onSaved: (value) => _lastName = value!,
            ),
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
            TextFormField(
              decoration: InputDecoration(labelText: 'Número de teléfono'),
              keyboardType: TextInputType.phone,
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es obligatorio' : null,
              onSaved: (value) => _phoneNumber = value!,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Número de teléfono secundario'),
              keyboardType: TextInputType.phone,
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es obligatorio' : null,
              onSaved: (value) => _secondPhoneNumber = value!,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Registrarse'),
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
