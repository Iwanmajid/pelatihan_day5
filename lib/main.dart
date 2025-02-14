import 'package:flutter/material.dart';
import 'package:hari_5/post_page.dart';
import 'package:hari_5/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>  PostProvider(),),
      ],
      child: MyApp(), 
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Lanjutan',
      home: HomeScreen(),
    );
  }
}

