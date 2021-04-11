import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwmgex/models/movie.dart';
import 'package:dwmgex/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuth = FirebaseAuth.instance;

final firestore = FirebaseFirestore.instance;

getMovies() async {
  List result = [];
  final movies = await firestore.collection('movies').get();
  if (movies.docs != null) {
    result = movies.docs.map((doc) => Movie().fromJson(doc.data())).toList();
  }
  return result;
}

getUsers() async {
  List result = [];
  final users = await firestore.collection("users")
.where("email", isEqualTo: firebaseAuth.currentUser.email).get();
  if (users.docs != null) {
    result = users.docs.map((doc) => Users().fromJson(doc.data())).toList();
  }
  return result;
}

