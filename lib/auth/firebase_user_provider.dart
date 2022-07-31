import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ProtoV1FirebaseUser {
  ProtoV1FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ProtoV1FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ProtoV1FirebaseUser> protoV1FirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<ProtoV1FirebaseUser>(
        (user) => currentUser = ProtoV1FirebaseUser(user));
