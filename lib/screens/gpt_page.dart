import 'package:flutter/material.dart';

class GptPage extends StatefulWidget {
  const GptPage({super.key});

  @override
  State<GptPage> createState() => _GptPageState();
}

class _GptPageState extends State<GptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPT chatBot'),
      ),
    );
  }
}
