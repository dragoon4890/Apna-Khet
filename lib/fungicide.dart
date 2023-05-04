import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:newkhet/chemicals.dart';
import 'package:newkhet/utils.dart';
import 'package:http/http.dart' as http;

class fungi extends StatefulWidget {
  @override
  State<fungi> createState() => _fungiState();
}

class _fungiState extends State<fungi> {
  String? resultData;
  final List<String> options1 = [
    'Rice',
    'Wheat',
    'Maize',
    'Cotton',
    'Tea',
    'Coffee'
  ];

  final Map<String, List<String>> options2 = {
    'Rice': [
      'laBst',
      'Brown leaf',
      'Leafspot',
      'Brownleaf Spot',
      'Sheath Blight',
      'Aerial Phase',
      'False smut',
      'Bacterial leaf blight',
      'Falsesmut',
      'Sheath Rot',
      'Narrow leaf spot',
      'Leaf Blast',
      'Neck Blast',
      'Dirty Panicle',
      'Grain Discoloration from Fungus Complex'
    ],
    'Wheat': [
      'Karnal Bunt',
      'Loosesmut',
      'Flagsmut',
      'Rust',
      'Leaf blight',
      'Brown Rust',
      'Black Rust',
      'Powdery Mildew',
      'Yellow rust',
      'Yellow rust',
      'Bunt',
      'Termites',
      'Aphids'
    ],
    'Maize': [
      'Turcicum Leaf Blight',
      'Rust',
      'Leafblight',
      'Downy Mildew',
      'Seedling Blight',
      'Seed Rot'
    ],
    'Cotton': [
      'Leafspot',
      'Angular Leaf spot',
      'Seedling Disease',
      'Grey Mildew',
      'Alternaria leafspot',
      'Alternaria Leafblight',
      'Root Rot',
      'Seedborn Disease',
      'Bacterial Blight'
    ],
    'Tea': [
      'Blister Blight',
      'Greyblight',
      'Red Rust',
      'Die-Back',
      'Black Rot'
    ],
    'Coffee': ['Black Rot', 'Rust']
  };

  String? selectedOption1;
  String? selectedOption2;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // androidlarge5Mwc (55:2)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group4Vnv (55:3)
              padding:
                  EdgeInsets.fromLTRB(8 * fem, 16 * fem, 8 * fem, 16 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff9c449),
              ),
              child: Align(
                // vectorpaJ (55:5)
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleChildScrollView(
                          child: Chemicals(),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 40 * fem,
                    height: 29 * fem,
                    child: Image.asset(
                      'assets/vector-1Kj.png',
                      width: 40 * fem,
                      height: 29 * fem,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // autogroupnuaejhG (39oenzsqQs75C8jJP9NuAE)
              padding:
                  EdgeInsets.fromLTRB(25 * fem, 9 * fem, 21 * fem, 101 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[Color(0x8cf9c449), Color(0x00f9c449)],
                  stops: <double>[0, 0.686],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // fungicideyrW (55:7)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 20 * fem, 29 * fem),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 48 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                      child: Text('Fungicide'),
                    ),
                  ),
                  Container(
                    // thistoolallowsyoutofindtheopti (55:8)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 10 * fem, 79 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 304 * fem,
                    ),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                      child: Text(
                          'This tool allows you to find the optimal fungicide to use based on what crop you have and the fungus affecting it'),
                    ),
                  ),
                  Container(
                    // enteryourcropXWe (69:69)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 114 * fem, 24 * fem),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                      child: Text('Enter your crop '),
                    ),
                  ),
                  Material(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16 * fem, vertical: 12 * fem),
                        filled: true,
                        fillColor: Color.fromARGB(255, 132, 188, 133),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8 * fem),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: selectedOption1,
                      items: options1
                          .map((option) => DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // Update the selected option for the first dropdown menu
                        setState(() {
                          selectedOption1 = value;
                          selectedOption2 =
                              null; // reset selectedOption2 when the first dropdown changes
                        });
                      },
                    ),
                  ),
                  Container(
                    // whatfungusaffectsyourcropLU6 (55:9)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 14 * fem, 39 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 300 * fem,
                    ),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                      child: Text('What fungus affects your crop?'),
                    ),
                  ),
                  Material(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 9 * fem, vertical: 12 * fem),
                        filled: true,
                        fillColor: Color.fromARGB(255, 132, 188, 133),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8 * fem),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: selectedOption2,
                      items: selectedOption1 != null
                          ? options2[selectedOption1]
                                  ?.map((option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option),
                                      ))
                                  .toList() ??
                              []
                          : [],
                      onChanged: (value) {
                        // Update the selected option for the second dropdown menu
                        setState(() {
                          selectedOption2 = value!;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Create a Map object to hold the selected options
                      Map<String, String?> payload = {
                        'crop': selectedOption1,
                        'problem': selectedOption2,
                      };

                      // Convert the Map to a JSON string
                      String jsonPayload = json.encode(payload);
                      String url = 'https://fungicide.anurondutta.repl.co/';
                      ;
                      Map<String, String> headers = {
                        'Content-Type': 'application/json'
                      };

                      final response = await http.post(Uri.parse(url),
                          headers: headers, body: jsonPayload);

                      // Update the state with the result data
                      setState(() {
                        resultData = response.body
                            .substring(11, (response.body.length - 3));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 68 * fem,
                        vertical: 0 * fem,
                      ),
                      primary: Color(0xff40e58c),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30 * fem),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),

// Display the result data using a Text widget
                  if (resultData != null)
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 139, 135, 135),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DefaultTextStyle(
                        child: Text(resultData!),
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
