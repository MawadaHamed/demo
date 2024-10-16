import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/tabs/hadeth/hadeth.dart';
import 'package:islami_application/tabs/hadeth/hadeth_content.dart';

import '../../theme.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth=[];

  @override
  Widget build(BuildContext context) {
    if(ahadeth.isEmpty){
      loadhadethfile();
    }
    return Scaffold(
        body: Column(
            children: [
              Image.asset('assets/images/hadith_header.png'),
              Divider(thickness: 2,color: ThemeApp.lightPrimary,),
              Text('الاحاديث',
                style: Theme.of(context).textTheme.headlineSmall,),
              Divider(thickness: 2,color: ThemeApp.lightPrimary,),
              Expanded(
                child: ListView.builder(
                  itemBuilder:(context, index) =>
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed(
                              HadethContent.routeName,
                              arguments: ahadeth[index],
                            ),
                        child: Text(
                          ahadeth[index].title,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                  itemCount: ahadeth.length,
                ),
              ),
            ]
        )
    );
  }

  Future<void> loadhadethfile()async{
 String hadethFile = await rootBundle.loadString('assets/suras/ahadeth.txt');
 List<String> ahadethString = hadethFile.split('#');
  ahadeth = ahadethString.map((hadethString){
  List<String> hadethLine = hadethString.trim().split('\n');
  String title = hadethLine[0];
  hadethLine.removeAt(0);
  List<String> content = hadethLine ;
  return Hadeth(content, title);
 }).toList();
 setState(() {});
  }
}