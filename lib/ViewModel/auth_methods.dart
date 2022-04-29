import 'package:careclub/Model/firebase_connection.dart';
import 'package:careclub/Model/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  String result = 'Some error occured. Please check your connection';

  Future<UserDetails> getUserDetails() async {
    User currentUser = auth.currentUser!;

    DocumentSnapshot snapshot =
        await firestore.collection('users').doc(currentUser.uid).get();
    return UserDetails.fromSnapshot(snapshot);
  }

  Future<String> register(
      {required String email,
      required String password,
      required String username}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserDetails userDetails = UserDetails(
          username: username,
          email: email,
          uid: credential.user!.uid,
        );
        await firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(userDetails.toJson());

        result = "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //create a toast or snack bar to show weal password
        print('The password is too weak, Must be greater than six char');
      } else if (e.code == 'email-already-in-use') {
        //create a toast or snack bar to show user is registered
        print('Account already exists');
      }
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  Future<String> login(
      {required String email, required String password}) async {
    String result = 'Some error occured. Please check your connection';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        result = 'success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //create a toast or snack bar to show weal password
        print('The email is not registered');
      }
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  Future<String> registerAsAdmin(
      {required String email,
      required String password,
      required String username}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserDetails userDetails = UserDetails(
          username: username,
          email: email,
          uid: credential.user!.uid,
        );
        await firestore
            .collection('admin')
            .doc(credential.user!.uid)
            .set(userDetails.toJson());

        result = "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //create a toast or snack bar to show weal password
        print('The password is too weak, Must be greater than six char');
      } else if (e.code == 'email-already-in-use') {
        //create a toast or snack bar to show user is registered
        print('Account already exists');
      }
    } catch (e) {
      return e.toString();
    }
    return result;
  }
}
