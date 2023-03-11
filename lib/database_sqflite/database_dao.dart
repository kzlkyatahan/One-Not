import 'package:not/database_sqflite/database_helper.dart';
import 'package:not/database_sqflite/model.dart';

class Notesdao{

  Future<List<Notes>> readNotes() async{
    var db=await DataBaseHelper.databaseAccess();
    List<Map<String,dynamic>> mapsNotes=await db.rawQuery(
      "SELECT * FROM notesTbl"
    );

    return List.generate(mapsNotes.length, (index) {
      var item=mapsNotes[index];

      return Notes(item["note_id"],item["note_title"],item["note_description"]);

    });

  }

  Future<List<Notes>> readFavNotes() async{
    var db=await DataBaseHelper.databaseAccess();
    List<Map<String,dynamic>> mapsNotes=await db.rawQuery(
        "SELECT * FROM notesFavTbl"
    );

    return List.generate(mapsNotes.length, (index) {
      var item=mapsNotes[index];

      return Notes(item["note_id"],item["note_title"],item["note_description"]);

    });

  }

  Future<List<Notes>> readDelNotes() async{
    var db=await DataBaseHelper.databaseAccess();
    List<Map<String,dynamic>> mapsNotes=await db.rawQuery(
        "SELECT * FROM notesDelTbl"
    );

    return List.generate(mapsNotes.length, (index) {
      var item=mapsNotes[index];

      return Notes(item["note_id"],item["note_title"],item["note_description"]);

    });

  }

  Future<void> addNote(String note_title,String note_description)
  async{
    var db=await DataBaseHelper.databaseAccess();

    var notes=Map<String,dynamic>();
    notes["note_title"]=note_title;
    notes["note_description"]=note_description;

    await db.insert("notesTbl", notes);
  }

  Future<void> addFavNote(String note_title,String note_description)
  async{
    var db=await DataBaseHelper.databaseAccess();

    var notes=Map<String,dynamic>();
    notes["note_title"]=note_title;
    notes["note_description"]=note_description;

    await db.insert("notesFavTbl", notes);
  }

  Future<void> addDelNote(String note_title,String note_description)
  async{
    var db=await DataBaseHelper.databaseAccess();

    var notes=Map<String,dynamic>();
    notes["note_title"]=note_title;
    notes["note_description"]=note_description;

    await db.insert("notesDelTbl", notes);
  }

  Future<void> deleteNote(int note_id) async {
    var db=await DataBaseHelper.databaseAccess();

    await db.delete("notesTbl",where: "note_id = ?",whereArgs: [note_id]);
  }

  Future<void> deleteFavNote(int note_id) async {
    var db=await DataBaseHelper.databaseAccess();

    await db.delete("notesFavTbl",where: "note_id = ?",whereArgs: [note_id]);
  }

  Future<void> deleteDelNote(int note_id) async {
    var db=await DataBaseHelper.databaseAccess();

    await db.delete("notesDelTbl",where: "note_id = ?",whereArgs: [note_id]);
  }

  Future<void> updateNote(int note_id,String note_title,String note_description) async{
    var db=await DataBaseHelper.databaseAccess();

    var notes=Map<String,dynamic>();
    notes["note_title"]=note_title;
    notes["note_description"]=note_description;

    await db.update("notesTbl",notes,where: "note_id = ?",whereArgs: [note_id]);

  }

  Future<void> updateFavNote(int note_id,String note_title,String note_description) async{
    var db=await DataBaseHelper.databaseAccess();

    var notes=Map<String,dynamic>();
    notes["note_title"]=note_title;
    notes["note_description"]=note_description;

    await db.update("notesFavTbl",notes,where: "note_id = ?",whereArgs: [note_id]);

  }

}