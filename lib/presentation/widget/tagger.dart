import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tagger2/domain/usecase/retrieve_all_tags_usecase.dart';
import 'package:tagger2/presentation/widget/content.dart';

class Tagger extends HookWidget {
  const Tagger({super.key});
  @override
  Widget build(BuildContext context) {
    final navigationIndex = useState(0);

    return Scaffold(
      body: Row(
        children: [
          _SideBar(index: navigationIndex),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Content(index: navigationIndex),
          ),
        ],
      ),
    );
  }
}

class _SideBar extends HookConsumerWidget {
  const _SideBar({required ValueNotifier<int> index}) : navigationIndex = index;

  final ValueNotifier<int> navigationIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(retriveAllTagsUseCaseProvider);

    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      selectedIndex: navigationIndex.value,
      onDestinationSelected: (index) => navigationIndex.value = index,
      destinations: [
        const NavigationRailDestination(
          icon: Icon(Icons.list),
          selectedIcon: Icon(Icons.list_outlined),
          label: Text(''),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.label_outline),
          selectedIcon: Icon(Icons.label),
          label: Text(''),
        ),
        ...tags.when(
          data: (data) => [
            for (var tag in data)
              NavigationRailDestination(
                icon: Icon(
                  Icons.label,
                  color: Color(tag.color),
                ),
                label: Text(tag.name),
              )
          ],
          error: (error, stackTrace) => [
            const NavigationRailDestination(
              icon: Icon(Icons.error),
              label: Text('Error'),
            ),
          ],
          loading: () => [
            const NavigationRailDestination(
              icon: Icon(Icons.hourglass_empty),
              label: Text('Loading'),
            ),
          ],
        ),
      ],
    );
  }
}
