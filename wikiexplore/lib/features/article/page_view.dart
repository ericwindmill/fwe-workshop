import 'package:flutter/material.dart';
import 'package:wikiexplore/features/article/view_model.dart';
import 'package:wikiexplore/ui/shared_widgets/article_view.dart';

class RandomArticlePageView extends StatelessWidget {
  const RandomArticlePageView({super.key, required this.viewModel});

  final RandomArticleViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          final article = viewModel.article;
          if (article == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ArticleView(summary: article);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.loadRandomArticle,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
