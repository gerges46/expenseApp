import 'package:expense_app/model/expense.dart';
import 'package:expense_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpansesList extends StatelessWidget {
  ExpansesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpanse,
  });
// list from model
  final List<Expense> expenses;
  final void Function(Expense expanse) onRemoveExpanse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.7),
              margin: Theme.of(context).cardTheme.margin,
            ),
            onDismissed: (direction) => onRemoveExpanse(expenses[index]),
            key: ValueKey(expenses[index]),
            child: ExpensesItem(expanse: expenses[index])));
  }
}
