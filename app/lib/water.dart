import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class water extends StatefulWidget {
  const water({super.key});

  @override
  _waterState createState() => _waterState();
}

class _waterState extends State<water> {
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _cropController = TextEditingController();
  final _numberController = TextEditingController();
  String _responseText = '';

  Future<void> _sendJsonRequest() async {
    // get the entered data from the input fields
    String city = _cityController.text;
    String crop = _cropController.text;
    String number = _numberController.text;

    // create a JSON payload
    Map<String, String> payload = {
      "city": city,
      "crop": crop,
      "number": number,
    };

    // encode the payload to JSON format
    String jsonPayload = json.encode(payload);

    // set the URL and headers
    final String url = 'api-url';
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    // send the HTTP request
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonPayload,
    );

    // handle the response
    if (response.statusCode == 200) {
      // request successful
      setState(() {
        _responseText = 'Request successful!\n${response.body}';
      });
    } else {
      // request failed
      setState(() {
        _responseText = 'Request failed with status: ${response.statusCode}.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter city name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cropController,
                decoration: const InputDecoration(labelText: 'Crop'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter crop name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(labelText: 'Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter number of crops';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // validate the form
                  if (_formKey.currentState!.validate()) {
                    // send the JSON HTTP request
                    _sendJsonRequest();
                  }
                },
                child: const Text('Submit'),
              ),
              const Center(child: SizedBox(height: 16.0)),
              Text(
                _responseText,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
