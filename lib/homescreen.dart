import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_application/tabs/quran/quran_tap.dart';
import 'package:islami_application/tabs/radio/radio_tab.dart';
import 'package:islami_application/tabs/sebha/sebha_tab.dart';
import 'package:islami_application/tabs/setting/setting.dart';
import 'package:islami_application/tabs/setting/setting_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
            'assets/images/${Provider.of<SettingProvider>(context).backgroundImageName}.png'),
          fit: BoxFit.fill,
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title:Text(AppLocalizations.of(context)!.islami,)
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/images/quran.png'),
            ),
                label: AppLocalizations.of(context)!.quran
            ),
            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/images/hadeth.png'),
            ),
                label: AppLocalizations.of(context)!.hadeth
            ),
            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/images/sebha.png'),
            ),
                label: AppLocalizations.of(context)!.sebha
            ),
            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/images/radio.png'),
            ),
                label: AppLocalizations.of(context)!.radio
            ),
            BottomNavigationBarItem(icon: Icon(
              Icons.settings,
            ),
                label: AppLocalizations.of(context)!.setting
            ),
          ],),
      ),
    );
  }
}