import 'package:flutter/material.dart';
import 'package:lab2/lab3/model/user.dart';
import 'package:lab2/lab3/page/detail.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _MyRegister();
}

class _MyRegister extends State<Register> {
  bool _checkvalue_1 = false;
  bool _checkvalue_2 = false;
  bool _checkvalue_3 = false;
  int _gender = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'User Information',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 193, 36, 36)),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "FullName",
                  icon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  icon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  icon: Icon(Icons.password),
                ),
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  icon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 16),
              const Text("What is your gender?"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text("Male"),
                      leading: Transform.translate(
                          offset: const Offset(1, 0),
                          child: Radio(
                            value: 1,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          )),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text("Female"),
                      leading: Transform.translate(
                          offset: const Offset(1, 0),
                          child: Radio(
                            value: 2,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          )),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text("Other"),
                      leading: Transform.translate(
                          offset: const Offset(1, 0),
                          child: Radio(
                            value: 3,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text("What is your favorite?"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.all(0),
                    title: const Text("Music"),
                    value: _checkvalue_1,
                    onChanged: (value) {
                      setState(() {
                        _checkvalue_1 = value!;
                      });
                    },
                  )),
                  Expanded(
                      child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.all(0),
                    title: const Text("Movie"),
                    value: _checkvalue_2,
                    onChanged: (value) {
                      setState(() {
                        _checkvalue_2 = value!;
                      });
                    },
                  )),
                  Expanded(
                      child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.all(0),
                    title: const Text("Book"),
                    value: _checkvalue_3,
                    onChanged: (value) {
                      setState(() {
                        _checkvalue_3 = value!;
                      });
                    },
                  )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        //get value
                        var fullName = _nameController.text;
                        var email = _emailController.text;
                        // get gender
                        var genderName = 'None';
                        if (_gender == 1) {
                          genderName = "Male";
                        } else if (_gender == 2) {
                          genderName = "Female";
                        } else {
                          genderName = "Other";
                        }
                        //get favorite
                        var favoriteName = '';
                        if (_checkvalue_1) {
                          favoriteName += "Music, ";
                        }
                        if (_checkvalue_2) {
                          favoriteName += "Movie, ";
                        }
                        if (_checkvalue_3) {
                          favoriteName += "Book, ";
                        }
                        if (favoriteName != "") {
                          favoriteName = favoriteName.substring(
                              0, favoriteName.length - 2);
                        }
                        //create class
                        var objUser = User(
                            fullname: fullName,
                            email: email,
                            gender: genderName,
                            favorite: favoriteName);
                        //navigator to detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(user: objUser),
                          ),
                        );
                      },
                      child: const Text("Register"),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
