import 'dart:convert';

import 'package:todo/Models/GetAllNotesModel.dart';
import 'package:http/http.dart' as http;
import 'package:todo/Services/Utillities/app_urls.dart';
class GetAllNotesApi
{



  Future<GetAllNotesModel> getAllNotes () async {

    final response = await http.get(Uri.parse(AppUrls.getAllNotesUrl));
    var body = jsonDecode(response.body.toString());

    if(response.statusCode == 200)
      {
        return GetAllNotesModel.fromJson(body);
      }
    else
      {
        return GetAllNotesModel.fromJson(body);
      }

  }

}