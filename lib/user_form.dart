import 'package:flutter/material.dart';
import 'package:gestionu/data_service.dart';
import 'package:gestionu/user_list.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    var separator = const SizedBox(
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
                      decoration: const InputDecoration(
                          label: Text('Nom'), border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre nom';
                        }
                        return null;
                      },
                    ),
                    separator,
                    TextFormField(
                      controller: _prenomController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          label: Text('Prénom'), border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre prénom';
                        }
                        return null;
                      },
                    ),
                    separator,
                    TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('Âge'), border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre âge';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Veuillez entrer un nombre valide';
                        }
                        return null;
                      },
                    ),
                    separator,
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          label: Text('Email'), border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Veuillez entrer un email valide';
                        }
                        return null;
                      },
                    ),
                    separator,
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          label: Text('Téléphone'),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre numéro de téléphone';
                        }
                        return null;
                      },
                    ),
                    separator,
                    TextFormField(
                      controller: _dateController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          label: Text('Date de naissance'),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today)),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _dateController.text =
                                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre date de naissance';
                        }
                        return null;
                      },
                    ),
                    separator,
                    ElevatedButton(
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) {
                            var user = {
                              "nom": _nomController.text,
                              "prenom": _prenomController.text,
                              "email": _emailController.text,
                              "phone": _phoneController.text,
                              "age": _ageController.text,
                              "date": _dateController.text
                            };
                            print("donnees recus:$user");
                            _userService.saveUser(user).then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserList()));
                            });
                            // TODO: Ajouter la logique de soumission du formulaire ici
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Traitement en cours...'),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Erreur de traitement'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        child: const Text("S'inscrire"))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
