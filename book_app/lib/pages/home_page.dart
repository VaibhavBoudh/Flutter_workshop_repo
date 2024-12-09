import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://cdn.pixabay.com/photo/2021/09/20/03/24/skeleton-6639547_1280.png",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Gemini Chat"),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          hintText: "Type your message...",
        ),
        sendButtonBuilder: (Function() onSend) {
          return InkWell(
            onTap: onSend,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          );
        },
        trailing: [
          IconButton(
            onPressed: _sendMediaMessage,
            icon: const Icon(
              Icons.image,
              color: Colors.blueAccent,
            ),
            tooltip: "Choose Image",
          ),
        ],
      ),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini.streamGenerateContent(question, images: images).listen((event) {
        String cleanResponse = _cleanResponse(event.content?.parts);

        ChatMessage responseMessage = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: cleanResponse,
        );
        setState(() {
          messages = [responseMessage, ...messages];
        });
      }, onError: (error) {
        setState(() {
          messages = [
            ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: "An error occurred: $error",
            ),
            ...messages,
          ];
        });
      });
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  String _cleanResponse(List<dynamic>? parts) {
    if (parts == null) return "";

    return parts
        .map((part) {
          // if (part is TextPart) {
          //   return part.text.replaceAll(RegExp(r'\*|~|\[.*?\]'), '').trim();
          // }
          return part.text.replaceAll(RegExp(r'\*|~|\[.*?\]'), '').trim();
        })
        .join(" ")
        .trim();
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}
