import 'package:bmi_calculator/modules/information_screen.dart';
import 'package:bmi_calculator/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/styles/colors.dart';

class GenderScreen extends StatefulWidget {
   const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {

  bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            defaultText(
                text: 'What\'s Your Gender ?',
              fontSize: 20.sp,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Column(
                    children: [
                      Image(
                          image: const AssetImage('assets/images/female.png'),
                        width: isMale ? MediaQuery.of(context).size.width*0.3 : MediaQuery.of(context).size.width*0.4,
                        height: isMale ? MediaQuery.of(context).size.height*0.3 : MediaQuery.of(context).size.height*0.4,
                        fit: BoxFit.cover,

                      ),
                      SizedBox(height: 10.h,),
                      defaultText(
                          text: 'FEMALE',
                        fontSize: isMale ? 16.sp : 17.sp,
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Column(
                    children: [
                      Image(
                        image: const AssetImage('assets/images/male.png'),
                        width: isMale ? MediaQuery.of(context).size.width*0.4 :MediaQuery.of(context).size.width*0.3,
                        height: isMale ? MediaQuery.of(context).size.height*0.4 :MediaQuery.of(context).size.height*0.3,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10.h,),
                      defaultText(
                        text: 'MALE',
                        fontSize: isMale ? 17.sp : 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),

              ],
            ),

           SizedBox(height: 80.h,),

            defaultButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => InformationScreen(),
                  ),
                );
              },
                widget: const Text(
                  'Next',
                ),
                minimumSize: const Size.fromHeight(50),
            ),


          ],
        ),
      ),
    );
  }
}
