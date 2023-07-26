import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text('Hi, webneshin!!'),
                  Badge(
                    textStyle:TextStyle(fontSize: 8) ,
                    label: Text("1"),
                    backgroundColor: Colors.deepOrange,
                    child: Icon(Icons.notifications_outlined),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
