import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

//flutter build apk --debug --target-platform=android-arm64


class CNN extends StatefulWidget {
  const CNN({super.key});

  @override
  _CNNState createState() => _CNNState();
}

class _CNNState extends State<CNN> {
  var interpreter;
  var output =  List<List<int>>.filled(1, List<int>.filled(3, 0)).reshape([1,3]);
  var _imagepath;
  File? _imagefile;
  Image? _image;

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
    var reshapedinput = input.reshape([1,260,260,3]);

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
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              _imageLoadButtons(),
              const SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                child: _image == null
                    ? const Text('이미지 없음')
                    : _image as Image, //File Image를 삽입
              ),
              const SizedBox(
                height: 20,
              ),
              _runModel(),
              Center(
                child: Container(
                  width: 400,
                  height: 300,
                  child: Text('output: $output'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _runModel() {
    return ElevatedButton(
        onPressed: () => _processImageForML(_imagepath),
        child: const Text('Run'));
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
                child: const Text('Image'),
              ),
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
