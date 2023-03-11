import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not/database_sqflite/database_dao.dart';
import 'package:not/pages/transition_page.dart';

class NoteUpdatePage extends StatefulWidget {

  final int indexValue;
  final int note_id;
  final String note_title;
  final String note_description;

  NoteUpdatePage({Key? key,required this.note_id,required this.note_title,
    required this.note_description,required this.indexValue})
      : super(key: key);

  @override
  State<NoteUpdatePage> createState() => _NoteUpdatePageState();
}

class _NoteUpdatePageState extends State<NoteUpdatePage> {

  Future<bool> backKey(BuildContext context) async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransitionPage(
      indexValue: widget.indexValue,
    )));
    return true;
  }

  Future<void> updateNote(int note_id,String note_title,String note_description) async {
    await Notesdao().updateNote(note_id, note_title, note_description);
  }

  Future<void> updateFavNote(int note_id,String note_title,String note_description) async {
    await Notesdao().updateFavNote(note_id, note_title, note_description);
  }

  TextEditingController txt_title=TextEditingController();
  TextEditingController txt_note=TextEditingController();

  @override
  void initState() {
    setState(() {
      txt_title.text=widget.note_title;
      txt_note.text=widget.note_description;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 3,
        title: Text(
          "Not Güncelleme",
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
                  padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                  child: Text(
                    "Not Başlığı",
                    style: GoogleFonts.ubuntu(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                  child: TextField(
                    controller: txt_title,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 100,
                    style: GoogleFonts.ubuntu(
                      fontSize: 20.sp,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Not Başlığı",
                      hintStyle: GoogleFonts.ubuntu(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                  child: Text(
                    "Not",
                    style: GoogleFonts.ubuntu(
                      fontSize: (22.5).sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                  child: TextField(
                    style: GoogleFonts.ubuntu(
                      fontSize: 22.5.sp,
                    ),
                    controller: txt_note,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 1500,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Not",
                      hintStyle: GoogleFonts.ubuntu(
                        fontSize: 22.5.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.only(left: 85,right: 85,bottom: 20),
        height: 66,
        child: ElevatedButton(
          onPressed: (){
            if (txt_title.text.toString()!="" && txt_note.text.toString()!=""){
              updateNote(widget.note_id, txt_title.text.toString(), txt_note.text.toString());
              updateFavNote(widget.note_id, txt_title.text.toString(), txt_note.text.toString());
              Fluttertoast.showToast(
                msg: "Notunuz güncellendi",
                fontSize: 16.sp,
                backgroundColor: Colors.blueGrey,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  TransitionPage(indexValue: widget.indexValue,)));

            }else{
              Fluttertoast.showToast(
                msg: "İlgili alanlar boş bırakılmaz",
                fontSize: 16.sp,
                backgroundColor: Colors.blueGrey,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            }
          },
          child: Text(
            "Notu Kaydet",
            style: GoogleFonts.ubuntu(
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 3
          ),
        ),
      ),
    );
  }
}
