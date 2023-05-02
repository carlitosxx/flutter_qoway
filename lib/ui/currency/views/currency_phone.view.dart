import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/skeleton/list_tile_a.skeleton.dart';
import 'package:qoway/ui/currency/bloc/currency_bloc.dart';
import 'package:qoway/ui/register/bloc/currency/currency_set_bloc.dart';

class CurrencyPhoneView extends StatelessWidget {
  const CurrencyPhoneView({super.key});
  void setCurrency(
    BuildContext context,
    int id,
    String descCurrency,
    String descShortCurrency,
    String simbolCurrency,
    int sideCurrency,
  ) {
    context.read<CurrencySetBloc>().add(
          CurrencyLoadedEvent(
            id,
            descCurrency,
            descShortCurrency,
            simbolCurrency,
            sideCurrency,
          ),
        );
    Navigator.pop(context);
  }

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
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                  ),
                ),
                title: Text(l10n.sliverAppBarTitleCurrency),
              ),
              BlocBuilder<CurrencyBloc, CurrencyState>(
                builder: (context, state) {
                  if (state is CurrencyLoadingState) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return const ListTileSkeleton();
                        },
                        childCount: 15,
                      ),
                    );
                  }
                  if (state is CurrencyLoadedState) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ListTile(
                            onTap: () => setCurrency(
                              context,
                              state.currencies[index]['id'] as int,
                              state.currencies[index]['descDivisa'] as String,
                              state.currencies[index]['cortoDivisa'] as String,
                              state.currencies[index]['simboloDivisa']
                                  as String,
                              state.currencies[index]['ladoDivisa'] as int,
                            ),
                            title: Text(
                              state.currencies[index]['descDivisa'] as String,
                            ),
                            subtitle: Text(
                              state.currencies[index]['cortoDivisa'] as String,
                            ),
                            trailing: Text(
                              state.currencies[index]['simboloDivisa']
                                  as String,
                            ),
                          );
                        },
                        childCount: state.currencies.length,
                      ),
                    );
                  }
                  if (state is CurrencyErrorState) {
                    return const SliverToBoxAdapter(
                      child: Center(child: Text('message error')),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
