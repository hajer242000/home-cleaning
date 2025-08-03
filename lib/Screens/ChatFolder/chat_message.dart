class ChatMessage {
  final bool isSender;
  final String text;
  final String time;       
  final String userName;
  final String? avatarUrl;  
  
  ChatMessage({
    required this.isSender,
    required this.text,
    required this.time,
    required this.userName,
    this.avatarUrl,
  });
}