import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatefulWidget {
   Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {


   bool isMale = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Image(
                      image: AssetImage('assets/images/1.jpg'),
                    width: isMale ? 220.w : 150.w,
                    height: isMale ? 220.h : 150.h,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Image(
                    image: AssetImage('assets/images/2.jpg'),
                    width: isMale ? 150.w : 220.w,
                    height: isMale ? 150.h : 220.h,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
