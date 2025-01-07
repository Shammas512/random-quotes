import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuotesProvider extends ChangeNotifier {
  String _quote = "Please Generate a Quote";
  String _author = "";

  String get quote => _quote;
  String get author => _author;

  Future<void> generateQuote() async {
    final url = Uri.parse('https://dummyjson.com/quotes');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); 
        final quotesList = data['quotes'] as List;
      

    
        final randomQuote = quotesList[Random().nextInt(quotesList.length)];

        _quote = randomQuote['quote'];
        _author = randomQuote['author'];
      } else {
        _quote = "Failed to fetch a quote. Please try again!";
        _author = "";
      }
    } catch (e) {
      print("Error: $e");
      _quote = "An error occurred while fetching quotes.";
      _author = "";
    }
    notifyListeners();
  }
}
