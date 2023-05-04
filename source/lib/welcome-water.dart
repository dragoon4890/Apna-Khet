import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:newkhet/homepage.dart';
import 'package:newkhet/utils.dart';

class Scenewater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.85;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone14promax1F5x (1:2)
        padding: EdgeInsets.fromLTRB(0 * fem, 60 * fem, 0 * fem, 0 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff000000)),
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xff1ca7ec), Color(0x00ffffff)],
            stops: <double>[0, 1],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupanj9bSe (8p2d2Yar2nSSgAtTU1ANj9)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 60 * fem),
              width: baseWidth,
              height: 0.25 * height,
              child: Image.asset(
                'assets/image-9.png',
                width: 244 * fem,
                height: 228 * fem,
              ),
            ),
            Container(
              // autogroupmpzwVH8 (8p2fG9XZaoidtZk7veMPzw)
              width: baseWidth,
              height: 0.59 * height,
              decoration: BoxDecoration(
                color: Color(0xffd9d9d9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35 * fem),
                  topRight: Radius.circular(35 * fem),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // ellipse5P7c (1:14)
                    left: 343 * fem,
                    top: 486 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 66 * fem,
                        height: 18 * fem,
                        child: Image.asset(
                          'assets/ellipse-5.png',
                          width: 66 * fem,
                          height: 18 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupkfgtTdG (8p2fWJndppJgkkSas9KFGT)
                    left: 0.25 * baseWidth,
                    top: 0.532 * height,
                    child: Container(
                      width: 174 * fem,
                      height: 18 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse2AGn (1:11)
                            width: 18 * fem,
                            height: 18 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9 * fem),
                              color: Color(0xffa8a897),
                            ),
                          ),
                          SizedBox(
                            width: 60 * fem,
                          ),
                          Container(
                            // ellipse3hR8 (1:12)
                            width: 18 * fem,
                            height: 18 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9 * fem),
                              color: Color(0xffa8a897),
                            ),
                          ),
                          SizedBox(
                            width: 60 * fem,
                          ),
                          GestureDetector(
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
                            child: Container(
                              // ellipse4Rrv (1:13)
                              width: 18 * fem,
                              height: 18 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9 * fem),
                                color: Color(0xff7be495),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // getrecommendedonwhatcropstouse (1:10)
                    left: 0.1 * baseWidth,
                    top: 0.23 * height,
                    child: Align(
                      child: SizedBox(
                        width: 357 * fem,
                        height: 200 * fem,
                        child: DefaultTextStyle(
                            style: SafeGoogleFont(
                              'Sahitya',
                              fontSize: 32 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5525 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                            child: Text(
                                'Reduce the amount of\nwater you use with\naccurate recommendations\nof water usage for your irrigation system')),
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroup86umy1G (8p2fR4SNwuYgNjtXhs86uM)
                    left: 0.1 * baseWidth,
                    top: 0.05 * height,
                    child: Container(
                      width: 257 * fem,
                      height: 130 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // cropsgwG (1:8)
                            left: 0 * fem,
                            top: 55 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 200 * fem,
                                height: 75 * fem,
                                child: DefaultTextStyle(
                                  style: SafeGoogleFont(
                                    'Sahitya',
                                    fontSize: 48 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5525 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                  child: Text('Water'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // manageyourP4z (1:7)
                            left: 0 * fem,
                            top: 10 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 257 * fem,
                                height: 80 * fem,
                                child: DefaultTextStyle(
                                  style: SafeGoogleFont(
                                    'Sahitya',
                                    fontSize: 48 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5525 * ffem / fem,
                                    color: Color(0xff786c6c),
                                  ),
                                  child: Text('Manage your'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
