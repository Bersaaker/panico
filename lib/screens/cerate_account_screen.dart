import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _formkey = GlobalKey<FormState>();
  String _name = '';
  String _lastname = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';
  String _contactNumber = '';

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> _saveForm() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      Map<String, dynamic> data = {
        'nombre': _name,
        'apellido': _lastname,
        'correo': _email,
        'contraseña': _password,
        'telefono': _phoneNumber,
        'contacto': _contactNumber,
      };
      try {
        await usersCollection.add(data);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crea tu cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor escriba su nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Apellido'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor escriba su apellido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _lastname = value!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor escriba su correo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor escriba una contraseña';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Telefono'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor escriba su telefono';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Contacto'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor escriba el numero de su contacto';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contactNumber = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _saveForm, child: const Text('Registrarse'))
            ],
          ),
        ),
      ),
    );
  }
}
