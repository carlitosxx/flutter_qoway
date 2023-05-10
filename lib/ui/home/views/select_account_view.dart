import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/skeleton/list_tile_a.skeleton.dart';
import 'package:qoway/ui/home/bloc/bloc/accounts_bloc.dart';

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
                // print(state);
                return state.maybeWhen(
                    orElse: () =>
                        const SliverToBoxAdapter(child: Text('Error')),
                    loading: () => SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return const ListTileSkeleton();
                            },
                            childCount: 15,
                          ),
                        ),
                    loaded: (listAccounts) => SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => ListTile(
                              title: Text(listAccounts[index].descripcion),
                              subtitle: Text(
                                listAccounts[index].estaIncluido.toString(),
                              ),
                            ),
                            childCount: listAccounts.length,
                          ),
                        ));
              },
            )
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           GestureDetector(
            //             onTap: () {
            //               // tipoTransaccion=1;
            //               // setState((){});
            //             },
            //             child: Container(
            //               height: 40,
            //               width: 100,
            //               decoration: BoxDecoration(
            //                   // color: (tipoTransaccion==0)?Theme.of(context).scaffoldBackgroundColor:Colors.black26,
            //                   borderRadius: BorderRadius.circular(20)),
            //               child: const Center(
            //                 child: Text(
            //                   'INGRESO',
            //                   // style: TextStyle(color: (tipoTransaccion==0)?Colors.grey:Colors.white),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               //  tipoTransaccion=0;
            //               // setState((){});
            //             },
            //             child: Container(
            //               height: 40,
            //               width: 100,
            //               decoration: BoxDecoration(
            //                   // color: (tipoTransaccion == 0)
            //                   //     ? Colors.black26
            //                   //     : Theme.of(context).scaffoldBackgroundColor,
            //                   borderRadius: BorderRadius.circular(20)),
            //               child: const Center(
            //                   child: Text(
            //                 'EGRESO',
            //                 // style: TextStyle(
            //                 //   color: (tipoTransaccion == 0)
            //                 //       ? Colors.white
            //                 //       : Colors.grey,
            //                 // ),
            //               )),
            //             ),
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
