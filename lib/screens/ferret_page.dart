import 'package:flutter/material.dart';

class FerretPage extends StatefulWidget {
  const FerretPage({super.key});

  @override
  State<FerretPage> createState() => _FerretPageState();
}

class _FerretPageState extends State<FerretPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ferret chatBot'),
      ),
    );
  }
}
