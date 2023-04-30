import 'package:flutter/material.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/skeleton/list_tile_a.skeleton.dart';

class CurrencyPhoneView extends StatelessWidget {
  const CurrencyPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text(l10n.sliverAppBarTitleCurrency),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const ListTileSkeleton();
                  },
                  childCount: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
