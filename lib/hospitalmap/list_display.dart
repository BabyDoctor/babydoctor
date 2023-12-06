import 'package:flutter/material.dart';

import 'hospital.dart';

class ListDisplay extends StatelessWidget {
  final List<HospitalCode> hospitalCodeList;

  const ListDisplay(this.hospitalCodeList, {Key? key}) : super(key: key);

  //아래 패널에 병원 목록 만들기
  Widget _displayHospital(HospitalCode hospital) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${hospital.distance.toString()} Km",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              // 병원이름
              Text(
                "병원 이름: ${hospital.dutyName.toString()} ",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              // 병원 코드
              Text(
                "진료과: ${hospital.dgidIdName.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              // 병원 주소
              Text(
                "병원 주소: ${hospital.dutyAddr.toString()} ",
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              // 병원 전화
              Text(
                "병원 대표전화: ${hospital.dutyTel1.toString()} ",
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 20),
              ),
            ],
          ),
        ))
      ],
    );
  }

  // 리스트 뷰(병원 정보가 담길 컨테이너)
  Widget _makeListView(List<HospitalCode> hospital) {
    return ListView.separated(
      itemCount: hospital.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 350,
            color: Colors.white,
            child: _displayHospital(hospital[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "병원 리스트",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
      ),
      body: _makeListView(hospitalCodeList),
    );
  }
}
