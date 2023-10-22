import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_news/models/news_model.dart';
import 'package:riverpod_news/providers/news_provider.dart';
import 'package:riverpod_news/widgets/news_card.dart';
import 'package:riverpod_news/widgets/search_field.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    NewsModel newsModel = ref.watch(newsProvider).newsModel;
    bool isLoading = ref.watch(newsProvider).isLoading;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchField(),
            isLoading
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 16),
                      itemBuilder: (context, index) {
                        return NewsCard(
                          article: newsModel.articles![index],
                        );
                      },
                      itemCount: newsModel.articles?.length ?? 0,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
