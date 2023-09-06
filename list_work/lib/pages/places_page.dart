import 'package:flutter/material.dart';
import 'package:list_work/data/store.dart';
import 'package:list_work/model/article.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({super.key});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  @override
  Widget build(BuildContext context) {
    final articles = generateArticles();
    return Column(
      children: [
        const SizedBox(height: 32),
        Expanded(
          child: GridView.builder(
            itemCount: articles.length,
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio:
                    (MediaQuery.of(context).size.width * 0.5 - 24) / 100),
            itemBuilder: (_, i) {
              final article = articles[i];
              return _card(article);
            },
          ),
        ),
      ],
    );
  }

  Widget _card(Article article) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: article.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            article.icon,
            color: Colors.blueGrey.withOpacity(0.2),
            size: 90,
          ),
        ),
        Align(
          alignment: const Alignment(-1, 0.55),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Text(
                article.title.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  color: _getFontColorForBackground(article.backgroundColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getFontColorForBackground(Color background) {
    return background.computeLuminance() > 0.179 ? Colors.black : Colors.white;
  }
}
