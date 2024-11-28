import 'package:flutter/material.dart';
import 'package:gestionu/data_service.dart';
import 'package:gestionu/detail_user.dart';
import 'package:gestionu/user_form.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _ScreenState();
}

class _ScreenState extends State<UserList> {
  UserService _userService = UserService();
  List<dynamic> userList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'User_list',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: _userService.getUsers(),
            builder: ((context, snapshot) {
              // print(snapshot.data);
              if (snapshot.hasData) {
                userList = snapshot.data!;
              }
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    var user = userList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                            "${user['prenom'][0]} ${user['nom'][0]}"
                                .toUpperCase(),
                            style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text("${user['prenom']} ${user['nom']}"),
                      subtitle: Text("${user['phone']}"),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeatilUser(user: user)));
                          },
                          icon: const Icon(
                            Icons.arrow_right,
                            size: 32.0,
                            color: Colors.black,
                          )),
                    );
                  });
            })),
        floatingActionButton: Container(
          decoration:
              const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserForm()));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}
