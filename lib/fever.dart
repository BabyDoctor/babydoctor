import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'main.dart';

class Fever extends StatelessWidget {
  const Fever({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/onlybackcolor.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(outPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.child_care,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 60.0,
                    ),
                  ),
                  const SizedBox(
                    width: outPadding,
                  ),
                  const Text(
                    '발열', style: TextStyle(color:Color(0xFF455A64),fontWeight: FontWeight.bold, fontSize: 27.0),
                  ),
                ],
              ),
              const SizedBox(
                height: outPadding,
              ),
              const Expanded(
                child: Center(
                  child: CheckBoxs(),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}


var name14 = "소아 특발성 관절염";
var name15 = '수막염';
var name16 = '폐렴';

class CheckBoxs extends StatefulWidget {
  const CheckBoxs({Key? key}) : super(key: key);


  @override
  _CheckBoxsState createState() => _CheckBoxsState();
}


class _CheckBoxsState extends State<CheckBoxs> {


  bool _suddenly = false;
  bool _one = false;
  bool _three = false;
  bool _threee = false;
  bool _fivee = false;
  bool _ten = false;
  bool _hot = false;
  bool _eisik = false;
  bool _singyong = false;
  bool _head = false;
  bool _five = false;
  bool _nop = false;

  bool _sleep = false;
  bool _jangei = false;
  bool _banbok = false;
  bool _nono = false;
  bool _night = false;
  bool _day = false;
  bool _point = false;
  bool _all = false;
  bool _no = false;


  List<String> checkList = [];

  String _getDiagnosis() {
    if (_hot && _sleep&&_night) {
      return name14;//소아 특발성관절염
    }
    if (_eisik && _singyong) {
      return name15;//수막염
    }
    if (_nono && _night ) {
      return name16;//폐렴
    }
    else {
      return "경과관찰 요망";
    }

  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "증상이 언제 나타났나요?",
                  style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _suddenly,
                      onChanged: (value) {
                        setState(() {
                          _suddenly = value!;
                        });
                      },
                    ),
                    const Text("지금 갑자기",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _one,
                      onChanged: (value) {
                        setState(() {
                          _one = value!;
                        });
                      },
                    ),
                    const Text("~5시간",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _three,
                      onChanged: (value) {
                        setState(() {
                          _three = value!;
                        });
                      },
                    ),
                    const Text("5~10시간",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _ten,
                      onChanged: (value) {
                        setState(() {
                          _ten = value!;
                        });
                      },
                    ),
                    const Text('~3일',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "증상이 얼마나 지속되나요?",
                  style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _threee,
                      onChanged: (value) {
                        setState(() {
                          _threee = value!;
                        });
                      },
                    ),
                    const Text("올랐다 내렸다 반복",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _five,
                      onChanged: (value) {
                        setState(() {
                          _five = value!;
                        });
                      },
                    ),
                    const Text("~30분",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _fivee,
                      onChanged: (value) {
                        setState(() {
                          _fivee = value!;
                        });
                      },
                    ),
                    const Text("1시간이상",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "동반된 다른 증상이 있나요? (모두 체크해주세요.)",
                  style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _hot,
                      onChanged: (value) {
                        setState(() {
                          _hot = value!;
                        });
                      },
                    ),
                    const Text("지름 2-9mm 홍반",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _eisik,
                      onChanged: (value) {
                        setState(() {
                          _eisik = value!;
                        });
                      },
                    ),
                    const Text("두통",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _singyong,
                      onChanged: (value) {
                        setState(() {
                          _singyong = value!;
                        });
                      },
                    ),
                    const Text('경련',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _head,
                      onChanged: (value) {
                        setState(() {
                          _head = value!;
                        });
                      },
                    ),
                    const Text("호흡 부전",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _nop,
                      onChanged: (value) {
                        setState(() {
                          _nop = value!;
                        });
                      },
                    ),
                    const Text("없음",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "발작후 다른 변화가 있나요? (모두 체크해주세요.)",
                  style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _sleep,
                      onChanged: (value) {
                        setState(() {
                          _sleep = value!;
                        });
                      },
                    ),
                    const Text("호흡부전이 심해짐",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _jangei,
                      onChanged: (value) {
                        setState(() {
                          _jangei = value!;
                        });
                      },
                    ),
                    const Text("전신 림프절 비대",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _banbok,
                      onChanged: (value) {
                        setState(() {
                          _banbok = value!;
                        });
                      },
                    ),
                    const Text('해열제 반응 더딤',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _nono,
                      onChanged: (value) {
                        setState(() {
                          _nono = value!;
                        });
                      },
                    ),
                    const Text("없음",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "경련에 특이사항 있나요? (모두 체크해주세요.),",
                  style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _night,
                      onChanged: (value) {
                        setState(() {
                          _night = value!;
                        });
                      },
                    ),
                    const Text("대개로 밤중에 일어남",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _day,
                      onChanged: (value) {
                        setState(() {
                          _day = value!;
                        });
                      },
                    ),
                    const Text("대개로 낮에 일어난다",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _point,
                      onChanged: (value) {
                        setState(() {
                          _point = value!;
                        });
                      },
                    ),
                    const Text('얼굴이나 신체 한쪽의 부분 발작',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _all,
                      onChanged: (value) {
                        setState(() {
                          _all = value!;
                        });
                      },
                    ),
                    const Text("전신발작",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _no,
                      onChanged: (value) {
                        setState(() {
                          _no = value!;
                        });
                      },
                    ),
                    const Text("없음",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("내 결과 확인",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 20.0),),
                  IconButton(
                    onPressed: () {

                      String diagnosisResult = _getDiagnosis();
                      print("진단 결과: $diagnosisResult");

                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return ResultPage(name: diagnosisResult);
                        },
                      );
                    },
                    icon: const Icon(Icons.sick_outlined),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ]
        )
    );
  }
}