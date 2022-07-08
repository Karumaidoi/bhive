import 'dart:convert';

import 'package:bhive/model/question_model.dart';
import 'package:http/http.dart' as http;

class GetData {
  Future<QuestionModel> getDataApi() async {
    var url = 'https://run.mocky.io/v3/d628facc-ec18-431d-a8fc-9c096e00709a';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Consume the Data');
      return QuestionModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Unable to get Data from the API***');
    }
  }
}
