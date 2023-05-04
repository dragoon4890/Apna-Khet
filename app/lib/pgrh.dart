import 'package:flutter/material.dart';
import 'package:newkhet/chemicals.dart';
import 'package:newkhet/utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class pgrh extends StatefulWidget {
  const pgrh({super.key});

  @override
  State<pgrh> createState() => _pgrhState();
}

class _pgrhState extends State<pgrh> {
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
      'Triacontanol 0.1% EW',
      'Gibberellic Acid 0.1% GR',
      'Gibberellic Acid 40% WSG',
      'Triacontanol 0.05% EC',
      'Triacontanol 0.05%w/w min. GR'
    ],
    'Wheat': ['Gibberellic Acid 40% WSG'],
    'Maize': ['Gibberellic Acid 40% WSG'],
    'Cotton': [
      'Alpha Naphthyl Acetic Acid 4.5% SL (Na salt)',
      'Chlormequat Chloride 50% SL',
      'Gibberellic Acid 0.001%L',
      'Gibberellic Acid 0.186% SP',
      'Mepiquat chloride 5% AS',
      'Paclobutrazol 23% SC (w/w) / (25% w/v)',
      'Sodium Para - Nitrophenolate 0.3% SL',
      'Triacontanol 0.05% EC',
      'Triacontanol 0.05%w/w min. GR',
      'Triacontanol 0.1% EW',
      'Cyclanilide 2.10% w/w +Mepiquat Chloride 8.40% w/w SC'
    ],
    'Tea': ['Gibberellic Acid 0.001%L', 'Triacontanol 0.1% EW'],
    'Coffee': ['Ethephon 39 % SL']
  };

  String? selectedOption1;
  String? selectedOption2;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // androidlarge3CSa (53:40)
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group4vtN (53:41)
              padding:
                  EdgeInsets.fromLTRB(8 * fem, 16 * fem, 8 * fem, 16 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xfff9c449),
              ),
              child: Align(
                // vectorfLA (53:43)
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
                      'assets/vector-1kJ.png',
                      width: 40 * fem,
                      height: 29 * fem,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // autogroup5jbtPGA (39odT7ww5osoS7tkDQ5jBt)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
              padding:
                  EdgeInsets.fromLTRB(29 * fem, 9 * fem, 12 * fem, 93 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
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
                    // pesticidepcN (53:44)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 43 * fem, 30 * fem),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 48 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      child: const Text('PGRH'),
                    ),
                  ),
                  Container(
                    // thistoolallowsyoutofindtheopti (53:46)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 75 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 319 * fem,
                    ),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      child: const Text(
                          'This tool will provide you the time and amount of hormone to use based on what Plant Growth Regulator Harmone (PGRH) is being used.'),
                    ),
                  ),
                  Container(
                    // enteryourcropazr (69:64)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 127 * fem, 26 * fem),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      child: const Text('Enter your crop '),
                    ),
                  ),
                  Material(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16 * fem, vertical: 12 * fem),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 132, 188, 133),
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
                    // whatpestaffectsyourcrop1KU (53:49)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 55 * fem, 37 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 264 * fem,
                    ),
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                      child: const Text('Which PGRH will you use?'),
                    ),
                  ),
                  Material(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16 * fem, vertical: 12 * fem),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 132, 188, 133),
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
                      String url = 'https://pgrh.anurondutta.repl.co/';
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
                      primary: const Color(0xff40e58c),
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
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),

// Display the result data using a Text widget
                  if (resultData != null)
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 139, 135, 135),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DefaultTextStyle(
                        child: Text(resultData!),
                        style: const TextStyle(fontSize: 20.0),
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
