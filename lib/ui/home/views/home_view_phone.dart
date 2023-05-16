import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/ui/home/bloc/account/account_bloc.dart';
import 'package:qoway/ui/home/views/expenses_view.dart';
import 'package:qoway/ui/home/views/income_expenses_view.dart';
import 'package:qoway/ui/home/widgets/my_appbar.dart';
import 'package:qoway/ui/home/widgets/my_drawer.dart';

class HomeViewPhone extends StatefulWidget {
  const HomeViewPhone({super.key, required this.userId});
  final String userId;

  @override
  State<HomeViewPhone> createState() => _HomeViewPhoneState();
}

class _HomeViewPhoneState extends State<HomeViewPhone> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screnIndex = 0;
  List<Widget> screens = [
    const IncomeExpensesView(),
    const ExpensesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: scaffoldKey,
            drawer: const MyDrawer(),
            body: CustomScrollView(
              slivers: [const MyAppBar(), screens[screnIndex]],
            ),
            floatingActionButton: BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  setNewAccount: (cuenta) => FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/addTransaction',
                        arguments: cuenta.id.toString(),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
