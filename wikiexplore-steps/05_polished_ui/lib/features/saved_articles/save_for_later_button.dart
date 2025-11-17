import 'package:flutter/material.dart';
// TODO: Import flutter_animate.
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:wikiexplore_provider/data/wikipedia.dart';
import 'package:wikiexplore_provider/features/saved_articles/view_model.dart';

class SaveForLaterButton extends StatelessWidget {
  /// An [IconButton] that, when tapped, adds articles to a
  /// 'save for later' list.
  /// It has it's own ViewModel, and can be dropped in anywhere in the app
  const SaveForLaterButton({
    required this.summary,
    this.label,
    super.key,
  });

  final Summary summary;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SavedArticlesViewModel>();
    final isSaved = viewModel.articleIsSaved(summary);

    Widget icon = Icon(isSaved ? Icons.bookmark : Icons.bookmark_border);

    // TODO: Add scale and tint animations to the icon when saved.
    // if (isSaved) {
    //   icon = icon
    //       .animate()
    //       .scale(duration: 400.ms, curve: Curves.easeOutBack, begin: Offset(0.3, 0.3))
    //       .tint(color: Theme.of(context).primaryColor, duration: 400.ms);
    // }

    if (label != null) {
      return TextButton.icon(
        onPressed: () {
          if (isSaved) {
            viewModel.removeArticle(summary);
          } else {
            viewModel.saveArticle(summary);
          }
        },
        icon: icon,
        label: label!,
      );
    }
    return IconButton(
      onPressed: () {
        if (isSaved) {
          viewModel.removeArticle(summary);
        } else {
          viewModel.saveArticle(summary);
        }
      },
      icon: icon,
    );
  }
}
