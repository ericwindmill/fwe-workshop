import 'package:flutter/foundation.dart';
import 'package:wikiexplore/data/wikipedia.dart' as wikipedia;
import 'package:wikiexplore/features/article/repository.dart';

class RandomArticleViewModel extends ChangeNotifier {
  final ArticleRepository repository;
  wikipedia.Summary? _article;

  RandomArticleViewModel({required this.repository}) {
    loadRandomArticle();
  }

  wikipedia.Summary? get article => _article;

  Future<void> loadRandomArticle() async {
    try {
      _article = await repository.getRandomArticle();
      notifyListeners();
    } catch (e) {
      // Handle error appropriately, maybe set an error state
      debugPrint('Error fetching random article: $e');
    }
  }
}
