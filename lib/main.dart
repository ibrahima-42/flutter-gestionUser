import 'package:flutter/material.dart';
import 'package:gestionu/user_form.dart';
import 'package:gestionu/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserForm(),
    );
  }
}
