import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.message,
  });
  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BubbleSpecialTwo(
      tail: true,
      text: message,
      isSender: isCurrentUser ? true : false,
      color: isCurrentUser
          ? isDarkMode
              ? Colors.green.shade600
              : Colors.green.shade500
          : isDarkMode
              ? Colors.grey.shade800
              : Colors.grey.shade200,
      textStyle: TextStyle(
        color: isCurrentUser
            ? Colors.white
            : isDarkMode
                ? Colors.white
                : Colors.black,
      ),
    );
  }
}
