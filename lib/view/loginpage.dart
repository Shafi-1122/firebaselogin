import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_new/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Loginpage extends StatelessWidget {
  Loginpage({Key? key,required this.email}) : super(key: key);
  String email;
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 157, 183) ,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
 padding: const EdgeInsets.only(bottom: 30.0,right: 68),              child: Text(
                              "Sign In",
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
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide.none),
                                hintText: 'Email'),
                          ),
                          SizedBox(height: 10),
           TextField(
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 250, 195, 214),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide.none),
                                hintText: 'Password'),
                          ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                     style: ButtonStyle(
                                     backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 126, 58, 95)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                      onPressed: () {
                        signin(emailcontroler.text, passwordcontroller.text);
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(email: emailcontroler.text)),
                              ); 
                      },
                      child: const Text('Log in'))),
            )
          ],
        ),
      ),
    );
  }
}

signin(email, password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
