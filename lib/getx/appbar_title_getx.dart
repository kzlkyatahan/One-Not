import 'package:get/get.dart';

class AppBarTitleController extends GetxController{
  var titleValue="Ana Sayfa".obs;

  String get tValue => titleValue.value;

  void titleChange(String title){
    titleValue.value=title;
  }
}