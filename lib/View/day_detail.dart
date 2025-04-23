import 'package:doran/View/event_dialog.dart';
import 'package:doran/View/event_list_item.dart';
import 'package:doran/database.dart';
import 'package:doran/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DayDetail extends StatefulWidget {
  const DayDetail({
    super.key,
    required this.date,
    required this.updateCalendar,
  });

  final DateTime date;
  final Function updateCalendar;

  @override
  State<DayDetail> createState() => _DayDetailState();
}

class _DayDetailState extends State<DayDetail> {
  late DateTime date;
  // late List<EventModel> events;
  late List events;
  final DataBase database = DataBase();

  @override
  void initState() {
    events = [];
    date = widget.date;
    getDayEvents();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  Future<void> getDayEvents() async {
    if (mounted) {
      // events = await database.getEventsOfDay(widget.date);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Jalali jalaiDate = Jalali.fromDateTime(date);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height(1.2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(jalaiDate.day.toString()),
                            Text(jalaliMonthName(jalaiDate.month)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(date.day.toString()),
                            Text(gregorianMonthName(date.month)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(
                        const Size.fromHeight(0),
                      ),
                    ),
                    onPressed: () => onAdd(),
                    child: const Text('می‌خوای چیزی اضافه کنی؟'),
                  ),
                  const SizedBox(height: 20),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: events.length,
                      itemBuilder: (context, int index) {
                        return EventListItem(
                          event: events[index].title,
                          onDelete: () => onDelete(index),
                          onEdit: () => onEdit(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onAdd() async {
    String? event = await showDialog(
      context: context,
      builder: (_) {
        return const EventDialog();
      },
    );
    if (event != null && event.isNotEmpty) {
      // EventModel eventModel = EventModel(title: event);
      // events.add(eventModel);
      setState(() {});
      // await database.saveEvent(date, eventModel);
      if (events.length == 1) {
        widget.updateCalendar(date);
      }
    }
  }

  onEdit(index) async {
    String? editedEvent = await showDialog(
      context: context,
      builder: (_) {
        return EventDialog(event: events[index].title);
      },
    );
    if (editedEvent != null && editedEvent.isNotEmpty) {
      // EventModel eventModel = EventModel(title: editedEvent);
      setState(() {
        // events[index] = eventModel;
      });
      // database.editEvent(date, index, eventModel);
    }
  }

  onDelete(int index) async {
    setState(() {
      events.removeAt(index);
    });
    // await database.deleteEvent(date, index);
    if (events.isEmpty) {
      widget.updateCalendar(date);
    }
  }

  static const _jalaliMonthNames = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];

  String jalaliMonthName(int month) =>
      _jalaliMonthNames.elementAtOrNull(month - 1) ?? '';

  static const _gregorianMonthNames = [
    'ژانویه',
    'فوریه',
    'مارس',
    'آوریل',
    'مه',
    'ژوئن',
    'جولای',
    'اوت',
    'سپتامبر',
    'اکتبر',
    'نوامبر',
    'دسامبر'
  ];

  String gregorianMonthName(int month) =>
      _gregorianMonthNames.elementAtOrNull(month - 1) ?? '';
}
