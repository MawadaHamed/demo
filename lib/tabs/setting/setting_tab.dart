import 'package:flutter/material.dart';
import 'package:islami_application/theme.dart';
import 'package:provider/provider.dart';
import 'package:islami_application/tabs/setting/setting.dart';


import 'langauge.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<Language> languages =[
    Language(name: 'English', code: 'en'),
    Language(name: 'arabic', code: 'ar')
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
              Text('Dark Theme',
              style: Theme.of(context).
              textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value:
                settingProvider.isDark,
                  onChanged: (isDark) => settingProvider
                      .changeTheme(isDark ? ThemeMode.dark: ThemeMode.light),
                activeTrackColor: ThemeApp.gold,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Language',
                style: Theme.of(context).
                textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languages.first,
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
                    if(selectedLanguage != null){
                      print(selectedLanguage.code);
                    }
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
