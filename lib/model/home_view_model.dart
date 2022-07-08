import 'package:bhive/services/anime.dart';
import 'package:stacked/stacked.dart';
import '../services/hive_service.dart';
import './../services/api_service.dart';
import '../utils/locataor.dart';

class HomeViewModel extends BaseViewModel {
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();

  List<dynamic> _animeList = [];
  List<dynamic> get animeList => _animeList;
  String _text = "";
  String get text => _text;

  final String url =
      "https://run.mocky.io/v3/d628facc-ec18-431d-a8fc-9c096e00709a";

  getData() async {
    _text = "Fetching data";
    bool exists = await hiveService.isExists(boxName: "AnimeTable");
    if (exists) {
      print('We already stored the data');
      _text = "Fetching from hive";
      setBusy(true);
      _animeList = await hiveService.getBoxes("AnimeTable");
      setBusy(false);
    } else {
      print('Fetching from API');
      _text = "Fetching from hive";
      setBusy(true);
      var result = await apiService.fetchData(url: url);
      (result as List).map((e) {
        Anime anime = Anime(
          id: e["id"],
          startQuestionId: e["startQuestionId"],
          questions: e["Questions"],
          strings: e["string"],
        );
        _animeList.add(anime);
      }).toList();
      _text = "Caching data";
      await hiveService.addBoxes(_animeList, "AnimeTable");
      setBusy(false);
    }
  }
}
