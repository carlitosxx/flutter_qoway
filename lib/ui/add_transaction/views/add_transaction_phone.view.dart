import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/widgets/my_textfield.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTransactionPhoneView extends StatefulWidget {
  const AddTransactionPhoneView({super.key});

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
    Locale currentLocale = Localizations.localeOf(context);
    print(currentLocale);
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
                                        .primaryContainer,
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
                                        .primaryContainer
                                    : Theme.of(context).colorScheme.background,
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
                        // locale: currentLocale,
                        focusedDay: _focusedDay,
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2100),
                        calendarFormat: _calendarFormat,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        // QUITAR EL BOTON WEEK Y CENTRAR EL MES Y AÑO
                        headerStyle: const HeaderStyle(
                            titleCentered: true, formatButtonVisible: false),
                        currentDay: DateTime.now(),
                        calendarStyle: const CalendarStyle(
                            selectedDecoration: BoxDecoration(
                              color: Colors.black38,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Colors.white10,
                              shape: BoxShape.circle,
                            )),
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _selectedDay = DateTime(selectedDay.year,
                                selectedDay.month, selectedDay.day);
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
        ),
      ),
    );
  }
}
