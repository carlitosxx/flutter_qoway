import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/utils/short_date.dart';
import 'package:qoway/ui/home/bloc/user/user_bloc.dart';

class MySliverListTransactions extends StatelessWidget {
  const MySliverListTransactions({
    super.key,
    required this.cuenta,
  });
  final Cuentas cuenta;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onLongPress: () {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            l10n.description,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(cuenta.movimientos[index].comentario),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            l10n.amount,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(cuenta.movimientos[index].monto.toString()),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(l10n.cancel),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: LLAMAR EVENTO DE BORRAR EL ITEM DE LA LISTA
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.errorContainer,
                          ),
                        ),
                        child: Text(
                          l10n.delete,
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onErrorContainer,
                          ),
                        ),
                      )
                    ],
                    title: Center(child: Text(l10n.doYouWantToDelete)),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 10,
                bottom: 10,
              ),
              margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 70,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 20,
                          child: Column(
                            children: [
                              Text(
                                shortMonth(
                                  cuenta.movimientos[index].fecha,
                                  context,
                                ),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Text(
                                  dayOfMonth(
                                    cuenta.movimientos[index].fecha,
                                  ),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Flexible(
                          flex: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cuenta.movimientos[index].comentario,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                                overflow: TextOverflow.fade,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 30,
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => const SizedBox.shrink(),
                          loadUser: (user) => RichText(
                            text: TextSpan(
                              text:
                                  user.simboloDivisa, //! OJO CAMBIAR AL SIMBOLO
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                              children: [
                                TextSpan(
                                  text: '${cuenta.movimientos[index].monto}',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
          // Text(cuenta.movimientos[index].comentario);
        },
        childCount: cuenta.movimientos.length,
      ),
    );
  }
}
