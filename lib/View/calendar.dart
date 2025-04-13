import 'package:doran/View/day_detail.dart';
import 'package:doran/View/drawer_menu.dart';
import 'package:doran/database.dart';
import 'package:doran/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jalali_table_calendar_plus/jalali_table_calendar_plus.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final DataBase dataBase;
  late DayDetail dayDetail;
  late Widget calendar;

  @override
  void initState() {
    dayDetail = DayDetail(date: DateTime.now(), updateCalendar: updateCalendar);
    calendar = makeCalendar({});
    dataBase = DataBase();
    updateCalendar(DateTime.now());
    super.initState();
  }

  void updateCalendar(DateTime date) async {
    // Map<DateTime, List> allEvents = await dataBase.getAllEvents(date);
    Map<DateTime, List> allEvents = {};
    calendar = makeCalendar(allEvents);
    setState(() {});
  }

  Widget makeCalendar(Map<DateTime, List> allEvents) {
    return JalaliTableCalendar(
      events: allEvents,
      option: JalaliTableCalendarOption(
        showHeaderArrows: true
      ),
      marker: (date, events) {
        if (events.isEmpty) {
          return null;
        }
        return Text(
          '•',
          style: TextStyle(color: Theme.of(context).primaryColor),
        );
      },
      onDaySelected: (selectedDate) {
        dayDetail = DayDetail(
          date: selectedDate,
          key: ValueKey(selectedDate),
          updateCalendar: updateCalendar,
        );
        setState(() {});
      },
    );
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF394979), Color(0xFF152B65)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(width(8))),
        boxShadow: const [
          BoxShadow(
            color: Color(0xdaedaf12),
            blurRadius: 12.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: JalaliTableCalendar(
        // events: allEvents,
        onDaySelected: (selectedDate) {
          dayDetail = DayDetail(
            date: selectedDate,
            key: ValueKey(selectedDate),
            updateCalendar: updateCalendar,
          );
          setState(() {});
        },
      ),
    );
  }

  @override
  void didUpdateWidget(Calendar oldWidget) {
    dayDetail = DayDetail(
      key: ValueKey(dayDetail.date),
      date: dayDetail.date,
      updateCalendar: updateCalendar,
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: DrawerMenu(),
      appBar: AppBar(elevation: 0),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: SizedBox(
              width: width(100),
              height: height(100),
              child: SvgPicture.asset(
                'lib/assets/persepolis.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: height(20)
              ),
              child: SvgPicture.asset(
                'lib/assets/column.svg',
                width: width(45),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              Flexible(flex: 5, child: calendar),
              Flexible(flex: 2, child: dayDetail),
            ],
          ),
        ],
      ),
    );
  }
}
