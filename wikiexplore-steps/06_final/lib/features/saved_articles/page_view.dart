import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikiexplore_provider/data/wikipedia.dart';
import 'package:wikiexplore_provider/features/saved_articles/view_model.dart';

import '../../ui/breakpoint.dart';
import '../../ui/build_context_util.dart';
import '../../ui/shared_widgets/article_page_view.dart';
import '../../ui/shared_widgets/article_view.dart';

class SavedArticlesView extends StatelessWidget {
  const SavedArticlesView({super.key});

  Future<void> _onTapArticle(Summary summary, BuildContext context) async {
    final viewModel = Provider.of<SavedArticlesViewModel>(
      context,
      listen: false,
    );
    if (context.breakpoint.width != BreakpointWidth.large) {
      await Navigator.of(context).push(
        context.adaptivePageRoute(
          title: summary.titles.normalized,
          builder: (BuildContext context) {
            return ArticlePageView(summary: summary);
          },
        ),
      );
    } else {
      viewModel.activeArticle = summary;
    }
  }

  Widget _listTile(BuildContext context, Summary summary, Widget? trailing) {
    final viewModel = Provider.of<SavedArticlesViewModel>(
      context,
      listen: false,
    );
    if (context.isCupertino) {
      return CupertinoListTile(
        backgroundColor: Colors.white,
        trailing: context.breakpoint.width != BreakpointWidth.small
            ? IconButton(
                icon: const Icon(CupertinoIcons.clear_circled),
                onPressed: () => viewModel.removeArticle(summary),
              )
            : null,
        title: Text(
          summary.titles.normalized,
          style: TextTheme.of(context).bodyMedium,
        ),
        subtitle: Text(
          summary.description ?? '',
          style: TextTheme.of(context).labelSmall,
        ),
        leading: trailing,
        onTap: () => _onTapArticle(summary, context),
      );
    } else {
      return ListTile(
        title: Text(summary.titles.normalized),
        subtitle: Text(summary.description ?? ''),
        trailing: trailing,
        onTap: () => _onTapArticle(summary, context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SavedArticlesViewModel>(
      builder: (context, viewModel, child) {
        final articles = viewModel.savedArticles;
        if (articles.isEmpty) {
          return const Center(child: Text('No saved articles'));
        }

        // TODO: When resized to a larger screen,
        // the list of articles becomes a red screen
        if (context.breakpoint.width == BreakpointWidth.large) {
          // On large screens, we show a split view: list on the left,
          // active article on the right.
          return Row(
            children: [
              Container(
                width: 300,
                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.black12)),
                ),
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles.values.elementAt(index);
                    return _listTile(context, article, null);
                  },
                ),
              ),
              Expanded(
                child: viewModel.activeArticle != null
                    ? ArticleView(summary: viewModel.activeArticle!)
                    : const Center(child: Text('Select an article')),
              ),
            ],
          );
        }

        // On smaller screens, we show a list of articles.
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles.values.elementAt(index);
            return _listTile(context, article, null);
          },
        );
      },
    );
  }
}
