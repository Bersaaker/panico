import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestore.collection('users').doc(user!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final Object? data = snapshot.data?.data();
          final Object? name = data;
          'name';
          final Object? email = data;
          'email';
          final Object? phone1 = data;
          'phone1';
          final Object? phone2 = data;
          'phone2';

          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('¡Bienvenido, $name!'),
                const SizedBox(height: 16.0),
                const Text('Estos son tus datos:'),
                const SizedBox(height: 8.0),
                Text('Nombre: $name'),
                Text('Correo electrónico: $email'),
                Text('Teléfono 1: $phone1'),
                Text('Teléfono 2: $phone2'),
              ],
            ),
          );
        },
      ),
    );
  }
}
