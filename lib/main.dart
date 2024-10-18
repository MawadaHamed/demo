import 'package:flutter/material.dart';
import 'package:islami_application/homescreen.dart';
import 'package:islami_application/tabs/hadeth/hadeth_content.dart';
import 'package:islami_application/tabs/quran/sura_content_screen.dart';
import 'package:islami_application/tabs/setting/setting.dart';
import 'package:islami_application/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  SettingProvider obj =SettingProvider();
  runApp(ChangeNotifierProvider(
      create: (_) => obj,
      child: IslamiApp()));
  obj.Mode();
  obj.language();
}

class IslamiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraContent.routeName:(_) => SuraContent(),
        HadethContent.routeName:(_)=> HadethContent(),
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      themeMode: settingProvider.themeMode,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.languageCode),
    );
  }
}
