import 'package:flutter/material.dart';

import '../services/anime.dart';

class AnimeDetails extends StatelessWidget {
  final Anime anime;

  const AnimeDetails({Key? key,required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        title: Text(
          anime.id,
          // style: GoogleFonts.lato(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[850],
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                    radius: 40,
                    child: Center(
                        child: Text(
                      anime.startQuestionId.substring(0, 1),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        anime.id,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Text(
                        anime.strings,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6)),
                      )
                    ],
                  ),
                )
              ],
            ),
            
          ],
        )),
      ),
    );
  }
}