import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';

//For the Settings

//For Prayer Experiece

//For Read
Future<Map<String, dynamic>?> readPrayerExperience() async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return null;
  }
  final String? uid = user.uid;
  final QuerySnapshot query = await FirebaseFirestore.instance
      .collection('uSettings')
      .where('uid', isEqualTo: uid)
      .get();
  if (query.docs.isNotEmpty) {
    return query.docs.first.get('prayerExperience');
  } else {
    return null;
  }
}

// Create & Update
Future<void> editPrayerExperience(BuildContext context, String? path,
    String? openingAddress, String closingAddress) async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    showStateSnackBar(context, "Not Signed In User", "error");
    return null;
  }

  final String? uid = user.uid;

  try {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('uSettings')
        .where('uid', isEqualTo: uid)
        .get();
    if (query.docs.isNotEmpty) {
      DocumentSnapshot doc = query.docs.first;
      await doc.reference.update({
        'prayerExperience': {
          'path': path,
          'open': openingAddress,
          'close': closingAddress
        }
      });
      showStateSnackBar(context, "Prayer Experience Updated", "success");
    } else {
      FirebaseFirestore.instance.collection('uSettings').add({
        'uid': uid,
        'prayerExperience': {
          'path': path,
          'open': openingAddress,
          'close': closingAddress
        }
      });
      showStateSnackBar(context, "Prayer Experience Updated", "success");
    }
  } catch (e) {
    print(e);
    showStateSnackBar(context, 'Unexpected Error Occured', "error");
  }
}
