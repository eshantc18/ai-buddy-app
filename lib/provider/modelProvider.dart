import 'package:ai_buddy/ai-models/api.dart';
import 'package:ai_buddy/ai-models/model.dart';
import 'package:flutter/material.dart';

class modelProvider with ChangeNotifier {
  List<Model> models = [];
  String currentModel = 'gpt-3.5-turbo';

  List<Model> get modelList {
    return models;
  }

  String get curModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  Future<List<Model>> getModels() async {
    models = await API.getAIModels();
    return models;
  }
}
