import 'package:wikiexplore/data/wikipedia.dart' as wikipedia;
import 'package:wikiexplore/util/simple_cache.dart';

class ArticleRepository extends SimpleCache {
  wikipedia.Summary? _cachedArticle;

  Future<wikipedia.Summary> getRandomArticle({bool bustCache = false}) async {
    if (_cachedArticle != null && !shouldClearCache && !bustCache) {
      return _cachedArticle!;
    }

    _cachedArticle = await wikipedia.getRandomArticleSummary();
    return _cachedArticle!;
  }
}
