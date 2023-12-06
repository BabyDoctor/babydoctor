import 'dart:developer';
import 'package:cpstn/diary/apiprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'CNNimage.dart';
import 'diary/calendar.dart';
import 'findhospital.dart';
import 'hospitalmap/hospital_provider.dart';
import 'my_container.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'FindSymptoms.dart';
import 'hospitalmap/hospital_map.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _initialize();
  await _permission();
  await _initMapLoading(); // 앱 시작시 병원 정보 미리 불려옴
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ScheduleListProvider(),
      )
    ], child: const MyApp()),
  );
}

const seedColor = Color(0xFFFF0000);
const outPadding = 32.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: seedColor,
        brightness: Brightness.light,
        fontFamily: 'Pretendard',
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
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/main_background_image.png'),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 30),
                  const Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '응애 닥터',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Positioned(
                          top: -15,
                          right: 60,
                          child: Icon(
                            Icons.add,
                            color: Colors.red,
                            size: 60,
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: GestureDetector(
                            child: const MainContainer(content: '증상 찾기',iconData: Icons.search,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FindSymptoms()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10), // 이 부분은 두 버튼 사이의 공간을 제공합니다. 필요에 따라 조정하세요.
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            child: const MainContainer(content: '',iconData: Icons.camera_alt,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CNN()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    child: const MainContainer(content: '병원 찾기',iconData: Icons.local_hospital,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FindHospital()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    child: const MainContainer(content: '증상 일기',iconData: Icons.edit_calendar_outlined,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Calendar()),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  final String content;
  final IconData? iconData; // 아이콘 데이터가 없을 수도 있으므로 Nullable로 변경
  const MainContainer({Key? key, required this.content, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(5, 5),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (iconData != null) // 아이콘이 있을 경우에만 아이콘을 렌더링
                  Icon(iconData, color: Colors.black),
                if (iconData != null) // 아이콘이 있을 경우에만 간격을 추가
                  const SizedBox(width: 10),
                Text(
                  content,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            ),
          ],
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

Future<void> _permission() async {
  var requestStatus = await Permission.location.request();
  var status = await Permission.location.status;

  if (requestStatus.isGranted && status.isLimited) {
    // isLimited - 제한적 동의 (iOS 14 < )
    // 요청 동의됨
    print("isGranted");

    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      // 요청 동의 + GPS 켜짐
      var position = await Geolocator.getCurrentPosition();
      print("serviceStatusIsEnabled position = ${position.toString()}");
    } else {
      // 요청 동의 + GPS 꺼짐
      print("serviceStatusIsDisabled");
    }
  } else if (requestStatus.isPermanentlyDenied || status.isPermanentlyDenied) {
    // 권한 요청 거부, 해당 권한에 대한 요청에 대해 다시 묻지 않음 선택하여 설정화면에서 변경해야함. Android
    print("isPermanentlyDenied");
    openAppSettings();
  } else if (status.isRestricted) {
    // 권한 요청 거부, 해당 권한에 대한 요청을 표시하지 않도록 선택하여 설정화면에서 변경해야함. iOS
    print("isRestricted");
    openAppSettings();
  } else if (status.isDenied) {
    // 권한 요청 거절
    print("isDenied");
  }
  print("requestStatus ${requestStatus.name}");
  print("status ${status.name}");
}

HospitalProvider hospitalProvider = HospitalProvider();
Future<void> _initMapLoading() async {
  await hospitalProvider.getLoc();
}
