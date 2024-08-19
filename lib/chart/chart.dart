

import 'dart:developer';

import 'package:expense_app/chart/chart_bar.dart';
import 'package:expense_app/model/expense.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;

  List<ExpenseBucket> get puckets {
    return [
      ExpenseBucket.forCategory(Category.food, expenses),
      ExpenseBucket.forCategory(Category.travel, expenses),
      ExpenseBucket.forCategory(Category.work, expenses),
      ExpenseBucket.forCategory(Category.leisure, expenses),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (var element in puckets) {
      if (element.totalExpenses > maxTotalExpense) {
        maxTotalExpense = element.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    // to know if i in dark mode or light mode
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return LayoutBuilder(
      builder:(ctx,constranin){
        log(constranin.minWidth.toString());
        log(constranin.maxWidth.toString());
        log(constranin.minHeight.toString());
        log(constranin.maxHeight.toString());
        return  Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        width: double.infinity,
        height: constranin.maxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final ele in puckets)
                    ChartBar(
                      fill: ele.totalExpenses == 0
                          ? 0
                          : ele.totalExpenses / maxTotalExpense,
                    )
                ],
              ),
            ),
               constranin.minHeight<200?Container():
             const SizedBox(
              height: 12,
            ),
            constranin.minHeight<200?Container():
            Row(
              children: puckets
                  .map(
                    (e) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          categoryIcons[e.category],
                          color: isDarkMode
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
      } ,
    
    );
  }
}
