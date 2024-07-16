import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hawir/models/message.dart';
import 'package:hawir/theme/colors.dart';
import 'package:hawir/utils/const.dart';
import 'package:intl/intl.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key, required this.ref});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
  final WidgetRef ref;
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final model = GenerativeModel(model: "gemini-pro", apiKey: apiKey);
  final List<Message> messages = [
    Message(
      message: 'Hi, how can I help you?',
      isPrompt: false,
      time: DateTime.now(),
    ),
  ];
  final bool isPrompt = true;

  final ScrollController _scrollController = ScrollController();

  Future<void> sendMessage(String message) async {
    textEditingController.clear();

    setState(
      () {
        messages.add(
          Message(
            message: message,
            isPrompt: true,
            time: DateTime.now(),
          ),
        );
      },
    );

    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    setState(() {
      messages.add(Message(
        message: response.text ?? "",
        isPrompt: false,
        time: DateTime.now(),
      ));
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    @override
    void initState() async {
      super.initState();
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }

    @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Chat')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];

              return userPrompt(message.isPrompt, message);
            },
          )),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: TextField(
                    controller: textEditingController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter here',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () async {
                    await sendMessage(textEditingController.text);
                    _scrollController
                        .jumpTo(_scrollController.position.maxScrollExtent);
                  },
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container userPrompt(
    bool isPrompt,
    Message message,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(
        right: isPrompt ? 10 : 60,
        left: isPrompt ? 60 : 10,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          color: !isPrompt
              ? AppColors.primaryColor
              : AppColors.secondaryVariantColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: Radius.circular(isPrompt ? 20 : 0),
            bottomRight: Radius.circular(isPrompt ? 0 : 20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.message,
            style: TextStyle(
              fontWeight: isPrompt ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
              color: isPrompt ? AppColors.primaryColor : Colors.white,
            ),
          ),
          Text(
            DateFormat('hh:mm a').format(message.time),
            style: TextStyle(
              fontSize: 14,
              color: !isPrompt ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
