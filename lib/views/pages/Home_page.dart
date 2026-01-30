import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To Home Page"),
        centerTitle: true,
        backgroundColor: Colors.teal, 
        
      ),
      
      body: const Center(
        child: Text(
          "Home Page ",
          style: TextStyle(fontSize: 24),
        ),
      ),
      
    );
  }
}