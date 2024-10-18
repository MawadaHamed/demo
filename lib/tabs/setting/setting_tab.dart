import 'package:flutter/material.dart';
import 'package:islami_application/theme.dart';
import 'package:provider/provider.dart';
import 'package:islami_application/tabs/setting/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'langauge.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<Language> languages =[
    Language(name: 'English', code: 'en'),
    Language(name: 'العربيه', code: 'ar')
  ];
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( AppLocalizations.of(context)!.darkmode,
              style: Theme.of(context).
              textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value:
                settingProvider.isDark,
                  onChanged: (isDark) {
                    settingProvider
                        .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light);
                  },
                activeTrackColor: ThemeApp.gold,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( AppLocalizations.of(context)!.language,
                style: Theme.of(context).
                textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languages.firstWhere((Language) =>
                  Language.code == settingProvider.languageCode),
                    items:languages.map((Language) =>
                        DropdownMenuItem(child:
                        Text(
                          Language.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                          value: Language,
                        )
                    ).toList(),

                    onChanged: (selectedLanguage){
                    if(selectedLanguage != null) return
                      settingProvider.changeLanguage(selectedLanguage.code);
                    settingProvider.language();
                    },
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: settingProvider.isDark ?
                  ThemeApp.darkPrimary
                      : ThemeApp.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
