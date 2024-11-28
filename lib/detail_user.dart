import 'package:flutter/material.dart';

class DeatilUser extends StatefulWidget {
  final user;
  const DeatilUser({super.key , this.user});

  @override
  State<DeatilUser> createState() => _DeatilUserState();
}

class _DeatilUserState extends State<DeatilUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Prenom:${widget.user['prenom']}"),
          Text("nom:${widget.user['nom']}"),
          Text("age:${widget.user['age']}"),
          Text("email:${widget.user['email']}"),
          Text("phone:${widget.user['phone']}"),
          Text("datenaissance:${widget.user['datenaissance']}"),
        ],
      ),
    );
  }
}