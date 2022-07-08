import 'package:flutter/material.dart';
import '../services/anime.dart';
import '../ui/details_home.dart';

class AnimeItem extends StatelessWidget {
  final Anime anime;

  const AnimeItem({Key? key, required this.anime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => AnimeDetails(anime: anime))),
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.green),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: anime.id.length < 50
                  ? Text(
                      anime.id,
                      style:
                          TextStyle(color: Colors.white, fontSize: 20),
                    )
                  : Text(
                      anime.startQuestionId,
                      style:
                          TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Text(
                      anime.questions.toString(),
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ],
                )),
            Positioned(
                bottom: 10,
                left: 10,
                child: anime.strings == "Finished Airing"
                    ? const Text(
                        "Completed",
                        style:  TextStyle(fontSize: 10, color: Colors.white),
                      )
                    : const Text("Airing",
                        style: TextStyle(fontSize: 10, color: Colors.white)))
          ])),
    );
  }
}