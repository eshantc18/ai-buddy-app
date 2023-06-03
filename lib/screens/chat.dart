import 'dart:developer';

import 'package:ai_buddy/ai-models/api.dart';
import 'package:ai_buddy/ai-models/chatModel.dart';
import 'package:ai_buddy/assets/colors.dart';
import 'package:ai_buddy/provider/modelProvider.dart';
import 'package:ai_buddy/screens/bottomNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatState();
  }
}

class _ChatState extends State<Chat> {
  late bool _isTyping = false;
  late TextEditingController _inputController;
  List<chatModel> chatList = [];

  @override
  void initState() {
    // TODO: implement initState
    _inputController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _inputController.dispose();
    super.dispose();
  }

  Future<void> sendMsg({required modelProvider modProvider}) async {
    setState(() {
      _isTyping = false;
    });
    log('Request has been sent by ${modProvider.curModel}');
    try {
      chatList = await API.sendMessage(
          modelID: modProvider.curModel, msg: _inputController.text);
      setState(() {});
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final modProvider = Provider.of<modelProvider>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          bottomNavigationBar: BottomNavigator(1),
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                constraints.maxWidth * 0.01,
                                constraints.maxHeight * 0.01,
                                constraints.maxWidth * 0.01,
                                constraints.maxHeight * 0.01),
                            child: Card(
                                color: cardColor,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      constraints.maxWidth * 0.01,
                                      constraints.maxHeight * 0.01,
                                      constraints.maxWidth * 0.01,
                                      constraints.maxHeight * 0.01),
                                  child: Text(
                                    chatList[index].msg,
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.justify,
                                  ),
                                )),
                          )
                          // Text(chatList[index].index as String)
                        ],
                      );
                    }),
                  ),
                ),
                if (_isTyping) ...[
                  const SpinKitThreeBounce(
                    color: Colors.white,
                    size: 25,
                  ),
                ],
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      constraints.maxWidth * 0.01,
                      constraints.maxHeight * 0.01,
                      constraints.maxWidth * 0.01,
                      constraints.maxHeight * 0.01),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: cardColor,
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                constraints.maxWidth * 0.02, 0, 0, 0),
                            child: TextField(
                              style: TextStyle(color: Colors.grey),
                              controller: _inputController,
                              onTap: () {
                                setState(() {
                                  _isTyping = true;
                                });
                              },
                              onSubmitted: (_) async {
                                await sendMsg(modProvider: modProvider);
                              },
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ask me anything.....",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              autocorrect: true,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send_rounded),
                        onPressed: () async {
                          await sendMsg(modProvider: modProvider);
                        },
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
