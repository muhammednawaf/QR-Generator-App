import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();

  // ignore: non_constant_identifier_names
  String qr_data = '';

  @override
  Future<void> dispose() async {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(223, 36, 36, 108),
              foregroundColor: Colors.white,
              title: const Text('QR Code Generator'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          labelText: 'Generate QR Code',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            qr_data = _controller.text.toString();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(223, 36, 36, 108),
                          foregroundColor: Colors.white, 
                        ),
                        child: const Text('Generate')
                    ),
                    const SizedBox(height: 15,),
                    QrImageView(
                      data: qr_data,
                      version: QrVersions.auto,
                      size: 320,
                      gapless: false,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
