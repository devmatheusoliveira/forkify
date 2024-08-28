import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forkify_app/app/shared/widgets/search_bar/search_bar_controller.dart';

class SearchBarWidget extends StatelessWidget {
  final SearchBarController controller;
  final Function(String value) onSubmitted;
  const SearchBarWidget(
      {super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: controller.isSearching ? 60 : 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
            child: controller.isSearching
                ? SearchBar(
                    autoFocus: true,
                    hintText: "Pesquisar...",
                    leading: const Icon(CupertinoIcons.search),
                    onSubmitted: (value) async {
                      (onSubmitted).call(value);
                      controller.setSearchState(false);
                    },
                  )
                : Container(),
          ),
        );
      },
    );
  }
}
