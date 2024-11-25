import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionu/detail_user.dart';
import 'package:gestionu/user_form.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _ScreenState();
}

class _ScreenState extends State<UserList> {
  List<Map> userList = [
    {
      "nom": "diallo",
      "prenom": "malal",
      "phone": "771234351",
      "age": 17,
      "email": "malal@gmail.com",
      "datenaissance": "10/06/2004"
    },
    {
      "nom": "ndiaye",
      "prenom": "amadou",
      "phone": "771234352",
      "age": 20,
      "email": "amadou@gmail.com",
      "datenaissance": "15/08/2003"
    },
    {
      "nom": "diop",
      "prenom": "aissatou",
      "phone": "771234353",
      "age": 19,
      "email": "aissatou@gmail.com",
      "datenaissance": "22/01/2005"
    },
    {
      "nom": "fall",
      "prenom": "ibrahima",
      "phone": "771234354",
      "age": 18,
      "email": "ibrahima@gmail.com",
      "datenaissance": "09/03/2006"
    },
    {
      "nom": "gueye",
      "prenom": "sokhna",
      "phone": "771234355",
      "age": 16,
      "email": "sokhna@gmail.com",
      "datenaissance": "12/12/2007"
    },
    {
      "nom": "seck",
      "prenom": "moussa",
      "phone": "771234356",
      "age": 21,
      "email": "moussa@gmail.com",
      "datenaissance": "06/07/2002"
    },
    {
      "nom": "sarr",
      "prenom": "fatou",
      "phone": "771234357",
      "age": 22,
      "email": "fatou@gmail.com",
      "datenaissance": "03/11/2001"
    },
    {
      "nom": "ba",
      "prenom": "khadim",
      "phone": "771234358",
      "age": 23,
      "email": "khadim@gmail.com",
      "datenaissance": "27/04/2000"
    },
    {
      "nom": "camara",
      "prenom": "bineta",
      "phone": "771234359",
      "age": 24,
      "email": "bineta@gmail.com",
      "datenaissance": "17/09/1999"
    },
    {
      "nom": "faye",
      "prenom": "omar",
      "phone": "771234360",
      "age": 25,
      "email": "omar@gmail.com",
      "datenaissance": "29/05/1998"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              var user = userList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(user['prenom'][0],
                      style: TextStyle(color: Colors.white)),
                ),
                title: Text("${user['prenom']} ${user['nom']}"),
                subtitle: Text("${user['phone']}"),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeatilUser(user: user)));
                    },
                    icon: Icon(
                      Icons.arrow_right,
                      size: 32.0,
                      color: Colors.black,
                    )),
              );
            }),
        floatingActionButton: Container(
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserForm()));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}
