import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class crops extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<crops> {
  final picker = ImagePicker();
  File? _image;
  String? _predictionResult;
  String _baseUrl = 'https://us-central1-solistice.cloudfunctions.net';

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Future<void> sendImageForPrediction() async {
    if (_image == null) return;

    var uri = Uri.parse('$_baseUrl/predict');
    var request = http.MultipartRequest('POST', uri);
    var multipartFile = await http.MultipartFile.fromPath('file', _image!.path);
    request.files.add(multipartFile);

    try {
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseString);
      setState(() {
        _predictionResult = jsonResponse['class'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Your crop'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.grey.withOpacity(0.5),
              Colors.grey.withOpacity(0.5),
              Colors.white
            ],
            stops: [0.0, 0.2, 0.8, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image == null
                  ? Text('No image selected.')
                  : Image.file(
                      _image!,
                      height: 300,
                    ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: getImage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Select Image',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: sendImageForPrediction,
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Text(
                    'Get Prediction',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _predictionResult == null
                  ? Container()
                  : Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Prediction result: $_predictionResult',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
