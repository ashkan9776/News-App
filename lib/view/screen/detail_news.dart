import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailNews extends StatelessWidget {
  var news;
  var newsURL;

  DetailNews({super.key, required this.news, this.newsURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text(
          "News",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 220,
                width: 400,
                margin: const EdgeInsets.only(bottom: 15),
                child: Image.network(news.image, fit: BoxFit.cover),
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      news.publisher,
                      style: const TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      news.text,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          wordSpacing: 1, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 55),
                    Text('Author: ${news.author}'),
                    const SizedBox(height: 15),
                    Text('Data: ${news.date}'),
                    const SizedBox(height: 15),
                    const SizedBox(height: 10),
                    const Text('Full News at: '),
                    const SizedBox(height: 5),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(Uri.parse(newsURL))) {
                          await launchUrl(
                            Uri.parse(newsURL),
                          );
                        }
                      },
                      child: Text(news.url,
                          style: const TextStyle(color: Colors.blue)),
                    ),
                    const SizedBox(height: 50)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
