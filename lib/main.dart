import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic>? myDesignData;

  @override
  void initState() {
    super.initState();
    loadMyDesignData();
  }

  Future<void> loadMyDesignData() async {
    final String myDesignYamlString = await rootBundle.loadString('assets/my_design.yaml');
    setState(() {
      myDesignData = Map<String, dynamic>.from(loadYaml(myDesignYamlString)) as Map<String, dynamic>?; // YamlMap'i dönüştür
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(myDesignData?['app_name'] ?? 'Default App Name'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Merhaba, Kiyak Uygulaması!'),
              // Diğer tema verilerini kullanabilirsiniz
            ],
          ),
        ),
      ),
    );
  }
}

