import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/add_transaction/bloc/transaction/transaction_bloc.dart';
import 'package:qoway/ui/common/widgets/button.dart';
import 'package:qoway/ui/common/widgets/my_textfield.dart';
import 'package:qoway/ui/home/bloc/account/account_bloc.dart';
import 'package:qoway/ui/home/bloc/accounts/accounts_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTransactionPhoneView extends StatefulWidget {
  const AddTransactionPhoneView({super.key, required this.accountId});
  final String accountId;
  @override
  State<AddTransactionPhoneView> createState() =>
      _AddTransactionPhoneViewState();
}

int tipoTransaccion = 1;

class _AddTransactionPhoneViewState extends State<AddTransactionPhoneView> {
  final controllerComment = TextEditingController();
  final controllerAmount = TextEditingController();
  DateTime _selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  void dispose() {
    controllerComment.dispose();
    controllerAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currentLocale = Localizations.localeOf(context);
    final localeToString = currentLocale.toString();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(l10n.addTransaction),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              tipoTransaccion = 1;
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: (tipoTransaccion == 0)
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  l10n.income,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              tipoTransaccion = 0;
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: (tipoTransaccion == 0)
                                    ? Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.12)
                                    : Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  l10n.expenses,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: MyTextfield(
                          maxLength: 100,
                          hint: l10n.enterComment,
                          controller: controllerComment,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 7,
                        ),
                        child: MyTextfield(
                          hint: l10n.enterAmount,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatter: [
                            LengthLimitingTextInputFormatter(15),
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}'),
                            ),
                          ],
                          controller: controllerAmount,
                          prefixIcon: const Icon(Icons.payments),
                        ),
                      ),
                      TableCalendar<DateTime>(
                        locale: (localeToString == 'en') ? 'en_US' : 'es_ES',
                        focusedDay: _focusedDay,
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2100),
                        calendarFormat: _calendarFormat,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        // QUITAR EL BOTON WEEK Y CENTRAR EL MES Y AÑO
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                        ),
                        currentDay: DateTime.now(),
                        calendarStyle: CalendarStyle(
                          selectedTextStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                          selectedDecoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .scrim
                                .withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _selectedDay = DateTime(
                              selectedDay.year,
                              selectedDay.month,
                              selectedDay.day,
                            );
                            _focusedDay = focusedDay;
                          });
                        },
                        onFormatChanged: (format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ButtonWidget(
              onButtonClick: () {
                try {
                  final transaction = Movimiento(
                    tipoMovimiento: tipoTransaccion,
                    monto: (tipoTransaccion == 1)
                        ? double.parse(controllerAmount.text)
                        : double.parse(controllerAmount.text) * -1,
                    fecha: _selectedDay.millisecondsSinceEpoch,
                    comentario: controllerComment.text,
                    idCuenta: int.parse(widget.accountId),
                  );
                  final accountBloc = BlocProvider.of<AccountBloc>(context);
                  final accountsBloc = BlocProvider.of<AccountsBloc>(context);
                  context.read<TransactionBloc>().add(
                        TransactionEvent.clicked(
                          transaction,
                          accountBloc,
                          accountsBloc,
                        ),
                      );
                  Navigator.pop(context);
                } catch (e) {
                  final snackBar = SnackBar(
                    content: Text(l10n.completeFieldsEmpty),
                    action: SnackBarAction(
                      label: l10n.labelCloseSnackBar,
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              text: l10n.add,
            ),
          ),
        ),
      ),
    );
  }
}
