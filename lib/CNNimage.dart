import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

import 'main.dart';

class CNN extends StatefulWidget {
  const CNN({super.key});

  @override
  _CNNState createState() => _CNNState();
}

class _CNNState extends State<CNN> {
  var interpreter;
  var output =
  List<List<int>>.filled(1, List<int>.filled(3, 0)).reshape([1, 3]);
  var _imagepath;
  File? _imagefile;
  Image? _image;
  Image? _image_resize;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    interpreter = await tfl.Interpreter.fromAsset('assets/model.tflite');
  }

  Future<void> _processImageForML(String imagePath) async {
    // Load the model
    await loadModel();

    // 이미지 로드
    var image = img.decodeImage(File(imagePath).readAsBytesSync());
    var resizedImage = img.copyResize(image!, width: 260, height: 260);
    var byteData = resizedImage.getBytes();
    //efficientnetB2의 입력은 0~255
    var input = Float32List.fromList(byteData.map((e) => e / 1.0).toList());
    //var input = Float32List.fromList(byteData.map((e) => e / 255.0).toList());
    //efficientnetB2의 입력은 260*260
    var reshapedinput = input.reshape([1, 260, 260, 3]);

    // Shape the input tensor for TensorFlow Lite
    var inputTensor = interpreter.getInputTensor(0);
    var outputTensor = interpreter.getOutputTensor(0);
    //print('Input shape: ${inputTensor}');
    //print('Output shape: ${outputTensor}');
    //print(reshapedinput.shape);

    // TensorFlow Lite 예시
    //print(reshapedinput);
    setState(() {
      interpreter.run(reshapedinput, output);
    });
    interpreter.close();
  }

  Future<void> getImage() async {
    var xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      setState(() {
        _imagefile = File(xfile.path);
        _imagepath = xfile.path;
        _image = Image.file(File(xfile.path));
        _image_resize =
            Image.file(File(xfile.path), fit: BoxFit.cover, height: 200, width: 200);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/onlybackcolor.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: outPadding),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.child_care,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 60.0,
                          ),
                        ),

                      ),
                      const SizedBox(
                        width: outPadding,
                      ),
                      const Text(
                        '피부상태 진단하기',
                        style: TextStyle(
                            color:Color(0xFF455A64),
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                _imageLoadButtons(),
                const SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _image == null
                            ? const Text(
                          '이미지를 추가해 주세요',
                          style: TextStyle(fontSize: 18),
                        )
                            : _image_resize as Image,
                      ],
                    ), //File Image를 삽입
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _runModel(),
                Center(
                  child: SizedBox(
                    width: 400,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _output(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _output() {
    if (output == [
      [0, 0, 0]
    ]) {
      return "결과창입니다";
    } else {
      if (output[0][0] > output[0][1] && output[0][0] > output[0][2]) {
        return "피부분석결과 아토피일 확률이 ${(output[0][0] * 100).floorToDouble()}%입니다";
      } else if (output[0][1] > output[0][0] && output[0][1] > output[0][2]) {
        return "피부분석결과 습진일 확률이 ${(output[0][1] * 100).floorToDouble()}%입니다";
      } else if (output[0][2] > output[0][1] && output[0][2] > output[0][0]) {
        return "피부분석결과 정상일 확률이 ${(output[0][2] * 100).floorToDouble()}%입니다";
      } else {
        return "결과창입니다";
      }
    }
  }

  // Run Model button
  Widget _runModel() {
    return Center(
      child: ElevatedButton(
        onPressed: () => _processImageForML(_imagepath),
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey, // Change the button color here
        ),
        child: const Text(
          '피부 상태 진단하기',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
      ),
    );
  }


  // 화면 상단 버튼
  Widget _imageLoadButtons() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: ElevatedButton(
                  onPressed: () => getImage(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, // Change the button color here
                  ),
                  child: const Text('피부 이미지를 추가하기',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0))),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    interpreter.close();
    super.dispose();
  }
}
