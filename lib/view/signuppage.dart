import 'package:firebase_auth_new/auth/signuppage.dart';
import 'package:firebase_auth_new/services/databaseservices.dart';
import 'package:firebase_auth_new/view/homepage.dart';
import 'package:firebase_auth_new/view/loginpage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController compnycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 171, 195),
        body: Padding(
          padding: const EdgeInsets.all(35.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: SizedBox(
                    child: Column(
                        // mainaxisAlignment:MainAxisAlignment.centre,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 60.0, right: 68),
                            child: Text(
                              "Create New Account",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            controller: emailcontroler,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 250, 195, 214),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide.none),
                                hintText: 'Email'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 250, 195, 214),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide.none),
                                hintText: 'Password'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: usernamecontroller,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 250, 195, 214),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide.none),
                                hintText: 'Username'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: compnycontroller,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 250, 195, 214),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide.none),
                                hintText: 'Company'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 65.0),
                            child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 126, 58, 95)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ))),
                                    onPressed: () {
                                      signUp(emailcontroler.text,
                                          passwordcontroller.text);

                                      DatabaseService().addUser(
                                          username: usernamecontroller.text,
                                          company: compnycontroller.text,
                                          email: emailcontroler.text);
                                            signin(emailcontroler.text, passwordcontroller.text);
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(email: emailcontroler.text)),
                              ); 
                                    },
                                    child: const Text('Create user'))),
                          ),
                        ]),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      // signUp(emailcontroler.text, passwordcontroller.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Loginpage(
                                  email: emailcontroler.text,
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top:90.0),
                      child: Text(
                        "Already have an account ? Signin",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
