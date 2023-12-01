import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'main.dart';

class KolLock extends StatelessWidget {
  const KolLock({super.key});

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
                              '기침'
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
                    ]
                )
            )
        )
    );
  }
}


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



  List<String> checkList = [];

  var name4 = "천식";
  var name5 = '결핵';
  var name6 = '이물질흡입';


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
                Text("지금 갑자기")
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
                  value: _three,
                  onChanged: (value) {
                    setState(() {
                      _three = value!;
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
                  value: _seconds,
                  onChanged: (value) {
                    setState(() {
                      _seconds = value!;
                    });
                  },
                ),
                Text("~3일")
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
                Text("올랐다 내렸다 자주 반복")
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
                Text("~30분")
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
                Text('1시간 이상')
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
                Text("마른기침")
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
                Text("호흡곤란")
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
                Text('구토')
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
                Text("호흡부전")
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
                Text('없음')
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
                  value: _heart,
                  onChanged: (value) {
                    setState(() {
                      _heart = value!;
                    });
                  },
                ),
                Text("간헐적이고 위치 불분명한 흉통")
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
                  value: _bansa,
                  onChanged: (value) {
                    setState(() {
                      _bansa = value!;
                    });
                  },
                ),
                Text("급격한 반사소실")
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
                  value: _cantsleep,
                  onChanged: (value) {
                    setState(() {
                      _cantsleep = value!;
                    });
                  },
                ),
                Text('수면장애')
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
                  value: _garae,
                  onChanged: (value) {
                    setState(() {
                      _garae = value!;
                    });
                  },
                ),
                Text("가래")
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
                  value: _small,
                  onChanged: (value) {
                    setState(() {
                      _small = value!;
                    });
                  },
                ),
                Text('체중감소')
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
