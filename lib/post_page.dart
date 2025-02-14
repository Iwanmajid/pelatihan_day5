import 'package:flutter/material.dart';
import 'package:hari_5/provider.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Provider Lanjutan'),),
      body: Center(
        child: provider.loading 
        ? CircularProgressIndicator()
        : provider.error.isNotEmpty 
          ? Text('Error : ${provider.error}') 
        : ListView.builder(
          itemCount: provider.posts.length,
          itemBuilder: (context, index) {
            final post = provider.posts[index];
            return ListTile(
              title: Text(post['title']),
              subtitle: Text(post['body']),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: provider.fetchPosts, child: Icon(Icons.refresh),),
    );
  }
}