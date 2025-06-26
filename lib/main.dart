import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, // Force light mode
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green, // Old property
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white, // Body background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green, // Explicit AppBar color
          foregroundColor: Colors.white,  // Title text/icon color
        ),
      ),
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory App"),
        titleSpacing: 0 , // Center the title
        centerTitle: true,
      toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 100,
      backgroundColor: Colors.blue, // AppBar background color
        actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search)), // Search icon in AppBar


  ],
      ),



      // Set AppBar height
      body: Text("Hello",) , // Body content)

    );

  }
}
