import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/SuccessIcon.png'),
            const Gap(10),
            const Text(
              'Success',
          
            ),
            const Gap(10),
            const SizedBox(
              width: 220,
              child: Text(
                'thank you for shopping From MEGA Store',
                textAlign: TextAlign.center,
               
              ),
            ),
            const Gap(40),
            InkWell(
              onTap: (){
             //   Get.to(()=>const HomeView());
              },
              child: Container(
                // margin: const EdgeInsets.all(10),
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                 // color: TColor.title3,
                  borderRadius: BorderRadius.circular(5),
                  /*border: Border.all(
                    color: TColor.offwhite, // Specify the color of the border
                    width: 2.0, // Specify the width of the border
                  ),*/
                ),
                child: const Center(
                    child: Text(
                  'Back To Home ',
                
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
