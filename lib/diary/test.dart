import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'calendar.dart';

String baseUrl = 'http://10.0.2.2:8000/disease';


/*void main() async {
  final response = await http.get(Uri.parse(baseUrl));
  List<dynamic> list = [];

  if(response.statusCode == 200){
    list = jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    print('Error');
  }
  String tmp = 'test';

  Disease dis;
  dis = Disease(list, tmp);

  dis.printdetail();
}


class Disease {
  String? name;
  String? detail;

  Disease(List<dynamic> list, String dname){
    this.name = dname;
    this.detail = '';
    for (var item in list) {
      if (item['name'] == dname) {
        detail = item['detail'];
        break;
      }
    }
  }

  void printdetail() {
    print('$name');
    print('$detail');
  }
}

void fetchData() async{
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      print(data);
    } else {
      print('Error');
    }
    
    
    
    2번
    void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('test'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text('Go to ResultPage'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ResultPage(name: '폐렴');
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
}*/