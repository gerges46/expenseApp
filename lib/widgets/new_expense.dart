import 'dart:io';

import 'package:expense_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onAddExpanse});
  // to recive function to add expanse
  final void Function(Expense expanse) onAddExpanse;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // the first way to save user input
/* var _title='';
void _saveTitleInput(String inputValue){
setState(() {
  _title=inputValue;
  log(_title);
});
} */
//the way two to save user input make object from texteditingcontroller
  TextEditingController _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat().add_yMd();
  DateTime? _selectedDate;
  Category _selectedCatogery = Category.travel;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _showDialog() {
    Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
                  title: const Text("Invalid Input"),
                  content: const Text(
                      "PLease make sure valid title, date ,month,year"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text("Ok"),
                    )
                  ],
                ))
        : showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.white,
                  icon: const Icon(Icons.warning_rounded),
                  iconColor: Colors.red,
                  title: const Text("Invalid Input"),
                  content: const Text(
                      "PLease make sure valid title, date ,month,year"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text("Ok"),
                    )
                  ],
                ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0 * 2),
          child: Column(
            children: [
              TextField(
                // save user input
                /*       onChanged: _saveTitleInput, */
                // the way two of save user input
                controller: _titleController,
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text("title"),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                      decoration: const InputDecoration(
                        label: Text("amount"),
                        prefixText: "\$",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? "no select date"
                            : formatter.format(_selectedDate!)),
                        IconButton(
                            onPressed: () async {
                              final now = DateTime.now();
                              final firstDate =
                                  DateTime(now.year - 1, now.month, now.day);
                              final DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: now,
                                  firstDate: firstDate,
                                  lastDate: now);
                              // .then((value) => log(value.toString()));
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            },
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                      // to make drop down and chage to list of object
                      value: _selectedCatogery,
                      items: Category.values
                          .map((e) => DropdownMenuItem(
                              value: e, child: Text("${e.name}")))
                          .toList(),
                      onChanged: (newCat) {
                        setState(() {
                          if (newCat == null) {
                            return;
                          }
                          _selectedCatogery = newCat;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("cancel")),
                  ElevatedButton(
                    onPressed: () {
                      /*                   log(_titleController.text);
                      log(_amountController.text); */
                      // validation of user input ****************************
                      final double? enteredAmount =
                          double.tryParse(_amountController.text);
                      /*        final bool amountIsVailed =
                          enteredAmount == null 
                          || enteredAmount > 0; */

                      final bool amountIsVailed =
                          enteredAmount != null && enteredAmount > 0;

                      if (_titleController.text.trim().isEmpty ||
                          !amountIsVailed ||
                          _selectedDate == null) {
                        _showDialog();
                        // check if i use ios or android
                      } else {
                        widget.onAddExpanse(
                          Expense(
                              title: _titleController.text,
                              amount: enteredAmount,
                              date: _selectedDate!,
                              category: _selectedCatogery),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text("save"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
