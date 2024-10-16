import 'package:flutter/material.dart';
import 'package:islami_application/tabs/hadeth/hadeth.dart';
import 'package:islami_application/tabs/setting/setting.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class HadethContent extends StatelessWidget {
  static const String routeName ='/hadeth-content';

  @override
  Widget build(BuildContext context) {
   Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
   SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
                'assets/images/${settingProvider.backgroundImageName}.png'),
              fit: BoxFit.fill,
            )
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
                hadeth.title
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(18),
            margin: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: MediaQuery.sizeOf(context).height * .07
            ),
            decoration: BoxDecoration(
                color:settingProvider.isDark ? ThemeApp.darkPrimary: ThemeApp.white,
                borderRadius: BorderRadius.circular(25)
            ),
            child: ListView.builder(
              itemBuilder: (context, index) => Text(hadeth.content[index],
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              itemCount: hadeth.content.length,
            ),
          ),
        )
    );
  }
}
