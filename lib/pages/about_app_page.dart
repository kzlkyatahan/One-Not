import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not/constants.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        Card(
          semanticContainer: true,
          margin: Constants.aboutPageCardMargin,
          shadowColor: Colors.black,
          elevation: 3,
          child: Padding(
            padding: Constants.aboutPageCardRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Uygulama Adı: ",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " One™ Not",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: Constants.aboutPageCardMargin,
          shadowColor: Colors.black,
          elevation: 3,
          child: Padding(
            padding: Constants.aboutPageCardRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sürüm Numarası: ",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " 1.0.0",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: Constants.aboutPageCardMargin,
          shadowColor: Colors.black,
          elevation: 3,
          child: Padding(
            padding: Constants.aboutPageCardRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Uygulama Türü: ",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " Ekosistem Uygulaması",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: Constants.aboutPageCardMargin,
          shadowColor: Colors.black,
          elevation: 3,
          child: Padding(
            padding: Constants.aboutPageCardRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Altyapı:",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                SvgPicture.asset(
                  "images/app_about_platform.svg",
                  width: 236.w,
                ),
              ],
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: Constants.aboutPageCardMargin,
          shadowColor: Colors.black,
          elevation: 3,
          child: Padding(
            padding: Constants.aboutPageCardRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Altyapı Revizyonu: ",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " AGMPMAWD01",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: Constants.aboutPageCardMargin,
          shadowColor: Colors.black,
          elevation: 3,
          child: Padding(
            padding: Constants.aboutPageCardRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Ekosistem:",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                SvgPicture.asset(
                  "images/one_ecosystem.svg",
                  width: 180.w,
                ),
              ],
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: Constants.aboutPageCardMargin,
          shadowColor: Colors.black,
          elevation: 3,
          child: Padding(
            padding: Constants.aboutPageCardRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Güncelleme Hizmeti:",
                  style: GoogleFonts.ubuntu(
                    fontSize: (17.5).sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                SvgPicture.asset(
                  "images/upser.svg",
                  width: 97.w,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}