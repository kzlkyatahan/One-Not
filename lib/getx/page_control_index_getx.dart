import 'package:get/get.dart';

class PageIndexController extends GetxController{
  var indexValue=0.obs;

  int get tValue => indexValue.value;

  void indexValueChange(int index){
    indexValue.value=index;
  }
}