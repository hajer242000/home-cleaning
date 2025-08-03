import 'package:flutter/material.dart';
import 'package:homecleaning/Screens/ChatFolder/chat_message.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage msg;
  const MessageBubble({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {

    final maxWidth = MediaQuery.of(context).size.width * .75;


    final bubble = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: msg.isSender ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: msg.isSender
              ? null
              : [
                
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  )
                ],
        ),
        child: Text(
          msg.text,
          style: TextStyle(
            color: msg.isSender ? Colors.white : Colors.black,
            height: 1.4,
          ),
        ),
      ),
    );

  
    final metaRow = Row(
      children: [
        if (msg.isSender)              
          Text(msg.time,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),

        if (msg.isSender) const Spacer(),

        if (!msg.isSender)          
          _buildAvatar(msg),
        if (!msg.isSender) const SizedBox(width: 4),
        if (!msg.isSender)
          Text(msg.userName,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),

        if (!msg.isSender) const Spacer(),

        if (!msg.isSender)            
          Text(msg.time,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),

        if (msg.isSender) const SizedBox(width: 4),
        if (msg.isSender)
          _buildAvatar(msg),         
        if (msg.isSender) const SizedBox(width: 4),
        if (msg.isSender)
          Text(msg.userName,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );

    return Column(
      crossAxisAlignment:
          msg.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
   
        Align(
          alignment:
              msg.isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: bubble,
        ),
        const SizedBox(height: 6),
        metaRow,
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildAvatar(ChatMessage msg) => CircleAvatar(
        radius:15,
        backgroundColor: Colors.grey.shade400,
        backgroundImage: msg.avatarUrl != null ? NetworkImage(msg.avatarUrl!) : null,
      );
}
