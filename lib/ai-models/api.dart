import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_buddy/ai-models/chatModel.dart';
import 'package:ai_buddy/ai-models/model.dart';
import 'package:ai_buddy/assets/api_info.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<List<Model>> getAIModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_key'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print(
        //     "jsonResponse[error][message] : ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']['message']);
      }
      List modelList = [];
      for (var value in jsonResponse['data']) {
        modelList.add(value);

        // log('ModelList : ${value['id']}');
      }

      return Model.aiModelsFromSnapshot(modelList);
    } catch (e) {
      print('Error $e');
      rethrow;
    }
  }

  static Future<List<chatModel>> sendMessage(
      {required String msg, required String modelID}) async {
    try {
      var response = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            'Authorization': 'Bearer $API_key',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            "model": modelID,
            "messages": [
              {"role": "user", "content": msg}
            ],
            "temperature": 0.7
          }));

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print(
        //     "jsonResponse[error][message] : ${jsonResponse['error']["message"]}");
        print("sendMessage is blocked");
        throw HttpException(jsonResponse['error']['message']);
      }

      List<chatModel> chatList = [];

      if (jsonResponse['choices'].length > 0) {
        log("jsonResponse['choices']['text'] = ${jsonResponse['choices'][0]['message']['content']}");

        chatList = List.generate(
            jsonResponse['choices'].length,
            (index) => chatModel(
                msg: jsonResponse['choices'][index]['message']['content'],
                index: 1));
      }
      return chatList;
    } catch (e) {
      print('Error $e');
      rethrow;
    }
  }
}
