import 'dart:convert';
import 'package:resep/model/resep.api.dart';
import 'package:resep/model/resep.dart';
import 'package:http/http.dart' as http;

class ResepApi {
//   const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "24",
// 	"start": "0"
// });

// req.headers({
// 	"X-RapidAPI-Key": "b6c385ad3dmshc6666137b7a48fbp136ddfjsna2dd4f54ad67",
// 	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
// 	"useQueryString": true
// });

  static Future<List<Resep>> getResep() async {
    var uri = Uri.http(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": "4", "start": "0"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "b6c385ad3dmshc6666137b7a48fbp136ddfjsna2dd4f54ad67",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Resep.resepFromSnapshot(temp);
  }
}
