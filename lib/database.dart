
class DataBase {
  DataBase._internal();

  static DataBase? _instance;

  factory DataBase() {
    _instance ??= DataBase._internal();
    return _instance!;
  }


  // Future<void> saveEvent(DateTime date, EventModel event) async {
  //   String boxName = generateKey(date);
  //   Box<EventModel>? box;
  //   if (!Hive.isBoxOpen(boxName)) {
  //     box = await Hive.openBox(boxName);
  //   }
  //   await box!.add(event);
  //   await box.close();
  // }

  // Future<void> editEvent(DateTime date, int index, EventModel event) async {
  //   String boxName = generateKey(date);
  //   Box<EventModel>? box;
  //   if (!Hive.isBoxOpen(boxName)) {
  //     box = await Hive.openBox(boxName);
  //   }
  //   await box!.putAt(index, event);
  //   await box.close();
  // }

  // Future<List<EventModel>> getEventsOfDay(
  //   DateTime date, {
  //   bool needToOpen = false,
  // }) async {
  //   String boxName = generateKey(date);
  //   List<EventModel> events = [];
  //   Box<EventModel>? box;
  //   try {
  //     if (needToOpen) {
  //       box = await Hive.openBox(boxName);
  //     }
  //     if (!Hive.isBoxOpen(boxName)) {
  //       box = await Hive.openBox(boxName);
  //     }
  //     for (EventModel event in box!.values) {
  //       events.add(event);
  //     }
  //     await box.close();
  //   } catch (e) {
  //     events = await getEventsOfDay(date, needToOpen: true);
  //   }
  //   return events;
  // }

  // Future<Map<DateTime, List>> getAllEvents(DateTime date) async {
  //   List<String> boxNames = generateMonthKeys(date);
  //   Map<DateTime, List<EventModel>> events = {};
  //   List<EventModel> eventList = [];
  //   Box<EventModel>? box;
  //   for (String boxName in boxNames) {
  //     if (!Hive.isBoxOpen(boxName)) {
  //       box = await Hive.openBox(boxName);
  //     }
  //     List<String> dateNumbers = boxName.split('-');
  //     box!.toMap().forEach((_, value) {
  //       eventList.add(value);
  //     });
  //     await box.close();
  //     if (eventList.isNotEmpty) {
  //       for (int i = 1300; i <= 1450; i++) {
  //         DateTime temp = DateTime(
  //           i,
  //           int.parse(dateNumbers[0]),
  //           int.parse(dateNumbers[1]),
  //         );
  //         Jalali dateList = Jalali.fromDateTime(temp);
  //         events[DateTime(dateList.year, dateList.month, dateList.day)] =
  //             eventList;
  //       }
  //     }
  //     eventList = [];
  //   }
  //   return events;
  // }

  // Future<void> deleteEvent(DateTime date, int index) async {
  //   String boxName = generateKey(date);
  //   Box<EventModel>? box;
  //   if (!Hive.isBoxOpen(boxName)) {
  //     box = await Hive.openBox(boxName);
  //   }
  //   await box!.deleteAt(index);
  //   await box.close();
  // }

  // String generateKey(DateTime date) {
  //   Jalali jDate = Jalali.fromDateTime(date);
  //   String key =
  //       '${jDate.year}/${jDate.month}/${jDate.day}'; // example : "1401/6/20"
  //   List<String> dateNumbers = key.split('/');
  //   key = '${dateNumbers[1]}-${dateNumbers[2]}';
  //   return key;
  // }

  // List<String> generateMonthKeys(DateTime date) {
  //   List<String> keys = [];
  //   Jalali jDate = Jalali.fromDateTime(date);
  //   String key =
  //       '${jDate.year}/${jDate.month}/${jDate.day}';
  //   // PersianDate()
  //   //     .gregorianToJalali(date.year, date.month, date.day, '/')
  //   //     .toString(); // example : "1401/6/20"
  //   List<String> dateNumbers = key.split('/');
  //   for (int i = 1; i < 32; i++) {
  //     key = '${dateNumbers[1]}-$i';
  //     keys.add(key);
  //   }
  //   return keys;
  // }
}
