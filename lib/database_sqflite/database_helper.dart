import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{

  static final String databaseName="notesDb.sqlite";

  static Future<Database> databaseAccess() async {
    String databasePath=join(await getDatabasesPath(),databaseName);

    if (await databaseExists(databasePath)){
      debugPrint("Veri tabanı zaten var.Kopyalamaya gerek yok");
    }else{
      ByteData data=await rootBundle.load("database_file/$databaseName");

      List<int> bytes=data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

      await File(databasePath).writeAsBytes(bytes,flush: true);
      debugPrint("Veri tabanı kopyalandı");
    }

    return openDatabase(databasePath);
  }

}