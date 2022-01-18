import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  final String username;
  final String email;
  final String uid;

  const UserDetails({
    required this.username,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "uid": uid,
      };

  static UserDetails fromSnapshot(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return UserDetails(
      username: snap["username"],
      email: snap["email"],
      uid: snap["uid"],
    );
  }
}
