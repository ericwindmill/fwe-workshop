import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:wikiexplore_provider/data/wikipedia.dart';

import 'repository.dart';

class SavedArticlesViewModel extends ChangeNotifier {
  SavedArticlesViewModel({required SavedArticlesRepository repository})
    : _repository = repository {
    _repository.savedArticles.addListener(notifyListeners);
    if (_repository.savedArticles.value.isNotEmpty && _activeArticle == null) {
      _activeArticle = _repository.savedArticles.value.values.first;
    }
  }

  UnmodifiableMapView<String, Summary> get savedArticles =>
      _repository.savedArticles.value;

  final SavedArticlesRepository _repository;

  Summary? _activeArticle;

  Summary? get activeArticle => _activeArticle;

  set activeArticle(Summary? value) {
    _activeArticle = value;
    notifyListeners();
  }

  void saveArticle(Summary summary) {
    _repository.saveArticle(summary);
    notifyListeners();
  }

  void removeArticle(Summary summary) {
    _repository.removeArticle(summary);
    notifyListeners();
  }

  bool articleIsSaved(Summary summary) {
    return savedArticles.values.any(
      (s) => s.titles.canonical == summary.titles.canonical,
    );
  }
}
