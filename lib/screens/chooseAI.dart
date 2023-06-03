import 'package:ai_buddy/ai-models/api.dart';
import 'package:ai_buddy/ai-models/model.dart';
import 'package:ai_buddy/assets/colors.dart';
import 'package:ai_buddy/provider/modelProvider.dart';
import 'package:ai_buddy/provider/modelProvider.dart';
import 'package:ai_buddy/screens/bottomNavigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class chooseAI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _chooseAIState();
  }
}

class _chooseAIState extends State<chooseAI> {
  String? currentModel;
  modelProvider mp = modelProvider();

  @override
  Widget build(BuildContext context) {
    final modProvider = Provider.of<modelProvider>(context, listen: false);
    currentModel = mp.curModel;
    return LayoutBuilder(builder: ((context, constraints) {
      return Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: const Text("AI Buddy"),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigator(2),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(constraints.maxHeight * 0.03),
              child: Card(
                color: cardColor,
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(constraints.maxWidth * 0.03),
                  width: constraints.maxWidth * 0.94,
                  height: constraints.maxHeight * 0.06,
                  child: const Center(
                    child: Text(
                      'Choose your preferred AI models',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder<List<Model>>(
                future: modProvider.getModels(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  }

                  return (snapshot.hasData)
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: constraints.maxHeight * 0.03,
                              right: constraints.maxHeight * 0.03),
                          child: Card(
                            color: cardColor,
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.03,
                                  right: constraints.maxWidth * 0.03),
                              width: constraints.maxWidth * 0.94,
                              child: DropdownButtonFormField(
                                value: currentModel,
                                style: const TextStyle(color: Colors.grey),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                dropdownColor: cardColor,
                                focusColor: Colors.white,
                                menuMaxHeight: constraints.maxHeight * 0.6,
                                alignment: Alignment.bottomCenter,
                                items: List<DropdownMenuItem<String>>.generate(
                                    snapshot.data!.length,
                                    (index) => DropdownMenuItem(
                                          value: snapshot.data![index].id,
                                          child: Text(snapshot.data![index].id),
                                        )),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: cardColor,
                                ),
                                onChanged: ((value) {
                                  setState(() {
                                    currentModel = value as String;
                                    mp.setCurrentModel(value.toString());
                                  });
                                }),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                })),
          ],
        ),
      );
    }));
  }
}
