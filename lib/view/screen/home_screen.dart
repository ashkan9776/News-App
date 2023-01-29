import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/view/screen/detail_news.dart';
import 'package:news_app/view_model/news_repository.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final List<News> _news = <News>[];
  @override
  void initState() {
    getNews().then((value) {
      setState(() {
        _news.addAll(value!);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[200],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return ListItem(index);
          },
          itemCount: _news.length),
    );
  }

  ListItem(index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(_news[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    _news[index].title,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailNews(
                              news: _news[index], newsURL: _news[index].url);
                        },
                      ),
                    ),
                    iconSize: 16,
                    color: Colors.black26,
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Text(_news[index].publisher,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Divider(color: Colors.black26),
          )
        ],
      ),
    );
  }
}
