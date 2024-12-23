import "package:cloud_firestore/cloud_firestore.dart";

Future<Map<String, List<Map<String, dynamic>>>> readFirestore(
    String uid) async {
  final QuerySnapshot query = await FirebaseFirestore.instance
      .collection("topics")
      .where('uid', isEqualTo: uid)
      .orderBy('createdAt', descending: true)
      .get();
  Map<String, List<Map<String, dynamic>>> groupedData = {};
  for (var doc in query.docs) {
    final Timestamp sDate = doc.get('createdAt');
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(sDate.millisecondsSinceEpoch);
    date = DateTime(date.year, date.month, date.day);
    DateTime now = DateTime.now();
    now = DateTime(now.year, now.month, now.day);
    final int daysAgo = now.difference(date).inDays.abs();
    var datas = doc.data() as Map<String, dynamic>;
    datas['hid'] = doc.id;
    if (daysAgo == 0) {
      if (groupedData.containsKey('Today\'s Hightlights')) {
        groupedData['Today\'s Hightlights']!.add(datas);
      } else {
        groupedData['Today\'s Hightlights'] = [datas];
      }
    } else if (daysAgo == 1) {
      if (groupedData.containsKey('Yesterday\'s Reflection')) {
        groupedData['Yesterday\'s Reflection']!.add(datas);
      } else {
        groupedData['Yesterday\'s Reflection'] = [datas];
      }
    } else if (daysAgo < 7) {
      if (groupedData.containsKey('This week\'s Reflection')) {
        groupedData['This week\'s Reflection']!.add(datas);
      } else {
        groupedData['This week\'s Reflection'] = [datas];
      }
    } else if (daysAgo < 30) {
      if (groupedData.containsKey('Recent within 30 days')) {
        groupedData['Recent within 30 days']!.add(datas);
      } else {
        groupedData['Recent within 30 days'] = [datas];
      }
    } else {
      if (groupedData.containsKey('More than one month ago')) {
        groupedData['More than one month ago']!.add(datas);
      } else {
        groupedData['More than one month ago'] = [datas];
      }
    }
  }
  return groupedData;
}
