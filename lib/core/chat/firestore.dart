import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Create Hisotry
Future<String?> createHistory(String chatText, bool isBot, String? hid) async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user == null) return null;
  if (hid != null) {
    final Map<String, dynamic> data = {
      'uid': user.uid,
      'messages': [chatText],
      'isBot': isBot,
      'createdAt': Timestamp.now(),
      'historyId': hid
    };
    await FirebaseFirestore.instance.collection('histories').add(data);
    return hid;
  } else {
    final Map<String, dynamic> data = {
      'uid': user.uid,
      'messages': [chatText],
      'isBot': isBot,
      'createdAt': Timestamp.now(),
    };
    DocumentReference docRef =
        await FirebaseFirestore.instance.collection('histories').add(data);
    await FirebaseFirestore.instance
        .collection('histories')
        .doc(docRef.id)
        .update({'historyId': docRef.id});
    return docRef.id;
  }
  print('History added successfully');
}

//Read History
Future<List<Map<String, dynamic>>?> readHistory(String? hid) async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user == null) return null;
  if (hid != null) {
    final QuerySnapshot query = await FirebaseFirestore.instance
        .collection('histories')
        .where('uid', isEqualTo: user.uid)
        .where('historyId', isEqualTo: hid)
        .orderBy('createdAt', descending: false)
        .get();
    if (query.docs.isNotEmpty) {
      return query.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } else {
      return null;
    }
  } else {
    // print(query.docs.isEmpty);
    final QuerySnapshot query = await FirebaseFirestore.instance
        .collection('histories')
        .where('uid', isEqualTo: user.uid)
        .orderBy('createdAt', descending: true)
        .get();
    if (query.docs.isNotEmpty) {
      String _hid = await query.docs.first.get('historyId');
      final QuerySnapshot _query = await FirebaseFirestore.instance
          .collection('histories')
          .where('uid', isEqualTo: user.uid)
          .where('historyId', isEqualTo: _hid)
          .orderBy('createdAt', descending: false)
          .get();
      if (_query.docs.isNotEmpty) {
        return _query.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
