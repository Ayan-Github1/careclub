import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  final String username;
  final String email;
  final String uid;
  final String role;

   UserDetails({
    required this.username,
    required this.email,
    required this.uid,
    required this.role
  });

  Map<String, dynamic> toJson() {
    return {
        "username": username,
        "email": email,
        "uid": uid,
        "role": role
      };
  }

  UserDetails.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) 

      : username = snapshot.data().toString().contains('username') ? snapshot.get('username') : '',
        email = snapshot.data().toString().contains('email') ? snapshot.get('email') : '',
        uid = snapshot.data().toString().contains('uid') ? snapshot.get('uid') : '',
        role = snapshot.data().toString().contains('role') ? snapshot.get('role') : '';


    //  : id = doc.id,
    //     name = doc.data()!["name"],
    //     age = doc.data()!["age"],
    //     salary = doc.data()!["salary"],
    //     address = Address.fromMap(doc.data()!["address"]),

}
