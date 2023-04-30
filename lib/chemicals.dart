import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:newkhet/fungicide.dart';
import 'package:newkhet/herbicide.dart';
import 'package:newkhet/homepage.dart';
import 'package:newkhet/pesticide.dart';
import 'package:newkhet/pgrh.dart';
import 'package:newkhet/utils.dart';

class Chemicals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // androidlarge28L6 (50:16)
        width: double.infinity,
        height: 800 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle163CA (50:25)
              left: 0 * fem,
              top: 60 * fem,
              child: Align(
                child: SizedBox(
                  width: 362 * fem,
                  height: 740 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0x8cf9c449), Color(0x00f9c449)],
                        stops: <double>[0, 0.686],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // manageyourWLe (50:17)
              left: 28 * fem,
              top: 48 * fem,
              child: Align(
                child: SizedBox(
                  width: 257 * fem,
                  height: 75 * fem,
                  child: DefaultTextStyle(
                    style: SafeGoogleFont(
                      'Sahitya',
                      fontSize: 48 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5525 * ffem / fem,
                      color: Color(0xffa8a897),
                    ),
                    child: Text('Manage your\n\n'),
                  ),
                ),
              ),
            ),
            Positioned(
              // chemicalsc8n (50:20)
              left: 28 * fem,
              top: 109 * fem,
              child: Align(
                child: SizedBox(
                  width: 260 * fem,
                  height: 63 * fem,
                  child: DefaultTextStyle(
                    style: SafeGoogleFont(
                      'IBM Plex Mono',
                      fontSize: 48 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                    child: Text('CHEMICALS'),
                  ),
                ),
              ),
            ),
            Positioned(
              // arrowbackJGW (50:22)
              left: 132 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 96 * fem,
                  height: 96 * fem,
                  child: Image.asset(
                    'assets/arrow-back.png',
                    width: 96 * fem,
                    height: 96 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // group3oj4 (53:39)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(8 * fem, 16 * fem, 8 * fem, 16 * fem),
                width: 360 * fem,
                height: 61 * fem,
                decoration: BoxDecoration(
                  color: Color(0xfff9c449),
                ),
                child: Align(
                  // vector7jk (50:24)
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleChildScrollView(
                            child: Home(),
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
            ),
            Positioned(
              // rectangle18T2v (50:27)
              left: 28 * fem,
              top: 242 * fem,
              child: Align(
                child: SizedBox(
                  width: 305 * fem,
                  height: 100 * fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16 * fem),
                      child: Image.asset(
                        'assets/rectangle-18.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle19YKG (50:31)
              left: 28 * fem,
              top: 372 * fem,
              child: Align(
                child: SizedBox(
                  width: 305 * fem,
                  height: 100 * fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16 * fem),
                      child: Image.asset(
                        'assets/rectangle-19.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle20cK8 (50:32)
              left: 28 * fem,
              top: 502 * fem,
              child: Align(
                child: SizedBox(
                  width: 305 * fem,
                  height: 100 * fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16 * fem),
                      child: Image.asset(
                        'assets/rectangle-20.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle21Hw4 (50:33)
              left: 28 * fem,
              top: 632 * fem,
              child: Align(
                child: SizedBox(
                  width: 305 * fem,
                  height: 100 * fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16 * fem),
                        color: Color(0x23000000),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/rectangle-21-bg.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // pesticideAV4 (50:34)
              left: 80 * fem,
              top: 267 * fem,
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SingleChildScrollView(child: pest()),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 220 * fem,
                    height: 47 * fem,
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      child: Text('PESTICIDE'),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // herbicideGHC (50:35)
              left: 80 * fem,
              top: 400 * fem,
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleChildScrollView(
                          child: herb(),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 220 * fem,
                    height: 47 * fem,
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      child: Text('HERBICIDE'),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // fungicideZXC (50:36)
              left: 80 * fem,
              top: 529 * fem,
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleChildScrollView(
                          child: fungi(),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 220 * fem,
                    height: 47 * fem,
                    child: DefaultTextStyle(
                      style: SafeGoogleFont(
                        'IBM Plex Mono',
                        fontSize: 36 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      child: Text('FUNGICIDE'),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // pgrhsGz (53:38)
              left: 128 * fem,
              top: 660 * fem,
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleChildScrollView(
                          child: pgrh(),
                        ),
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
                        color: Color(0xff000000),
                      ),
                      child: Text('PGRH'),
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
