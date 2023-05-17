import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/ui/home/bloc/account/account_bloc.dart';
import 'package:qoway/ui/home/widgets/my_sliverlist_transaction.dart';

class IncomeExpensesView extends StatelessWidget {
  const IncomeExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        print('POR AQUI ESTOY: $state');
        return state.maybeWhen(
          orElse: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          setAccount: (cuenta) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Text(cuenta.movimientos[index].comentario);
              },
              childCount: cuenta.movimientos.length,
            ),
          ),
          setNewAccount: (cuenta) => MySliverListTransactions(cuenta: cuenta),
          reloadAccount: (cuenta) => MySliverListTransactions(cuenta: cuenta),
        );
      },
    );
  }
}
