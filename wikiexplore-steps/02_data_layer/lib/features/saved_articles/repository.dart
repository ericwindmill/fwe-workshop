import 'dart:collection';

import 'package:flutter/foundation.dart' hide Summary;
import 'package:wikiexplore_provider/data/wikipedia.dart';

class SavedArticlesRepository {
  final Map<String, Summary> _items = {};

  final ValueNotifier<UnmodifiableMapView<String, Summary>> _savedArticles =
      ValueNotifier(UnmodifiableMapView({}));

  ValueListenable<UnmodifiableMapView<String, Summary>> get savedArticles =>
      _savedArticles;

  void saveArticle(Summary summary) {
    _items[summary.titles.canonical] = summary;
    _update();
  }

  void removeArticle(Summary summary) {
    _items.remove(summary.titles.canonical);
    _update();
  }

  void _update() {
    _savedArticles.value = UnmodifiableMapView(Map.of(_items));
  }
}
