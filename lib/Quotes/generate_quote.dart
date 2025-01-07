import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/Quotes/state_quotes.dart';

class GenerateQuote extends StatelessWidget {
  const GenerateQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<QuotesProvider>().generateQuote(); 
              },
              child: Icon(Icons.refresh),
            ),
            SizedBox(height: 20), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    context.watch<QuotesProvider>().quote,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    context.watch<QuotesProvider>().author,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic,color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
