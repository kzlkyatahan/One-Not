import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not/database_sqflite/database_dao.dart';

class NoteAddPage extends StatefulWidget {

  NoteAddPage({super.key});

  @override
  State<NoteAddPage> createState() => _NoteAddPageState();
}

class _NoteAddPageState extends State<NoteAddPage> {

  TextEditingController txt_title=TextEditingController();
  TextEditingController txt_note=TextEditingController();

  Future<void> addNote(String note_title,String note_description) async {
    await Notesdao().addNote(note_title, note_description);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 15,),
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
          child: TextField(
            style: GoogleFonts.ubuntu(
              fontSize: 20.sp,
            ),
            controller: txt_note,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 1500,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Not",
              hintStyle: GoogleFonts.ubuntu(
                fontSize: 20.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 300,),
        SizedBox(
          height: 43,
          width: 160,
          child: ElevatedButton(
            onPressed: (){
              if (txt_title.text.toString()!="" && txt_note.text.toString()!=""){
                addNote(txt_title.text.toString(), txt_note.text.toString());
                Fluttertoast.showToast(
                  msg: "Notunuz oluşturuldu",
                  fontSize: 16.sp,
                  backgroundColor: Colors.blueGrey,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
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
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 3,
            ),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
