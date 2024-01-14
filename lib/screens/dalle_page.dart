import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DallePage extends StatefulWidget {
  const DallePage({Key? key}) : super(key: key);

  @override
  State<DallePage> createState() => _DallePageState();
}

class _DallePageState extends State<DallePage> {
  var apiKey1 = "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";
  TextEditingController controller = TextEditingController();
  var imageUrl = '';
  bool isLoading = false;

  void generateImage(prompt) async {
    setState(() {
      isLoading = true; // Start loading
    });
    final apiKey = apiKey1; // Replace with your actual API key
    final uri = Uri.parse('https://api.openai.com/v1/images/generations');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    };
    final body = jsonEncode({
      'model': 'dall-e-3',
      'prompt': '$prompt',
      'size': '1024x1024',
      'quality': 'standard',
      'n': 1,
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final image_url = responseData['data'][0]['url'];
        print('Image URL: $image_url');

        setState(() {
          imageUrl = image_url;
          isLoading = false;
        });
      } else {
        print('Failed to generate image: ${response.body}');
        setState(() {
          isLoading = false; // Stop loading even if there's an error
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false; // Stop loading on exception
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DALL-E chatBot'),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child:Text(
                    "Create With AI !",
                    style: TextStyle(
                      color: Colors.black, // Change text color to black
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controller,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black), // Change text color to black
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Set input background color
                    hintText: "Enter description of the image",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      if (!isLoading) {
                        generateImage(controller.text);
                      }
                    },
                    child: Text(
                      isLoading ? "Generating..." : "Generate Image",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
            Positioned(
              bottom: 20,
              child: isLoading
                  ? CircularProgressIndicator()
                  : imageUrl != ''
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
