import 'package:flutter/material.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    super.key,
    required this.label,
    required this.onTap,
    this.flex = 1,
  });

  final String label;
  final VoidCallback onTap;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
