import 'dart:developer';
import 'package:cpstn/diary/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dailycheck.dart';
import 'diary/calendar.dart';
import 'feedingroom.dart';
import 'findhospital.dart';
import 'my_container.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'FindSymptoms.dart';
import 'hospitalmap/hospital_map.dart';

void main() async {
  await _initialize();
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => ScheduleListProvider(),)],child: MyApp()),);
}

const seedColor = Color(0x7487E7E4);
const outPadding = 32.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: seedColor,
        brightness: Brightness.light,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(outPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.child_care_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 50.0,
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: outPadding,
              ),
              const Text(
                '응닥 (응애 닥터)',
              ),
              const SizedBox(
                height: outPadding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindSymptoms()),
                      );
                    },
                    child: const MyContainer(
                      width: 270.0,
                      height: 90.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '증상 찾기',
                    ),
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HospitalMap()),
                      );
                    },
                    child: const MyContainer(
                      width: 270.0,
                      height: 90.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '병원 찾기',
                    ),
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Calendar()),
                        );
                      },
                      child: const MyContainer(
                        width: 100.0,
                        height: 100.0,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(10.0),
                        text: '증상 기록',
                      ),
                    ),
                    const SizedBox(
                      width: outPadding,
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: '5nl1vx3l0n', // 클라이언트 ID 설정
      onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"));
}