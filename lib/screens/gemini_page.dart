import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../api/gemini_api.dart';

class GeminiPage extends StatefulWidget {
  const GeminiPage({super.key});

  @override
  State<GeminiPage> createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    RxString result = ''.obs;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Gemini chatBot'),
          ),
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: textController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      result.value =
                      await GeminiAPI.getGeminiData(textController.text);
                    },
                    child: const Text(
                      'generate',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => Text(
                    result.value,
                    style: const TextStyle(color: Colors.black),
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
