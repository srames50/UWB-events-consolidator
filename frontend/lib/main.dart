import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Replace with your Spring Boot backend URL
  final ApiService apiService = ApiService('http://localhost:8080');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spring Boot Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(apiService: apiService),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final ApiService apiService;

  MyHomePage({required this.apiService});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<String> data;

  @override
  void initState() {
    super.initState();
    data = widget.apiService.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Call Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<String>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Name: ${snapshot.data}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
