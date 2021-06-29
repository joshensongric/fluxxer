import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FluxtogetherFirebaseUser {
  FluxtogetherFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

FluxtogetherFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FluxtogetherFirebaseUser> fluxtogetherFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FluxtogetherFirebaseUser>(
            (user) => currentUser = FluxtogetherFirebaseUser(user));
