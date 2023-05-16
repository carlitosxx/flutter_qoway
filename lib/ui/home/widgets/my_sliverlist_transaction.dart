import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:qoway/ui/common/utils/short_date.dart';

class MySliverListTransactions extends StatelessWidget {
  const MySliverListTransactions({
    super.key,
    required this.cuenta,
  });
  final Cuentas cuenta;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
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
                  child: RichText(
                    text: TextSpan(
                      text: 'PEN ', //! OJO CAMBIAR AL SIMBOLO
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      children: [
                        TextSpan(
                          text: '${cuenta.movimientos[index].monto}',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
          // Text(cuenta.movimientos[index].comentario);
        },
        childCount: cuenta.movimientos.length,
      ),
    );
  }
}
