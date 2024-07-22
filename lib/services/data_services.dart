import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lawtech/models/data_model.dart';

class DataServices {
  String baseUrl = "https://ws.api.video";

  Future<List<VideoData>> getInfo() async {
    var apiUrl = "/videos";
    var headers = {
      "Authorization": "Bearer ${dotenv.dotenv.env['API_KEY']}",
    };

    http.Response res =
        await http.get(Uri.parse(baseUrl + apiUrl), headers: headers);
    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> map = json.decode(res.body);
        List<dynamic> list = map['data'];
        print(list[0]);
        return list.map((e) => VideoData.fromJson(e)).toList();
      } else {
        return <VideoData>[];
      }
    } catch (e) {
      print(e);
      return <VideoData>[];
    }
  }

  Future<List<Books>> getBooks() async {
    var apiUrl = "https://www.dbooks.org/api/search/law";

    http.Response response = await http.get(Uri.parse(apiUrl));
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        List<dynamic> books = map['books'];

        // Limit the books list to a maximum of 10 objects
        List<dynamic> limitedBooks =
            books.length > 2 ? books.sublist(0, 2) : books;

        return limitedBooks.map((e) => Books.fromJson(e)).toList();
      } else {
        return <Books>[];
      }
    } catch (e) {
      return <Books>[];
    }
  }
}
