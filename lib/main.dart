import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/gender_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ScreenUtilInit(
      designSize:  Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GenderScreen(),
      ),
    );
  }
}
