import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/Quotes/generate_quote.dart';
import 'package:quotes/Quotes/state_quotes.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=> QuotesProvider(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: GenerateQuote(),
    );
  }
}

