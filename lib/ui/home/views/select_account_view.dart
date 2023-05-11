import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/skeleton/list_tile_a.skeleton.dart';
import 'package:qoway/ui/home/bloc/accounts/accounts_bloc.dart';

class SelectAccountView extends StatelessWidget {
  const SelectAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: false,
              automaticallyImplyLeading: false,
              actions: [
                // boton cerrar
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                )
              ],
              // Titulo
              title: Text(
                l10n.selectAccount,
              ),
              pinned: true,
            ),
            //Resto
            BlocBuilder<AccountsBloc, AccountsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SliverToBoxAdapter(child: Text('Error')),
                  loading: () => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return const ListTileSkeleton();
                      },
                      childCount: 15,
                    ),
                  ),
                  loaded: (listAccounts) => SliverList(
                    delegate: SliverChildListDelegate([
                      ListTile(
                        title: Text(l10n.total),
                        subtitle: Text(
                          l10n.subtitleOfListTileTotal,
                        ),
                        trailing: Text(listAccounts.total.toString()),
                      ),
                      ...listAccounts.data.map(
                        (e) => ListTile(
                          title: Text(e.descripcion),
                          subtitle: Text(
                            (e.estaIncluido == 1)
                                ? l10n.allowedSummation
                                : l10n.notAllowedSummation,
                          ),
                          trailing: Text(e.total.toString()),
                        ),
                      )
                    ]),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
