import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_news/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final Articles article;
  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage == null
                    ? 'https://cdn4.vectorstock.com/i/1000x1000/74/28/image-unavailable-icon-vector-30057428.jpg'
                    : article.urlToImage!,
                errorWidget: (context, string, _) {
                  return const Icon(Icons.error);
                },
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  article.title ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  article.description ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
