import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/tabs/quran/surawidget.dart';
import 'package:islami_application/theme.dart';

class SuraContent extends StatefulWidget {
  static const String routeName = '/suraContent';

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
   late SuraWidget args;

  List<String> ayat =[];

  @override
  Widget build(BuildContext context) {
       args = ModalRoute.of(context)!.settings.arguments as SuraWidget;
   if(ayat.isEmpty) {
     loadSuraFile();
   }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/bg3.png'),
              fit: BoxFit.fill,
            )
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
             args.suraName
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(18),
            margin: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: MediaQuery.sizeOf(context).height * .07
            ),
            decoration: BoxDecoration(
              color: ThemeApp.white,
              borderRadius: BorderRadius.circular(25)
            ),
            child: ListView.builder(
              itemBuilder: (context, index) => Text(ayat[index],
              style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              itemCount: ayat.length,
            ),
          ),
        )
    );
  }

  Future<void> loadSuraFile()async{
   String sura =
   await rootBundle.loadString('assets/suras/${args.index + 1}.txt');
   ayat =  sura.split('\n');
   setState(() {});
  }
}
