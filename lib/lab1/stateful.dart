import 'package:flutter/material.dart';

class MyStateful extends StatefulWidget {
  const MyStateful({Key? key}) : super(key: key);

  @override
  State<MyStateful> createState() => _MyStateful();
}

class _MyStateful extends State<MyStateful> {
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
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
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
                      color: Colors.blue),
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
                          offset: const Offset(16, 0),
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
                          offset: const Offset(16, 0),
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
                          offset: const Offset(16, 0),
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
                        var fullName = _nameController.text;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Fullname: $fullName"),
                            );
                          },
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
