import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  bool loading = false;
  List<dynamic> posts = [];
  String error = '';


  Future<void> fetchPosts() async{
    loading = true;
    error ='';
    notifyListeners();

    try {
      final respon = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (respon.statusCode == 200) {
        posts = json.decode(respon.body);
      }else{
        error = 'Gagal memuat data';
      }
    } catch (e) {
      print(e);
    }

    loading = false;
    notifyListeners();
  }
}