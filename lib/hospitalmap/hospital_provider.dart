import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'hospital.dart';
import 'hospital_repositiory.dart';

//병원 정보를 관리하는 클래스
class HospitalProvider extends ChangeNotifier {
  final HospitalGetInfo _hospitalRepository = HospitalGetInfo();
  final HospitalGetInfo2 _hospitalRespository2 = HospitalGetInfo2();

  //자신 위치 정보 저장
  double _lat = 0;
  double _long = 0;

  double get lat => _lat;
  double get long => _long;

  //병원 마커 생성시 사용
  final Set<NMarker> _markers = {};
  Set<NMarker> get markers => _markers;

  //1차(위치 정보 얻기)
  List<Location> _locations = [];
  List<Location> get locations => _locations;
  // 2차(병원 정보 얻기)
  List<HospitalCode> _hospitalcode = [];
  List<HospitalCode> get hospitalcode => _hospitalcode;

  //필터링 기능 추가 가능 후 리턴해줌(where에 조건문 사용)
  List<HospitalCode> getHospitalCodeList(String id) {
    List<HospitalCode> filteredList = _hospitalcode
        .where((code) =>
            code.dgidIdName?.contains(id) == true &&
            code.dutyDiv?.contains("D") != true &&
            code.dutyName?.contains("조산") == false)
        .toList();

    //거리 순으로 재배열하기
    filteredList.sort((a, b) {
      double distanceA = double.tryParse(a.distance ?? '') ?? double.infinity;
      double distanceB = double.tryParse(b.distance ?? '') ?? double.infinity;

      return distanceA.compareTo(distanceB);
    });

    return filteredList;
  }

  // 데이터 로드(위치 정보를 기반으로 병원 정보 얻기)
  loadLoc() async {
    if(long == 0){
      _long = 126.95733939436896;
      _lat = 37.50562697472923;
    }

    // HospitalGetInfo 접근해서 근처 병원을 구함
    List<Location>? listLocation = await _hospitalRepository.loadLoc(long, lat);
    _locations = listLocation!;

    // HospitalGetInfo2 접근해서 근처 병원의 진료과를 알아냄
    List<HospitalCode>? listHospitalCode =
        await _hospitalRespository2.loadCode(_locations);
    _hospitalcode = listHospitalCode!;

    notifyListeners(); // 데이터가 업데이트가 됐으면 구독자에게 알림
  }

  //표시할 마커 생성하기(필터링 추가)
  loadMarker(String id) async {
    for (HospitalCode code in _hospitalcode) {
      if (code.dgidIdName?.contains(id) == true) {
        //마커 모양, 특징 설정
        NMarker marker = NMarker(
          id: code.dutyName as String,
          position: NLatLng(
            double.parse(code.latitude!),
            double.parse(code.longitude!),
          ),
          iconTintColor: Colors.deepPurple,
        );
        final onMarkerInfoWindow = NInfoWindow.onMarker(
          id: marker.info.id,
          text: marker.info.id,
        );
        //마커 클릭시 동작
        marker.setOnTapListener((overlay) async {
          if (await marker.hasOpenInfoWindow()) {
            onMarkerInfoWindow.close();
          } else {
            marker.openInfoWindow(onMarkerInfoWindow);
          }
        });
        _markers.add(marker);
      }
    }

    notifyListeners(); // 데이터가 업데이트가 됐으면 구독자에게 알림
  }

  //위치 구하기
  getLoc() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _long = position.longitude;
    _lat = position.latitude;
  }
}
