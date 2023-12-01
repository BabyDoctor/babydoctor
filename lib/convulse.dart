import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'main.dart';

class Convulse extends StatelessWidget {
  const Convulse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(outPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                    icon: Icon(
                      Icons.child_care,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 40.0,
                    ),
                  ),
                  const SizedBox(
                    width: outPadding,
                  ),
                  const Text(
                    '경련',
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
    );
  }
}



var name11 = "급성뇌염";
var name12 = '열성경련';
var name13 = '뇌전증';


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
  bool _none = false;
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("~5시간")
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
                Text("5~10시간")
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
                Text("3일")
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "증상이 얼마나 지속되나요?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("몇초")
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
                Text("몇초~3분")
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
                Text('3~10분')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "동반된 다른 증상이 있나요? (모두 체크해주세요.)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("발열")
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
                Text("의식저하")
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
                Text('신경학적 이상')
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
                Text("신경학적이상")
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
                  value: _none,
                  onChanged: (value) {
                    setState(() {
                      _none = value!;
                    });
                  },
                ),
                Text('두통')
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
                Text('없음')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "발작후 다른 변화가 있나요? (모두 체크해주세요.)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("졸린 증상")
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
                Text("구음장애")
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
                Text('반복적으로 발작')
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
                Text("없음")
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "경련에 특이사항 있나요? (모두 체크해주세요.)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("대개로 밤중에 일어남")
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
                Text("대개로 낮에 일어난다")
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
                Text('얼굴이나 신체 한쪽의 부분 발작')
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
                Text("전신발작")
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
                Text("없음")
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("내 결과 확인"),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                      builder: (BuildContext context) {
                        return ResultPage(name: 'test',);
                      }
                  );
                },
                icon: Icon(Icons.sick_outlined),
              )
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );

  }
}
