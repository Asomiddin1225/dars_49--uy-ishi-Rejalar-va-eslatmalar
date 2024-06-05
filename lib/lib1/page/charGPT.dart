import 'package:dars_49/lib1/page/darsvideo.dart';
import 'package:dars_49/lib1/page/darsvieo.dart';
import 'package:flutter/material.dart';

class ChatGPTpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/GPT.png',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'ChatGPT bilan tanshuv',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Row(
                      children: [
                        Text(
                          'Tafsya: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sotib olish\nRo'yxatdan o'tish...  ",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Darsga oid Vidyolar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlutterVido()),
                );
              },
              child: const Text('vido 1'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlutterVido2()),
                );
              },
              child: const Text('vido 2'),
            ),
            const Spacer(),
            const Text(
              'Narxi: \$20',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
