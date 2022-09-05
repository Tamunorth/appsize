import 'package:appsize/appsize.dart';
import 'package:example/util/constant.dart';
import 'package:example/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPageScreen extends StatefulWidget {
  const FirstPageScreen({super.key});

  @override
  FirstPageScreenState createState() => FirstPageScreenState();
}

class FirstPageScreenState extends State<FirstPageScreen> {
  @override
  Widget build(BuildContext context) {
    if (AppSizeUtil.orientation == Orientation.portrait) {
      return _widPortrait();
    }
    return _widLandScape();
  }

  Widget _widPortrait() {
    return Material(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              _widMainImg(),
              Expanded(
                child: Column(
                  children: [
                    _widTitle(),
                    _widDesc(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widMainImg() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
      ),
      child: Image.asset(
        Constant.img1,
        height: 50.h,
      ),
    );
  }

  Widget _widTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 1.5.h),
      child: Text(
        Strings.appName,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 30.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _widDesc() {
    return Padding(
      padding: EdgeInsets.only(
        right: 10.w,
        left: 10.w,
        top: 2.h,
      ),
      child: Text(
        Strings.appDesc,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            height: 1.3,
            fontSize: 13.sp,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  //landscape
  Widget _widLandScape() {
    return Material(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              _widMainImgLand(),
              Expanded(
                child: Column(
                  children: [
                    _widTitleLand(),
                    _widDescLand(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widMainImgLand() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Image.asset(
        Constant.img1,
        height: 25.h,
      ),
    );
  }

  Widget _widTitleLand() {
    return Padding(
      padding: EdgeInsets.only(top: 1.0.h),
      child: Text(
        Strings.appName,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 30.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _widDescLand() {
    return Padding(
      padding: EdgeInsets.only(
        right: 25.w,
        left: 25.w,
        top: 1.5.h,
      ),
      child: Text(
        Strings.appDesc,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            height: 1.3,
            fontSize: 13.sp,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
