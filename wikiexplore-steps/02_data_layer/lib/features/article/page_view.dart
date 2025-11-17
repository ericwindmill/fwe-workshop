import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:wikiexplore_provider/features/article/view_model.dart';
import 'package:wikiexplore_provider/ui/shared_widgets/article_view.dart';

class RandomArticlePageView extends StatelessWidget {
  const RandomArticlePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RandomArticleViewModel>(
        builder: (context, viewModel, child) {
          final article = viewModel.article;
          if (article == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ArticleView(summary: article)
              .animate(key: ValueKey(article.titles.canonical))
              .fade(duration: 300.ms)
              .slideX(begin: 0.1, end: 0, curve: Curves.easeOutQuad);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<RandomArticleViewModel>().loadRandomArticle,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
