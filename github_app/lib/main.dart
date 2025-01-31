import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 70, 56, 217)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Links app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    late WebViewController _controller;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          spacing: 15,
          children: <Widget>[
            SizedBox(height: 30),
            const Text(
              'Welcome to Maverick\'s github link app',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.loadUrl('https://github.com/maverickk6');
                  },
                  child: Text('Link to GitHub'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.loadUrl('https://telex.im/');
                  },
                  child: Text('Link to HNG hire page'),
                ),
              ],
            ),
            Expanded(
              child: WebView(
                initialUrl: 'https://telex.im/',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
