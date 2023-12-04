import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'main.dart';

class BloodPoo extends StatelessWidget {
  const BloodPoo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
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
                  const Text('혈변', style: TextStyle(color:Color(0xFF455A64),fontWeight: FontWeight.bold, fontSize: 27.0),),
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
var name17 = "장결핵";
var name18 = '만성설사';

class CheckBoxs extends StatefulWidget {
  const CheckBoxs({Key? key}) : super(key: key);


  @override
  _CheckBoxsState createState() => _CheckBoxsState();
}


class _CheckBoxsState extends State<CheckBoxs> {


  bool _suddenly = false;
  bool _one = false;
  bool _three = false;
  bool _seconds = false;
  bool _threee = false;
  bool _fivee = false;
  bool _ten = false;
  bool _hot = false;
  bool _eisik = false;
  bool _singyong = false;
  bool _head = false;
  bool _none = false;
  bool _heart = false;
  bool _bansa = false;
  bool _cantsleep = false;
  bool _garae = false;
  bool _small = false;
  bool _nop = false;

  String _getDiagnosis() {
    if (_nop && _head) {
      return name18;//만성설사
    }
    if (_fivee && _hot&&_threee&&_eisik&&_singyong ) {
      return name17;//장결핵
    }
    else {
      return "경과관찰 요망";
    }

  }

  List<String> checkList = [];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "증상이 언제부터 나타났나요?",
              style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 21.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _suddenly,
                  onChanged: (value) {
                    setState(() {
                      _suddenly = value!;
                    });
                  },
                ),
                Text("지금 갑자기",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _one,
                  onChanged: (value) {
                    setState(() {
                      _one = value!;
                    });
                  },
                ),
                Text("~5시간",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _three,
                  onChanged: (value) {
                    setState(() {
                      _three = value!;
                    });
                  },
                ),
                Text("5~10시간",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _seconds,
                  onChanged: (value) {
                    setState(() {
                      _seconds = value!;
                    });
                  },
                ),
                Text("~3일",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "동반된 다른 증상?",
              style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 21.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _threee,
                  onChanged: (value) {
                    setState(() {
                      _threee = value!;
                    });
                  },
                ),
                Text("복통",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _fivee,
                  onChanged: (value) {
                    setState(() {
                      _fivee = value!;
                    });
                  },
                ),
                Text("담즙이 섞인 구토",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _ten,
                  onChanged: (value) {
                    setState(() {
                      _ten = value!;
                    });
                  },
                ),
                Text('가는 변',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _nop,
                  onChanged: (value) {
                    setState(() {
                      _nop = value!;
                    });
                  },
                ),
                Text('없음',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "동반된 다른 증상이 있나요? (모두 체크해주세요.)",
              style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 21.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _hot,
                  onChanged: (value) {
                    setState(() {
                      _hot = value!;
                    });
                  },
                ),
                Text("복부팽만",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _eisik,
                  onChanged: (value) {
                    setState(() {
                      _eisik = value!;
                    });
                  },
                ),
                Text("좌측 복부 덩어리 만짐",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _singyong,
                  onChanged: (value) {
                    setState(() {
                      _singyong = value!;
                    });
                  },
                ),
                Text('변에서 소화되지 않는 분비물 발견',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _head,
                  onChanged: (value) {
                    setState(() {
                      _head = value!;
                    });
                  },
                ),
                Text("없음",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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