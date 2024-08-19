import 'package:expense_app/chart/chart.dart';
import 'package:expense_app/model/expense.dart';
import 'package:expense_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        title: "Flutter course",
        amount: 28.9,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 9.8,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Go to beach",
        amount: 12.8,
        date: DateTime.now(),
        category: Category.travel),
  ];
  // function to add expense
  void _addExpense(Expense expanse) {
    setState(() {
      _registerExpenses.add(expanse);
    });
  }

  void _removeExpense(Expense expanse) {
    setState(() {
      _registerExpenses.remove(expanse);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Expenses App"),
          actions: [
            IconButton(
                onPressed: () {
               showModalBottomSheet(
                    useSafeArea: true,
                    isScrollControlled: true,
                      isDismissible: false,
                      context: context,
                      builder: (rcx) => NewExpense(
                            onAddExpanse: _addExpense,
                          ),
                          );
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Center(
          child: width < 600
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(child: Chart(expenses: _registerExpenses)),
                  Expanded(
                    child: ExpansesList(
                        onRemoveExpanse: _removeExpense,
                        expenses: _registerExpenses),
                  ),
                ])
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(child: Chart(expenses: _registerExpenses)),
                  Expanded(
                    child: ExpansesList(
                        onRemoveExpanse: _removeExpense,
                        expenses: _registerExpenses),
                  ),
                ]),
        ));
  }
}
