import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Content extends HookConsumerWidget {
  const Content({super.key, required ValueNotifier<int> index})
      : selectedIndex = index;

  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IndexedStack(
      index: selectedIndex.value,
      children: [],
    );
  }
}
