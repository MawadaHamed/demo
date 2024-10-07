import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child:
                Image.asset('assets/images/radio_logo.png',))
              ],
            ),
            SizedBox(
              height:MediaQuery.sizeOf(context).height * .04,
              width:MediaQuery.sizeOf(context).width * .04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('إذاعة القرآن الكريم',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(
              height:MediaQuery.sizeOf(context).height * .07,
              width:MediaQuery.sizeOf(context).width * .04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('assets/images/group5.png')
              ],
            )
          ],
        ),
      ),
    );
  }
}