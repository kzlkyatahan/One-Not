import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:not/database_sqflite/database_dao.dart';
import 'package:not/database_sqflite/model.dart';
import 'package:not/pages/details_page.dart';
import 'package:not/pages/note_update_page.dart';

class HomePage extends StatefulWidget {

  final int indexValue;

  HomePage({Key? key,required this.indexValue}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Notes>> bringNotes() async {
    var noteList=await Notesdao().readNotes();

    return noteList;
  }

  Future<void> addFavNote(String note_title,String note_description) async {
    await Notesdao().addFavNote(note_title, note_description);
  }

  Future<void> addDelNote(String note_title,String note_description) async {
    await Notesdao().addDelNote(note_title, note_description);
  }

  Future<void> deleteNoteTbl(int note_id) async {
    await Notesdao().deleteNote(note_id);
  }

  Future<void> deleteFavNoteTbl(int note_id) async {
    await Notesdao().deleteFavNote(note_id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20,),
        FutureBuilder<List<Notes>>(
          future: bringNotes(),
          builder: (context,AsyncSnapshot<List<Notes>> snapshot) {
            if (snapshot.hasData){
              var notesList=snapshot.data;
              if (notesList!.isNotEmpty){
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    var note=notesList[index];
                    return PopupMenuButton(
                      enableFeedback: false,
                      elevation: 5,
                      tooltip: "İlgili Not Kartı",
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: Colors.teal,
                      offset: Offset(2,8),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          padding: EdgeInsets.all(10),
                          value: 1,
                          child: Text(
                            "Detay Göster",
                            style: GoogleFonts.ubuntu(
                              fontSize: (15.5).sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.all(10),
                          value: 2,
                          child: Text(
                            "Güncelle",
                            style: GoogleFonts.ubuntu(
                              fontSize: (15.5).sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.all(10),
                          value: 3,
                          child: Text(
                            "Favorilere Ekle",
                            style: GoogleFonts.ubuntu(
                              fontSize: (15.5).sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          padding: EdgeInsets.all(10),
                          value: 4,
                          child: Text(
                            "Sil",
                            style: GoogleFonts.ubuntu(
                              fontSize: (15.5).sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      onCanceled: (){
                        debugPrint("Herhangi bir seçim yapılmadı");
                      },
                      onSelected: (menuItemValue){
                        if (menuItemValue==1){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailsPage(
                            indexValue: widget.indexValue,note_title: note.note_title,
                            note_description: note.note_description,
                          ),
                          ));
                        }
                        if (menuItemValue==2){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NoteUpdatePage(
                              indexValue: widget.indexValue,note_id: note.note_id,note_title: note.note_title,
                              note_description: note.note_description),
                          ));
                        }
                        if (menuItemValue==3){
                          addFavNote(note.note_title, note.note_description);
                          Fluttertoast.showToast(
                            msg: "Notunuz favorilere eklendi",
                            fontSize: 16.sp,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                        }
                        if (menuItemValue==4){
                          addDelNote(note.note_title, note.note_description);
                          deleteNoteTbl(note.note_id);
                          deleteFavNoteTbl(note.note_id);
                          Fluttertoast.showToast(
                            msg: "Notunuz silindi",
                            fontSize: 16.sp,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                          );
                        }
                        setState(() {});
                      },
                      child: Card(
                        semanticContainer: true,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: EdgeInsets.only(top: 8.0,bottom: 8.0,left: 14.0,right: 14.0),
                        child: Padding(
                          padding: EdgeInsets.only(left: 12.0,right: 12.0,top: 14.0,bottom: 14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Not Başlığı: ",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${note.note_title}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 19.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 30,
                                thickness: 2,
                              ),
                              Text(
                                "Not Detayı",
                                style: GoogleFonts.ubuntu(
                                  fontSize: (17.5).sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4,),
                              Text(
                                "${note.note_description}",
                                style: GoogleFonts.ubuntu(
                                  fontSize: (17.5).sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }else{
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset(
                        "assets/not_found.json",
                        width: 180,
                        height: 180,
                      ),
                    ),
                  ],
                );
              }
            }else{
              return Center();
            }
          },
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}