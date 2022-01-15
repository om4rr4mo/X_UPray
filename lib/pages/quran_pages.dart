import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/prayer_data.dart';

import 'loading_pages.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: quranProvider.getSurat(114),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data.data[0];

            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(data.ayahs[0].text, style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.normal, fontSize: 20),),
                    Text(data.ayahs[1].text, style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.normal, fontSize: 20),),
                    Text(data.ayahs[2].text, style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.normal, fontSize: 20),),
                    Text(data.ayahs[3].text, style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.normal, fontSize: 20),),
                    Text(data.ayahs[4].text, style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.normal, fontSize: 20),),
                    Text(data.ayahs[5].text, style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.normal, fontSize: 20),),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: LoadingPage());
          }
        });
  }
}
