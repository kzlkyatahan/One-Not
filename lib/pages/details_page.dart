import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not/pages/transition_page.dart';

class DetailsPage extends StatefulWidget {

  final int indexValue;
  final String note_title;
  final String note_description;

  DetailsPage({Key? key,required this.note_title,required this.note_description,
  required this.indexValue}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  Future<bool> backKey(BuildContext context) async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionPage(
      indexValue: widget.indexValue,
    )));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 3,
        title: Text(
          "Not Detay",
          style: GoogleFonts.ubuntu(
            fontSize: (24).sp,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12.0),
            bottomLeft: Radius.circular(12.0),
          ),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () => backKey(context),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),
                Padding(
                  padding: EdgeInsets.only(left: 24.0,right: 24.0),
                  child: Text(
                    "Not Başlığı",
                    style: GoogleFonts.ubuntu(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                  child: Text(
                    widget.note_title,
                    style: GoogleFonts.ubuntu(
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                Divider(
                  height: 35,
                  endIndent: 15,
                  indent: 15,
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.0,right: 24.0),
                  child: Text(
                    "Not Açıklaması",
                    style: GoogleFonts.ubuntu(
                      fontSize: (22.5).sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                  child: Text(
                    widget.note_description,
                    style: GoogleFonts.ubuntu(
                      fontSize: (22.5).sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
