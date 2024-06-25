import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lab2/lab5/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountwidgetState();
}

class _AccountwidgetState extends State<AccountWidget> {
  User objUser = User(fullname: "No data");
  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    if (strUser == null) {
      objUser = User(fullname: "No data");
    } else {
      objUser = User.fromJson(jsonDecode(strUser));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("FUll name: ${objUser.fullname}")),
    );
  }
}
