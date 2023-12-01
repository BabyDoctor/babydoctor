import 'apiprovider.dart';
import 'api.dart';
import 'diary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math';

Color getRandomColor() {
  final random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with SingleTickerProviderStateMixin {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    context.read<ScheduleListProvider>().updateScheduleList();
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime selectedDayWithoutTime = DateTime(
      selectedDay?.year ?? DateTime.now().year,
      selectedDay?.month ?? DateTime.now().month,
      selectedDay?.day ?? DateTime.now().day,
    );

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 3, 6),
                    lastDay: DateTime.utc(2030, 3, 6),
                    focusedDay: focusedDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDay, day);
                    },
                    onFormatChanged: (format) {
                      if (selectedDay != null) {
                        setState(() {});
                      }
                    },
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Today',
                      CalendarFormat.twoWeeks: 'Today',
                      CalendarFormat.week: 'Today',
                    },
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: true,
                      titleTextStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    calendarStyle: const CalendarStyle(
                        //marker 관련
                        canMarkersOverflow: false,
                        markersAutoAligned: true,
                        markerSize: 10,
                        markerDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        //today 관련
                        isTodayHighlighted: true,
                        todayDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlueAccent,
                        ),
                        //selectedDay 관련
                        selectedDecoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blueAccent),
                        //주말 관련
                        weekendTextStyle: TextStyle(color: Colors.red)),
                    onPageChanged: (pageDate) {
                      setState(() {
                        focusedDay = pageDate;
                      });
                    },
                    onDaySelected: (selectedDays, _) {
                      setState(() {
                        selectedDay = selectedDays;
                        focusedDay = selectedDays;
                      });
                      //sendDate(selectedDays);
                      //print('User selected day $selectedDays');
                    },
                  ),
                  Positioned(
                      top: 9,
                      right: 62,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            focusedDay = DateTime.now();
                            selectedDay = DateTime.now();
                          });
                        },
                        child: const Text('  '),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '${selectedDayWithoutTime.year}년 ${selectedDayWithoutTime.month}월 ${selectedDayWithoutTime.day}일',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: context
                      .watch<ScheduleListProvider>()
                      .scheduleListByDate
                      .where((event) =>
                          (event.year ==
                              selectedDayWithoutTime.year.toString()) &&
                          (event.month ==
                              selectedDayWithoutTime.month.toString()) &&
                          (event.day == selectedDayWithoutTime.day.toString()))
                      .map((event) => Dismissible(
                            key: Key(event.scheduleId.toString()),
                            onDismissed: (direction) {
                              if (event.scheduleId != null) {
                                context
                                    .read<ScheduleListProvider>()
                                    .deleteScheduleList(event.scheduleId!);
                              } else {
                                print('Error: scheduleId is null');
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                leading: Container(width: 30,height: 50,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          width: 2.0,
                                          color: getRandomColor(),
                                        ),
                                      ),
                                    ),
                                    child: Text('${event.time ?? '하루종일'}')),
                                title: Text(
                                  '${event.event}  ${event.temp}°C',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  event.detail ?? '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => SingleChildScrollView(
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        title: const Text(
                                          'About this event',
                                          style: TextStyle(
                                            color: Colors.cyan,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                        content: Container(
                                          height: MediaQuery.of(context).size.height * 0.5,width: MediaQuery.of(context).size.width * 0.7,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    ListTile(
                                                      leading: const Text(
                                                        'Event :',
                                                        style: TextStyle(fontSize: 20),
                                                      ),
                                                      subtitle: Text(
                                                        event.event,
                                                        style: const TextStyle(fontSize: 20),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      leading: const Text(
                                                        'Temperature :',
                                                        style: TextStyle(fontSize: 20),
                                                      ),
                                                      subtitle: Text(
                                                        event.temp,
                                                        style: const TextStyle(fontSize: 20),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    ListTile(
                                                      leading: const Text(
                                                        'YMDH :',
                                                        style: TextStyle(fontSize: 20),
                                                      ),
                                                      subtitle: Text(
                                                        '${event.year} . ${event.month} . ${event.day} . ${event.time ?? '00'}:00 ',
                                                        style: const TextStyle(fontSize: 20),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ListTile(
                                                  leading: const Text(
                                                    'Detail :',
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                  subtitle: Text(
                                                    event.detail ?? '',
                                                    style: const TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Close'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );


                                },
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:
          SpeedDial(animatedIcon: AnimatedIcons.menu_close, children: [
        SpeedDialChild(
          label: 'Add',
          child: const Icon(Icons.add),
          onTap: () async {
            TextEditingController eventController = TextEditingController();
            TextEditingController tempController = TextEditingController();
            TextEditingController yearController = TextEditingController();
            TextEditingController monthController = TextEditingController();
            TextEditingController dayController = TextEditingController();
            TextEditingController timeController = TextEditingController();
            TextEditingController detailController = TextEditingController();

            showModalBottomSheet(
              context: context,
              isScrollControlled: true, // 키보드를 피해서 배치되도록 설정
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height *
                        0.35, // 팝업 창의 높이를 설정
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: eventController,
                                decoration: const InputDecoration(
                                  labelText: 'Enter event',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: tempController,
                                decoration: const InputDecoration(
                                  labelText: 'Temperature(ex. 36.5)',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: yearController,
                                decoration: const InputDecoration(
                                  labelText: 'Year(XXXX)',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: monthController,
                                decoration: const InputDecoration(
                                  labelText: 'Month',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: dayController,
                                decoration: const InputDecoration(
                                  labelText: 'Day',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: timeController,
                                decoration: const InputDecoration(
                                  labelText: 'Hour(ex.11)',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: detailController,
                          decoration: const InputDecoration(
                            labelText: 'Other details',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Add'),
                          onPressed: () async {
                            Schedule schedule = Schedule(
                              event: eventController.text,
                              temp: tempController.text,
                              year: yearController.text,
                              month: monthController.text,
                              day: dayController.text,
                              time: timeController.text,
                              detail: detailController.text,
                            );
                            await context
                                .read<ScheduleListProvider>()
                                .addScheduleList(schedule);

                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.search),
          label: 'Search',
          onTap: () async {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return CupertinoPageScaffold(
                  navigationBar: const CupertinoNavigationBar(
                    middle: Text('Search'), // NavigationBar의 제목을 'Search'로 설정
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 45.0), // 상단 여백 추가
                      Row(
                        // 검색 아이콘, 입력창, 화살표 아이콘
                        children: <Widget>[
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.search,
                            size: 35,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CupertinoTextField(
                              placeholder: 'Enter search text',
                              controller: _searchController,
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Icon(Icons.send),
                            onPressed: () {
                              // 'send' 아이콘을 눌렀을 때의 동작을 여기에 작성
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          children: context
                              .watch<ScheduleListProvider>()
                              .scheduleListByDate
                              .where((event) =>
                                  event.event.contains(_searchController.text))
                              .map(
                                (event) => Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListTile(
                                      leading: Text(event.time ?? '하루종일'),
                                      title: Text(
                                        event.event,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(event.event),
                                      onTap: () {
                                        setState(() {
                                          _searchController.clear();
                                          Navigator.pop(context);
                                          focusedDay = DateTime(
                                              int.parse(event.year),
                                              int.parse(event.month),
                                              int.parse(event.day));
                                          selectedDay = DateTime(
                                              int.parse(event.year),
                                              int.parse(event.month),
                                              int.parse(event.day));
                                        });
                                      }),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.refresh),
          label: 'Refresh',
          onTap: () async {
            update();
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.exit_to_app),
          label: 'Back',
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
