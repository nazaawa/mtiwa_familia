import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'componets/chat_bubble.dart';
import 'componets/my_text_field.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    super.key,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final controller = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(
      () {
        if (myFocusNode.hasFocus) {
          Future.delayed(
            const Duration(milliseconds: 500),
            () => scrollDown(),
          );
        }
      },
    );

    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
    );
  }

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      // Simulate sending a message
      controller.clear();
    }

    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Famille Andedi"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: MessageList(
              receiverID: "",
              controller: scrollController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hint: "Type a message....",
                    obsecure: false,
                    controller: controller,
                    focusNode: myFocusNode,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: IconButton(
                    onPressed: sendMessage,
                    icon: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageList extends StatelessWidget {
  const MessageList(
      {super.key, required this.receiverID, required this.controller});
  final String receiverID;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    // Simulate local data
    List<Map<String, dynamic>> messages = [
      {'senderId': 'user1', 'message': 'Hello!'},
      {'senderId': 'user2', 'message': 'Hi there!'},
      {'senderId': 'user1', 'message': 'How are you?'},
      {'senderId': 'user2', 'message': 'I am good, thanks!'},
    ];

    return ListView(
      controller: controller,
      children: messages.map((data) => _buildMessageItem(data)).toList(),
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> data) {
    bool isCurentUser = data['senderId'] == 'user1'; // Simulate current user

    return ChatBubble(
      isCurrentUser: isCurentUser,
      message: data["message"],
    );
  }
}
