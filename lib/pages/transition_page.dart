import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not/getx/appbar_title_getx.dart';
import 'package:not/getx/page_control_index_getx.dart';
import 'package:not/pages/about_app_page.dart';
import 'package:not/pages/delete_notes_page.dart';
import 'package:not/pages/favorite_notes_page.dart';
import 'package:not/pages/home_page.dart';
import 'package:not/pages/note_add_page.dart';

class TransitionPage extends StatefulWidget {

  final int indexValue;

  TransitionPage({Key? key,required this.indexValue}) : super(key: key);

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage>
    with SingleTickerProviderStateMixin {

  void nativeSplashInitialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  void onItemTapped(int index) {
    if (index==0){
      appbarTitleController.titleChange("Ana Sayfa");
      pageIndexController.indexValueChange(0);
    }else if (index==1){
      appbarTitleController.titleChange("Favori Notlar");
      pageIndexController.indexValueChange(1);
    }else if (index==2){
      appbarTitleController.titleChange("Not Ekle");
      pageIndexController.indexValueChange(2);
    }else if (index==3){
      appbarTitleController.titleChange("Silinen Notlar");
      pageIndexController.indexValueChange(3);
    }else if (index==4){
      appbarTitleController.titleChange("Uygulama Hakkında");
      pageIndexController.indexValueChange(4);
    }
  }

  @override
  void initState() {
    super.initState();
    nativeSplashInitialization();
    onItemTapped(widget.indexValue);
  }

  final appbarTitleController = Get.put(AppBarTitleController());
  final pageIndexController=Get.put(PageIndexController());

  static List<Widget> widgetOptions = [
    HomePage(indexValue: 0,),
    FavoriteNotesPage(indexValue: 1,),
    NoteAddPage(),
    DeleteNotesPage(indexValue: 3,),
    AboutAppPage(),
  ];

  Future<bool> backKey(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.only(
            left: 24,
            right: 24.0,
            top: 22.0,
          ),
          actionsPadding: const EdgeInsets.only(
            top: 25.0,
            right: 15.0,
            bottom: 10.0,
          ),
          titlePadding: const EdgeInsets.only(
            left: 24,
            top: 20.0,
          ),
          title: Text(
            "Uyarı",
            style: GoogleFonts.ubuntu(
              fontSize: 25.sp,
            ),
          ),
          content: Text(
            "Çıkış yapmak istiyor musunuz?",
            style: GoogleFonts.ubuntu(
              fontSize: (17.2).sp,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text(
                "Evet",
                style: GoogleFonts.ubuntu(
                  fontSize: (17.2).sp,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Hayır",
                style: GoogleFonts.ubuntu(
                  fontSize: (17.2).sp,
                ),
              ),
            ),
          ],
        );
      },
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0.h),
        child: AppBar(
          elevation: 5,
          shadowColor: Colors.black,
          scrolledUnderElevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/splash_image.png",
                      width: 45.w,
                      height: 45.w,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "One Not",
                      style: GoogleFonts.ubuntu(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(160.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, bottom: 15.0),
                  child: Obx(
                    () => Text(
                      appbarTitleController.titleValue.value,
                      style: GoogleFonts.ubuntu(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                tooltip: "Çıkış Yap",
                color: Colors.black,
                onPressed: () {
                  backKey(context);
                },
                icon: Icon(
                  Icons.logout_rounded,
                  size: 29.w,
                ),
              ),
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () => backKey(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => widgetOptions.elementAt(pageIndexController.indexValue.value),),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() =>
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: "Ana Sayfa",
                backgroundColor: Theme.of(context).colorScheme.secondary,
                tooltip: "Ana Sayfa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded),
                label: "Favoriler",
                backgroundColor: Theme.of(context).colorScheme.secondary,
                tooltip: "Favoriler",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_rounded),
                label: "Not Ekle",
                backgroundColor: Theme.of(context).colorScheme.secondary,
                tooltip: "Not Ekle",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.delete_forever_rounded),
                label: "Silinenler",
                backgroundColor: Theme.of(context).colorScheme.secondary,
                tooltip: "Silinenler",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info_rounded),
                label: "Hakkında",
                backgroundColor: Theme.of(context).colorScheme.secondary,
                tooltip: "Hakkında",
              ),
            ],
            currentIndex: pageIndexController.indexValue.value,
            selectedItemColor: Colors.white,
            onTap: onItemTapped,
            selectedFontSize: 16.sp,
            unselectedFontSize: 16.sp,
            iconSize: (28.5).sp,
          ),
      )
    );
  }
}