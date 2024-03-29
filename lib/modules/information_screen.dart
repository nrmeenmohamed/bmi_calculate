import 'package:bmi_calculator/modules/result_screen.dart';
import 'package:bmi_calculator/shared/components/components.dart';
import 'package:bmi_calculator/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationScreen extends StatelessWidget {
   InformationScreen({super.key});

   var formKey = GlobalKey<FormState>();
   var tallController = TextEditingController();
   var weightController = TextEditingController();

   double tall = 0.0;
   double weight = 0.0;


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
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText(
                      text: 'How tall are you ?',
                    fontSize: 20.sp,
                  ),
                  defaultText(
                    text: '[in m]',
                    fontSize: 12.sp,
                  ),
                  SizedBox(height: 20.h,),


                  defaultTextField(
                      controller: tallController,
                      onFieldSubmitted: (value){
                        tall = double.parse(value);
                        if(tall <=0 ){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter valid value',
                              ),
                            ),
                          );

                        }
                        debugPrint(value);
                      },
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Enter your tall';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 25.h,),


                  defaultText(
                    text: 'What is your weight ?',
                    fontSize: 20.sp,
                  ),
                  defaultText(
                    text: '[in kg]',
                    fontSize: 12.sp,
                  ),
                  SizedBox(height: 20.h,),


                  defaultTextField(
                      controller: weightController,
                      onFieldSubmitted: (value){
                        weight = double.parse(value);
                        if(weight <=0 ){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter valid value',
                              ),
                            ),
                          );

                        }
                        debugPrint(value);
                      },
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Enter your weight';
                        }
                        return null;
                      }
                  ),
                 SizedBox(height: 50.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      defaultButton(
                        onPressed: (){
                          tallController.clear();
                          weightController.clear();
                        },
                        widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.restart_alt_outlined,
                            ),
                            SizedBox(width: 5.w,),
                            const Text(
                              'Clear',
                            ),
                          ],
                        ),
                        minimumSize:Size(
                            MediaQuery.of(context).size.width*0.4,
                            MediaQuery.of(context).size.height*0.06,
                        ),
                      ),

                      defaultButton(
                        onPressed: (){
                          if( formKey.currentState  != null && formKey.currentState!.validate()){
                            double bmi =  calculateBmi(weight , tall);
                            String category = bmiCategory(bmi);
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                  weight: weight,
                                  height: tall,
                                  bmi: bmi,
                                  bmiCategory: category,
                                ),
                              ),
                            );
                          }
                        },
                        widget: const Text(
                              'Calculate',
                            ),
                        minimumSize:Size(
                          MediaQuery.of(context).size.width*0.4,
                          MediaQuery.of(context).size.height*0.06,
                        ),
                      ),


                    ],
                  ),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



double calculateBmi(double weight, double height){
  double bmi = weight / (height * height);
  return bmi;
  }


  String bmiCategory(double bmi){
    if(bmi < 18.5){
      return 'under weight';
    }else if(bmi >= 18.5 && bmi < 25) {
      return 'normal weight';
    }else if(bmi >= 25 && bmi < 30) {
      return 'over weight';
    }else{
      return 'obese';
    }
  }