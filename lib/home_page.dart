import 'package:flutter/material.dart';
import 'package:lab23_emsi_zekraoui/pallete.dart';
import 'package:lab23_emsi_zekraoui/screens/dalle_page.dart';
import 'package:lab23_emsi_zekraoui/screens/ferret_page.dart';
import 'package:lab23_emsi_zekraoui/screens/gemini_page.dart';
import 'package:lab23_emsi_zekraoui/screens/gpt_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ossama Zekraoui chatBot'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
          children: [
            ClipOval(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/image_ossama.jfif',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Zekraoui\'s chatBot',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ],
        )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/image_ossama.jfif'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '@ossamazekraoui',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text('Chat GPT'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GptPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text('DallE'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DallePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text('Gemini'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GeminiPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text('Ferret'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FerretPage()));
              },
            ),
            // Ajoutez d'autres éléments de la liste au besoin.
          ],
        ),
      ),
    );
  }
}
