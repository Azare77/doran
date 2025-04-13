// // import 'package:hive/hive.dart';
// // import 'package:hive_flutter/hive_flutter.dart';
//
// part 'event_model.g.dart';
//
// // @HiveType(typeId: 1)
// // class EventModel {
// //   @HiveField(0)
// //   late String title;
// //   @HiveField(1)
// //   late bool haveReminder;
// //   @HiveField(2)
// //   late DateTime? reminderTime;
// //   @HiveField(3)
// //   late bool isRepeatable;
//
//   EventModel(
//       {required this.title,
//       this.haveReminder = false,
//       this.reminderTime,
//       this.isRepeatable = false})
//       : assert(!haveReminder || (haveReminder && reminderTime != null));
//
//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'haveReminder': haveReminder,
//       'reminderTime': reminderTime,
//       'isRepeatable': isRepeatable
//     };
//   }
// }
