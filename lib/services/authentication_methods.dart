import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:helping_hands_v2/models/user_model.dart';

class AuthServices{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  //get current user
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }

  //get UserModel from FirebaseUser
  UserModel? _getUserFromFirebaseUser(User? user){
    return UserModel(
      userId: user!.uid,
      userEmail: user.email,
      userPhoto: user.photoURL,
      userPhone: user.phoneNumber
    );
  }

  //get streams of FirebaseAuth
  Stream<UserModel?> get userStream {
    return _firebaseAuth.authStateChanges().map(_getUserFromFirebaseUser);
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return _getUserFromFirebaseUser(user!);
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return _getUserFromFirebaseUser(user!);
  }

  //sign in with google auth
  Future googleSignIn(String email) async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication? authentication = await googleSignInAccount!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken
    );

    UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
    User? user = userCredential.user;
    return _getUserFromFirebaseUser(user);
  }

  //sign out
  Future signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    return null;
  }
}