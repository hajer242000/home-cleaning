import 'package:flutter/material.dart';
import 'package:homecleaning/Screens/ChatFolder/chat_input_field.dart';
import 'package:homecleaning/Screens/ChatFolder/chat_message.dart';
import 'package:homecleaning/Screens/ChatFolder/message_bubble.dart';
import 'package:homecleaning/Theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final messages = [
    ChatMessage(
      isSender: false,
      text:
          easy.tr("loremIntro"),
      time: easy.tr("time0804pm"),
      userName: easy.tr('jennyWilson'),
    ),
    ChatMessage(
      isSender: true,
      text:
          easy.tr("loremIpsum"),
      time: easy.tr( "time0804pm"),
      userName: easy.tr(  "estherHoward"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 10),
           Text(
           easy.tr( "today"),
            style: TextStyle(letterSpacing: 4, fontWeight: FontWeight.w200),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: messages.length,
              itemBuilder: (context, i) => MessageBubble(msg: messages[i]),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      titleSpacing: 0,
      title: Row(
        children: [
          const SizedBox(width: 20),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               easy.tr(  "jennyWilson"),
                style: TextStyle(fontSize: 16, color: tertiaryColor),
              ),
              Text(
             easy.tr(  "online"),
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: IconButton(
            onPressed: () {},
            icon: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: tertiaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.more_vert),
            ),
          ),
        ),
      ],
    );
  }
}
