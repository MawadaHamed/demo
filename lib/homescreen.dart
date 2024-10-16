import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_application/tabs/quran/quran_tap.dart';
import 'package:islami_application/tabs/radio/radio_tab.dart';
import 'package:islami_application/tabs/sebha/sebha_tab.dart';
import 'package:islami_application/tabs/setting/setting.dart';
import 'package:islami_application/tabs/setting/setting_tab.dart';
import 'package:provider/provider.dart';

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
          title:Text('إسلامي',)
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
                label: 'Quran'
            ),
            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/images/hadeth.png'),
            ),
                label: 'Hadeth'
            ),
            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/images/sebha.png'),
            ),
                label: 'Sebha'
            ),
            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage('assets/images/radio.png'),
            ),
                label: 'Radio'
            ),
            BottomNavigationBarItem(icon: Icon(
              Icons.settings,
            ),
                label: 'Setting'
            ),
          ],),
      ),
    );
  }
}