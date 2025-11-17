/*
 * // Copyright 2025 The Dart and Flutter teams. All rights reserved.
 * // Use of this source code is governed by a BSD-style license that can be
 * // found in the LICENSE file.
 */

import 'package:wikiexplore/data/wikipedia.dart' as wikipedia;

import '../../util/simple_cache.dart';

class TimelineRepository extends SimpleCache {
  wikipedia.OnThisDayTimeline? _cachedTimeline;

  Future<wikipedia.OnThisDayTimeline> getTimelineForDate(
    int month,
    int day,
  ) async {
    if (_cachedTimeline != null && !shouldClearCache) return _cachedTimeline!;

    try {
      _cachedTimeline = await wikipedia.getTimelineForDate(
        month: month,
        day: day,
      );
      prevCacheTime = DateTime.now();
      return _cachedTimeline!;
    } catch (error) {
      throw Exception(
        '[TimelineRepository.getTimelineForDate] '
        'Failed to fetch timeline: $error',
      );
    }
  }
}
