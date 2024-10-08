import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
 double angle = 180 * 3.14 / 180;
  late int counter = 0;
  int currentZekrIndex = 0;
  List<String> zekr = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/headofseb7a.png'))
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .04,),
            InkWell(
                radius: 60,
                onTap: () =>
                    setState(() {
                      counter++;
                      angle += 90;
                      changeZekr();
                    }),

                child:
                Transform.rotate(
                  angle: angle,
                    child: Image.asset('assets/images/bodyofseb7a.png',))
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('عدد التسبيحات',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.sizeOf(context).height * .08,
                  width: MediaQuery.sizeOf(context).width * .18,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25),
                      color: Theme
                          .of(context)
                          .primaryColor
                  ),
                  child: Text('$counter',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * .04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(alignment: Alignment.center,
                    height: MediaQuery.sizeOf(context).height * .05,
                    width: MediaQuery.sizeOf(context).width * .3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme
                            .of(context)
                            .primaryColor),
                    child:
                    Text('${zekr[currentZekrIndex]}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),))
              ],
            )
          ],
        ),
      ),
    );
  }

  void changeZekr() {
    setState(() {
    });
    for (int i = 0; i < 1000; i++) {
      if (counter % 33 == 0) {
        currentZekrIndex = (currentZekrIndex + 1) % zekr.length;
      }
    }
  }
}