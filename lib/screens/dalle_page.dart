import 'package:flutter/material.dart';

class DallePage extends StatefulWidget {
  const DallePage({super.key});

  @override
  State<DallePage> createState() => _DallePageState();
}

class _DallePageState extends State<DallePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DallE chatBot'),
      ),
    );
  }
}
