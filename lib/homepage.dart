import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:newkhet/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newkhet/water.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newkhet/utils.dart';
import 'package:newkhet/welcome-crop.dart';
import 'package:newkhet/crops.dart';

import 'chemicals.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  String location = '';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username') ?? '';
      location = prefs.getString('userlocation') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // androidlarge1G8v (42:36)
        width: double.infinity,
        height: 800 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle7n7G (42:44)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 467 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0xff004e9a), Color(0x00004e9a)],
                        stops: <double>[0, 1],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // heynamerN2 (42:37)
              left: 25 * fem,
              top: 42 * fem,
              child: Align(
                child: SizedBox(
                  width: 100 * fem,
                  height: 20 * fem,
                ),
              ),
            ),
            Positioned(
              // welcome96E (42:38)
              left: 25 * fem,
              top: 60 * fem,
              child: Align(
                child: SizedBox(
                    width: 113 * fem,
                    height: 36 * fem,
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.5 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      child: Text("Welcome!"),
                    )),
              ),
            ),
            Positioned(
              // group2EdU (42:40)
              left: 256 * fem,
              top: 35 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    6.6 * fem, 12 * fem, 7.34 * fem, 12 * fem),
                width: 78 * fem,
                height: 80 * fem,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/ellipse-6.png',
                    ),
                  ),
                ),
                child: Center(
                  // vector7xA (42:42)
                  child: SizedBox(
                    width: 64.06 * fem,
                    height: 56 * fem,
                    child: Image.asset(
                      'assets/vector.png',
                      width: 64.06 * fem,
                      height: 56 * fem,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle8eBQ (42:45)
              left: 25 * fem,
              top: 131 * fem,
              child: Align(
                child: SizedBox(
                  width: 309 * fem,
                  height: 192 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19 * fem),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // regionmadhyapradeshYGn (42:46)
              left: 47 * fem,
              top: 149 * fem,
              child: Align(
                child: SizedBox(
                  width: 190 * fem,
                  height: 20 * fem,
                  child: DefaultTextStyle(
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                    child: Text('Region: $location'),
                  ),
                ),
              ),
            ),
            Positioned(
              // cropwheatE9c (42:49)
              left: 47 * fem,
              top: 172 * fem,
              child: Align(
                child: SizedBox(
                  width: 200 * fem,
                  height: 20 * fem,
                  child: DefaultTextStyle(
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                    child: Text('Name: $name'),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle14LCe (46:11)
              left: 0 * fem,
              top: 467 * fem,
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 333 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0xffffffff), Color(0xff7be495)],
                        stops: <double>[0, 1],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle10DXL (42:53)
              left: 25 * fem,
              top: 339 * fem,
              child: Align(
                child: SizedBox(
                  width: 309 * fem,
                  height: 92 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16 * fem),
                      color: Color(0xff000000),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/rectangle-10-bg.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle11JYn (42:54)
              left: 25 * fem,
              top: 443 * fem,
              child: Align(
                child: SizedBox(
                  width: 309 * fem,
                  height: 92 * fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16 * fem),
                    child: Image.asset(
                      'assets/rectangle-11.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle12DQr (42:55)
              left: 25 * fem,
              top: 549 * fem,
              child: Align(
                child: SizedBox(
                  width: 309 * fem,
                  height: 92 * fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16 * fem),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/rectangle-12-bg.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle13Ubg (42:56)
              left: 25 * fem,
              top: 655 * fem,
              child: Align(
                child: SizedBox(
                  width: 309 * fem,
                  height: 92 * fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16 * fem),
                    child: Image.asset(
                      'assets/rectangle-13.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // marketplaceBFC (42:59)
              left: 60 * fem,
              top: 361 * fem,
              child: Align(
                child: SizedBox(
                  width: 260 * fem,
                  height: 47 * fem,
                  child: DefaultTextStyle(
                    style: SafeGoogleFont(
                      'IBM Plex Mono',
                      fontSize: 36 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.3 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                    child: Text('MARKETPLACE'),
                  ),
                ),
              ),
            ),
            Positioned(
              // cropsUk6 (46:10)
              left: 119 * fem,
              top: 467 * fem,
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => crops()));
                  },
                  child: SizedBox(
                    width: 108 * fem,
                    height: 47 * fem,
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      child: Text('CROPS'),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // chemicalsBuQ (46:12)
              left: 73 * fem,
              top: 572 * fem,
              child: Align(
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
                    width: 195 * fem,
                    height: 47 * fem,
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      child: Text('CHEMICALS'),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // water6Wa (50:15)
              left: 119 * fem,
              top: 678 * fem,
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => water(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 150 * fem,
                    height: 47 * fem,
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      child: Text('WATER'),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // infooutlineneJ (58:36)
              left: 155 * fem,
              top: 27 * fem,
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleChildScrollView(
                          child: Scenecrop(),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 96 * fem,
                    height: 96 * fem,
                    child: Image.asset(
                      'assets/info-outline.png',
                      width: 96 * fem,
                      height: 96 * fem,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
