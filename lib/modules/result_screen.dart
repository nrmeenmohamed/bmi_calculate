import 'package:bmi_calculator/shared/components/components.dart';
import 'package:bmi_calculator/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  final double weight;
  final double height;
  final double bmi;
  final String bmiCategory;

  const ResultScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.bmiCategory,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: textColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(
              'Result',
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Center(
              child: Container(
                height: 400.h,
                width: MediaQuery.of(context).size.width*0.9,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: Colors.red,
                            title: 'obese',
                            radius: bmiCategory == 'obese' ? 50.r : 40.r ,
                            borderSide: const BorderSide(
                              color: Colors.black
                            ),
                            titleStyle: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            titlePositionPercentageOffset: 1.7,
                          ),
                          PieChartSectionData(
                            //value: 70,
                            color: Colors.blue,
                            title: 'under weight',
                            radius: bmiCategory == 'under weight' ? 50.r : 40.r ,
                            borderSide: const BorderSide(
                                color: Colors.black
                            ),
                            titleStyle: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            titlePositionPercentageOffset: 1.7,
                          ),
                          PieChartSectionData(
                           // value: 70,
                            color: Colors.green,
                            title: 'normal weight',
                            radius: bmiCategory == 'normal weight' ? 50.r : 40.r ,
                            borderSide: const BorderSide(
                                color: Colors.black
                            ),
                            titleStyle: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            titlePositionPercentageOffset: 1.7,
                          ),
                          PieChartSectionData(
                           // value: 70,
                            color: Colors.orange,
                            title: 'over weight',
                            radius: bmiCategory == 'over weight' ? 50.r : 40.r ,
                            borderSide: const BorderSide(
                                color: Colors.black
                            ),
                            titleStyle: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            titlePositionPercentageOffset: 1.7,
                          ),
                        ]
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultText(
                          text: bmi.toStringAsFixed(1),
                        ),
                        SizedBox(height: 8.h,),

                        defaultText(
                          text: bmiCategory,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
