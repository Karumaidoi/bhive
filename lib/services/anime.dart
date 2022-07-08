import 'package:bhive/model/question_model.dart';
import 'package:hive/hive.dart';

part 'anime.g.dart';

@HiveType(typeId: 1,)
class Anime {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String startQuestionId;
  @HiveField(2)
  List<Questions> questions;
  @HiveField(3)
  final String strings;
  

  Anime(
      {
        required this.id,
        required this.questions,
        required this.startQuestionId,
        required this.strings,
      });
}