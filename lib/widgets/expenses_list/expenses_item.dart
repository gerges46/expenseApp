import 'package:expense_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expanse});
  // this object from class
  final Expense expanse;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expanse.title,style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text("${expanse.amount.toStringAsFixed(2)}\$"),
                const Spacer(),
                Row(
                  children: [
             Icon(categoryIcons[expanse.category]),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(expanse.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
