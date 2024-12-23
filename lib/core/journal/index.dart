import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfriendfaith/core/journal/firestore.dart';

Future<Map<String, List<Map<String, dynamic>>>?> readJournal() async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return null;
  }
  final String uid = user.uid;
  final journals = await readFirestore(uid);
  return journals;
}
