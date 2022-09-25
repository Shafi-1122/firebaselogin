
import 'package:firebase_auth_new/services/databaseservices.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    name = (await DatabaseService().getUser(widget.email))!;
    print(name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 157, 183) ,
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Welcome $name!'),
      ),
    );
  }
}
