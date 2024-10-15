import 'package:flutter/material.dart';

class SuraWidget extends StatelessWidget {
  String suraName;
  int suraNumber;
  int index;

  SuraWidget({required this.suraNumber,required this.suraName,required this.index});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround
      ,
      children: [
        Text(suraName,
          style: Theme.of(context).textTheme.titleLarge,),
        Text(suraNumber.toString(),
          style: Theme.of(context).textTheme.titleLarge,)
      ],
    );
  }
}
