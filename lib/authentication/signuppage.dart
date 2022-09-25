// made upto the creation of files. do the rst in the code .Nothing else to do with the command section.
import 'package:firebase_auth/firebase_auth.dart';
 signUp(email, password) async {  
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
    
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
 
} 