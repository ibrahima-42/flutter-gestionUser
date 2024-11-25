import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey _keyForm = GlobalKey<FormState>();
  final TextEditingController _nomController = new TextEditingController();
  final TextEditingController _prenomController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _dateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _separator = SizedBox(
      height: 15.0,
    );
    return Scaffold(
      body: Column(
        children: [
          Form(
              key: _keyForm,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nomController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          label: Text('nom'), border: OutlineInputBorder()),
                    ),
                    _separator,
                    TextFormField(
                      controller: _prenomController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          label: Text('prenom'), border: OutlineInputBorder()),
                    ),
                    _separator,
                    TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          label: Text('age'), border: OutlineInputBorder()),
                    ),
                    _separator,
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          label: Text('email'), border: OutlineInputBorder()),
                    ),
                    _separator,
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          label: Text('phone'), border: OutlineInputBorder()),
                    ),
                    _separator,
                    TextFormField(
                      controller: _dateController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          label: Text('date de naissance'),
                          border: OutlineInputBorder()),
                    ),
                    _separator,
                    ElevatedButton(onPressed: () {}, child: Text("S'inscrire"))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
