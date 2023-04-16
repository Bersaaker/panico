import 'package:flutter/material.dart';
import 'package:panic_button_v2/screens/cerate_account_screen.dart';
import 'package:panic_button_v2/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido'),
            const Divider(),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(fontWeight: FontWeight.bold),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Escriba su correo o numero',
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.person),
                  iconColor: Colors.grey),
            ),
            const Divider(),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: Colors.black,
              obscureText: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Escriba su contraseña',
                labelText: 'Contraseña',
                suffixIcon: const Icon(Icons.password),
                iconColor: Colors.grey,
              ),
            ),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                child: const Text('Iniciar sesion')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿No tienes cuenta?',
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
                    },
                    child: const Text('Crear cuenta'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
