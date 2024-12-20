import "package:cloud_firestore/cloud_firestore.dart";

Future<void> readFirestore(String uid) async {
  final QuerySnapshot query = await FirebaseFirestore.instance
      .collection("topics")
      .where('uid', isEqualTo: uid)
      .orderBy('createdAt', descending: false)
      .get();
  Map<String, List<DocumentSnapshot>> groupedData = {};
  for (var doc in query.docs) {
    final String sDate = doc.get('createdAt');
    final DateTime date = DateTime.parse(sDate);
    final DateTime now = DateTime.now();
  }
  print(groupedData);
}
