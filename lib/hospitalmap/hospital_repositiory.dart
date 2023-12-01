import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'hospital.dart';

//병원 위치정보 조회 사용
//http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire
//병원 진료 정보 조회
//http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire?HPID="병원ID"

//test용
//http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire?WGS84_LON=127.085156592737&WGS84_LAT=37.4881325624879&pageNo=1&numOfRows=50&serviceKey=FdCygokv8DjHGgi3uWCGv8PErOOBWZW1GQwuqcc%2FRV2y2fRJR6vUALj193hB5oOF2ykpgwkK%2FGzeeDUneZ0Cvw%3D%3D

//포멧 : XML
//이 인증키중 작동하는거 사용하기
//일반 인증키 encoding
// FdCygokv8DjHGgi3uWCGv8PErOOBWZW1GQwuqcc%2FRV2y2fRJR6vUALj193hB5oOF2ykpgwkK%2FGzeeDUneZ0Cvw%3D%3D
//일반 인증키 decoding
// FdCygokv8DjHGgi3uWCGv8PErOOBWZW1GQwuqcc/RV2y2fRJR6vUALj193hB5oOF2ykpgwkK/GzeeDUneZ0Cvw==

//보내는거
//WGS84_LON: 경도
//WGS84_LAT: 위도

//위치 거리를 반환하는 api xml to json(30개 반환)
class HospitalGetInfo {
  String apiKey =
      "FdCygokv8DjHGgi3uWCGv8PErOOBWZW1GQwuqcc%2FRV2y2fRJR6vUALj193hB5oOF2ykpgwkK%2FGzeeDUneZ0Cvw%3D%3D";

  //리스트로 가져올 병원의 개수
  final int num = 30;

  Future<List<Location>?> loadLoc(double long, double lat) async {
    const int httpRequestTimeout = 20; //20초가 지나면 자동 취소

    //numOfRows를 수정하여 검색되는 병원수 조절
    String baseUrl =
        "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire?WGS84_LON=$long&WGS84_LAT=$lat&page_No=1&numOfRows=$num&serviceKey=$apiKey";
    //테스트용 출력
    print(lat);
    print(long);
    //요청 보내기
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        // Timeout 설정(30초)
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: httpRequestTimeout));
      print("get1");

      // 정상적으로 데이터를 불러왔다면
      if (response.statusCode == 200) {
        // 데이터 가져오기
        final body = convert.utf8.decode(response.bodyBytes);

        // xml => json으로 변환
        final xml = Xml2Json()..parse(body);
        final json = xml.toParker();

        // 필요한 데이터 찾기
        Map<String, dynamic> jsonResult = convert.json.decode(json);
        final jsonLoc = jsonResult['response']['body']['items'];

        // 필요한 데이터 그룹이 있다면
        if (jsonLoc['item'] != null) {
          // map을 통해 데이터를 전달하기 위해 객체인 List로 만둘가
          List<dynamic> list = jsonLoc['item'];

          return list.map<Location>((item) => Location.fromJson(item)).toList();
        }
      } else {
        throw Exception('불러오기 실패!!!: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during HTTP request: $error');
    }
    return null;
  }
}

//병원의 아이디로 진료과를 구하는 클래스
class HospitalGetInfo2 {
  // api

  String apiKey =
      "FdCygokv8DjHGgi3uWCGv8PErOOBWZW1GQwuqcc%2FRV2y2fRJR6vUALj193hB5oOF2ykpgwkK%2FGzeeDUneZ0Cvw%3D%3D";

  //나중에 리스트로 투입
  List<String> ids = [];
  List<String> distance = [];
  List<HospitalCode> result = [];
  int processedRequests = 0;

  Future<List<HospitalCode>?> loadCode(List<Location> locList) async {
    //ids에 구할 병윈의 아이디를 모음 + 거리값을 추가해둠
    ids = locList.map((location) => location.hpid ?? "").toList();
    List<String> distances =
        locList.map((location) => location.distance ?? "").toList();
    Set<String> processedIds = <String>{};
    List<HospitalCode> result = [];

    //테스트용
    //print("ids: $ids");

    const int delayBetweenRequests = 10; //보내는 간격 10ms
    const int httpRequestTimeout = 5; //5초가 지나면 자동 취소

    // Future.wait를 사용하여 병렬 처리
    await Future.wait(ids.map((String id) async {
      // 중복이 되면 버림
      if (processedIds.contains(id)) {
        return;
      }

      String baseUrl =
          "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire?HPID=$id&serviceKey=$apiKey";

      try {
        // await를 사용하여 http.get의 완료를 기다림
        final response = await http.get(
          Uri.parse(baseUrl),
          // Timeout 설정(30초)
          headers: {'Content-Type': 'application/json'},
        ).timeout(const Duration(seconds: httpRequestTimeout));
        // 정상적으로 데이터를 불러왔다면
        if (response.statusCode == 200) {
          // 데이터 가져오기
          final body = convert.utf8.decode(response.bodyBytes);

          // xml => json으로 변환
          final xml = Xml2Json()..parse(body);
          final json = xml.toParker();

          // 필요한 데이터 찾기
          Map<String, dynamic> jsonResult = convert.json.decode(json);
          if (jsonResult['response'] != null &&
              jsonResult['response']['body'] != null &&
              jsonResult['response']['body']['items'] != null) {
            // Proceed with extracting and processing the data
            final jsonCode = jsonResult['response']['body']['items'];

            // 필요한 데이터 그룹이 있다면
            if (jsonCode != null && jsonCode['item'] != null) {
              Map<String, dynamic> item = jsonCode['item'];

              HospitalCode hospitalCode = HospitalCode.fromJson(item);

              // 중복이 안되면 진행하기
              if (!processedIds.contains(hospitalCode.hpid!)) {
                // 거리 정보 더하기
                hospitalCode.distance =
                    distances[ids.indexOf(hospitalCode.hpid!)];

                // 아이디 더하기
                processedIds.add(hospitalCode.hpid!);

                // 요청받아 처리한 횟수(테스트용)
                processedRequests++;

                //최종리스트에 더하기
                result.add(hospitalCode);
              }
            }
          }
          print("done $processedRequests");
        } else {
          throw Exception('불러오기 실패!!!: ${response.statusCode}');
        }
      } catch (error) {
        print('Error during HTTP request: $error');
      }

      // 보내는 속도 설정
      await Future.delayed(const Duration(milliseconds: delayBetweenRequests));
    }));
    processedRequests = 0;
    return result;
  }
}
