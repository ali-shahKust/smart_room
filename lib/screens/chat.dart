import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:math';

import 'package:smart_room/res.dart';
import 'package:smart_room/utils/apptheme.dart';



class ChatTwoPage extends StatefulWidget {
  static final String path = "lib/src/pages/misc/chat2.dart";
  @override
  _ChatTwoPageState createState() => _ChatTwoPageState();
}

class _ChatTwoPageState extends State<ChatTwoPage> {
  String text;
  TextEditingController _controller;
  final List<String> avatars = [

  ];
  final List<Message> messages = [
    Message(0,
        "But I may not go if the weather is bad. So lets see the weather condition 😀"),
    Message(0, "I suppose I am."),
    Message(1, "Are you going to market today?"),
    Message(0, "I am good too"),
    Message(1, "I am fine, thank you. How are you? "),
    Message(1, "Hi,"),
    Message(0, "How are you today?"),
    Message(0, "Hello,"),
  ];
  final rand = Random();

  String mIcon = Res.mic;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Apptheme.background,
      appBar: AppBar(
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,),) ,
        elevation: 0,
        title: Text("Chat",style: TextStyle(fontSize: 20,color: Colors.black),),centerTitle: true,backgroundColor: Color(0xffF3F3F6),),

      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10.0);
              },
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                Message m = messages[index];
                if (m.user == 0) return _buildMessageRow(m, current: true);
                return _buildMessageRow(m, current: false);
              },
            ),
          ),
          _buildBottomBar(context),
        ],
      ),
    );
  }

  Container _buildBottomBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.send,
              controller: _controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  border: InputBorder.none,
                  hintText: "Type your message…"),
              onEditingComplete: _save,
            ),
          ),
          GestureDetector(


            onTapDown: (val){
              setState(() {
                mIcon = Res.mic_pressed;

              });
            },
            onTapUp: (val){
              setState(() {
                mIcon = Res.mic;
              });
            },
            child: Container(
              width: 60,
              height: 60,
              child: SvgPicture.asset(mIcon),
            ),
          ),

          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            onPressed: _save,
          )
        ],
      ),
    );
  }

  _save() async {
    if (_controller.text.isEmpty) return;
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      messages.insert(0, Message(rand.nextInt(2), _controller.text));
      _controller.clear();
    });
  }

  Row _buildMessageRow(Message message, {bool current}) {
    return Row(
      mainAxisAlignment:
      current ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
      current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: current ? 30.0 : 20.0),


        ///Chat bubbles
        Container(
          padding: EdgeInsets.only(
            bottom: 5,
            right: 5,
          ),
          child: Column(
            crossAxisAlignment:
            current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  minHeight: 40,
                  maxHeight: 250,
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                  minWidth: MediaQuery.of(context).size.width * 0.1,
                ),
                decoration: BoxDecoration(
                  color: current ? Apptheme.primary : Colors.white,
                  borderRadius: current
                      ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                      : BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 5, right: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: current
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          message.description,
                          style: TextStyle(
                            color: current ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.done_all,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "2:02",
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),

      ],
    );
  }
}

class Message {
  final int user;
  final String description;

  Message(this.user, this.description);
}