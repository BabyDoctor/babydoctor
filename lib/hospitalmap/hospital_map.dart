import 'dart:async';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'hospital_provider.dart';
import 'list_display.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

//작동 방식
//1. 거리 가까운 순으로 병원을 검색함(list에 담기)
//2. 검색된 병원의 ID를 이용하여(dgidldName) 진료과를 알아냄!! ----
//3. 검색된 진료과를 이용하여 마커 및 필터 설정하기

class HospitalMap extends StatelessWidget {
  HospitalProvider hospitalProvider = HospitalProvider();
  //가야하는 과 설정하기(string 인자를 외부에서 보내서 변경가능)
  String WhereToGo = "내과";

  HospitalMap({super.key});

  //위치 권한 요청하기(초기 실행시 반드시 실행됨)
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
    } else if (requestStatus.isPermanentlyDenied ||
        status.isPermanentlyDenied) {
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

  
  @override
  Widget build(BuildContext context) {
    final Completer<NaverMapController> mapControllerCompleter = Completer();//completer 생성(지도에 필요함)
    return FutureBuilder(
      future: _init(),//이 함수가 먼저 실행된 후 지도 생성
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            //데이터를 불러오는 로딩화면
            home: Scaffold(
                body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "가까운 병원들을 찾고 있어요",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width,
                  animation: true,
                  lineHeight: 30.0,
                  animationDuration: 5000,
                  restartAnimation: true,
                  percent: 1.0,
                  barRadius: const Radius.circular(16),
                  progressColor: Colors.greenAccent,
                ),
              ],
            )),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return MaterialApp(//메인 지도 화면
            home: Scaffold(
              appBar: AppBar(
                title: const Text('병원찾기'),
              ),
              body: SlidingUpPanel(
                //아래 패널에 병원 목록 생성하는 ListDisplay()
                panel: ListDisplay(
                    hospitalProvider.getHospitalCodeList(WhereToGo)),
                body: Padding(//네이버 지도 생성하기
                  padding: const EdgeInsets.only(bottom: 180.0),
                  child: NaverMap(
                    options: NaverMapViewOptions(
                      initialCameraPosition: NCameraPosition(//초기 카메라 위치는 자기 위치
                        target: NLatLng(
                          hospitalProvider.lat,
                          hospitalProvider.long,
                        ),
                        zoom: 13,
                      ),
                      mapType: NMapType.basic,
                      //대한민국으로 한정
                      extent: const NLatLngBounds(
                        southWest: NLatLng(31.43, 122.37),
                        northEast: NLatLng(44.35, 132.0),
                      ),
                      indoorEnable: true,
                      locationButtonEnable: true,
                      consumeSymbolTapEvents: false,
                    ),
                    onMapReady: (controller) async {
                      controller.getLocationTrackingMode();
                      controller.getLocationOverlay();

                      //병원 위치 마커들 생성
                      controller.addOverlayAll(hospitalProvider.markers);

                      mapControllerCompleter.complete(controller);
                      log("onMapReady", name: "onMapReady");
                    },
                    onCameraIdle: () {},
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  //처음 실행시 미리 실행됨(마커 생성하기 위해)
  Future<void> _init() async {
    await _permission();//권한요청
    await hospitalProvider.getLoc();//자기 위치 알아내기
    await hospitalProvider.loadLoc();//api요청으로 병원목록 구하기
    //과 설정 필요!!!
    await hospitalProvider.loadMarker(WhereToGo);//지도에 표시할 마커 생성하기
    return Future.value();
  }
}
