import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'hellow flutter',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
