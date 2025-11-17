/*
 * // Copyright 2025 The Dart and Flutter teams. All rights reserved.
 * // Use of this source code is governed by a BSD-style license that can be
 * // found in the LICENSE file.
 */

import 'package:flutter/material.dart';
// TODO: Import flutter_animate.
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:wikiexplore_provider/data/wikipedia.dart';

import '../../ui/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:wikiexplore_provider/features/on_this_day_timeline/view_model.dart';
import 'package:wikiexplore_provider/features/on_this_day_timeline/widgets/timeline_list_item.dart';

import '../../ui/build_context_util.dart';
import '../../ui/shared_widgets/article_view.dart';

const double sidebarWidth = 60;
const double mainColumnWidthPercentage = .85;

class TimelinePageView extends StatelessWidget {
  const TimelinePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimelineViewModel>(
      builder: (context, viewModel, child) {
        final events = viewModel.filteredEvents;
        if (events.isEmpty && !viewModel.hasError) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewModel.error!, style: TextTheme.of(context).labelSmall),
              SizedBox(height: 10),
            ],
          );
        }
        if (!viewModel.hasData && !viewModel.hasError) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        final mainContent = ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: context.breakpoint.padding),
          itemCount: viewModel.filteredEvents.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.all(context.breakpoint.margin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.readableDate,
                      style: TextTheme.of(
                        context,
                      ).titleMedium?.copyWith(fontSize: 24),
                    ),
                    SizedBox(height: context.breakpoint.spacing),
                    Text(
                      '${viewModel.filteredEvents.length} historic events'
                          .toUpperCase(),
                      style: TextTheme.of(
                        context,
                      ).titleMedium?.copyWith(color: AppColors.labelOnLight),
                    ),
                    if (viewModel.readableYearRange != '')
                      Text(
                        'from ${viewModel.readableYearRange}',
                        style: TextTheme.of(
                          context,
                        ).titleMedium?.copyWith(color: AppColors.labelOnLight),
                      ),
                    SizedBox(height: context.breakpoint.spacing),
                  ],
                ),
              );
            }

            final OnThisDayEvent event = viewModel.filteredEvents[index - 1];
            // TODO: Add entrance animations to TimelineListItem.
            // 1. Use .animate().
            // 2. Add .fade(duration: 500.ms, delay: (50 * index).ms).
            // 3. Add .slideY(begin: .1, end: 0, curve: Curves.easeOutQuad).
            return TimelineListItem(
              event: event,
            );
          },
        );

        final right = viewModel.activeArticle != null
            ? ArticleView(summary: viewModel.activeArticle!)
            : const Center(child: Text('Select an article'));

        if (context.breakpoint.isLarge) {
          return Row(
            children: [
              Flexible(flex: 3, child: mainContent),
              Flexible(flex: 3, child: right),
            ],
          );
        }

        return mainContent;
      },
    );
  }
}
