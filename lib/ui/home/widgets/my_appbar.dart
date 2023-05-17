// import 'package:database/database.dart';
import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/skeleton/text_a.skelton.dart';
import 'package:qoway/ui/home/bloc/account/account_bloc.dart';
import 'package:qoway/ui/home/bloc/accounts/accounts_bloc.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    super.key,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: PersistentHeaderDelegate(
        maxExtend: const Size.fromHeight(kToolbarHeight).height * 2,
        minExtend: const Size.fromHeight(kToolbarHeight).height,
      ),
    );
  }
}

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  PersistentHeaderDelegate({
    required this.maxExtend,
    required this.minExtend,
  });

  final double maxExtend;
  final double minExtend;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final newValue = maxExtend - shrinkOffset;
    final delta = newValue / maxExtend;
    final teta = shrinkOffset / maxExtend;
    final ancho = MediaQuery.of(context).size.width;

    var b = 0.0;
    var c = 0.0;

    if (delta < 0.5) {
      b = 0;
      c = (teta - 0.5) / 0.5;
    } else {
      c = 0;
      b = (delta - 0.5) / 0.5;
    }
    var d = 0.0;
    d = (1 - teta) * 100 + (1 - teta) * 35 + teta * 50;
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(delta * 30),
            bottomLeft: Radius.circular(delta * 30),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: SizedBox(
                  width: ancho * 0.15,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: minExtend,
                            child: const Icon(Icons.menu),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Transform.translate(
                offset: Offset(((ancho / 2) - minExtend) * teta, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/selectAccount');
                  },
                  child: SizedBox(
                    height: minExtend,
                    child: const ComboBox(),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50 * delta,
              // (delta > 0.5) ? 50 * delta : 0,
              left: (delta > 0.5) ? -100 * teta : d,
              child: Opacity(
                opacity: (delta > 0.5) ? b : c,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                    height: minExtend,
                    child: Row(
                      mainAxisAlignment: (delta > 0.5)
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        BlocBuilder<AccountBloc, AccountState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const TextASkeleton(),
                              setAccount: (cuenta) => Text(
                                cuenta.total.toString(),
                                style: TextStyle(
                                  fontSize: (delta > 0.5) ? 35 : 18,
                                ),
                              ),
                              reloadAccount: (cuenta) => Text(
                                cuenta.total.toString(),
                                style: TextStyle(
                                  fontSize: (delta > 0.5) ? 35 : 18,
                                ),
                              ),
                              setNewAccount: (cuenta) => Text(
                                cuenta.total.toString(),
                                style: TextStyle(
                                  fontSize: (delta > 0.5) ? 35 : 18,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxExtend;

  @override
  double get minExtent => minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class ComboBox extends StatelessWidget {
  const ComboBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocListener<AccountsBloc, AccountsState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loaded: (cuenta) => context.read<AccountBloc>().add(
                    AccountEvent.started(
                      Cuentas(
                        id: 0,
                        descripcion: l10n.total,
                        movimientos: [],
                        estaIncluido: 0,
                        total: cuenta.total,
                      ),
                    ),
                  ),
            );
          },
          child: const SizedBox.shrink(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const TextASkeleton(),
                setAccount: (cuenta) => Text(cuenta.descripcion),
                setNewAccount: (cuenta) => Text(cuenta.descripcion),
                reloadAccount: (cuenta) => Text(cuenta.descripcion),
              );
            },
          ),
        ),
        const Icon(Icons.arrow_drop_down)
      ],
    );
  }
}
