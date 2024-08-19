/* import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// this onject from pakage to make uniqe id
const uuid = Uuid();
// this onject from pakage to make date
final dataFormat = DateFormat().add_yMd();

enum Catogery { food, travel, leisure, work }

// to change catogery by icon
const catogeryIcons = {
  Catogery.food: Icons.lunch_dining,
  Catogery.travel: Icons.travel_explore_outlined,
  Catogery.leisure: Icons.car_rental_outlined,
  Catogery.work: Icons.work,
};

class Expanse {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catogery catogery;
  String get formttedDate {
    return dataFormat.format(date);
  }

  Expanse(
      {required this.title,
      required this.amount,
      required this.date,
      required this.catogery})
      : id = uuid.v4();
}

// to make chart
class ExpanseBuket {
  final Catogery catogery;
  final List<Expanse> expenses;

  ExpanseBuket(this.catogery, this.expenses);
  // specal constructor
  ExpanseBuket.forCatogery(this.catogery, List<Expanse> allExpanses)
      : expenses = allExpanses
            .where((element) => element.catogery == catogery)
            .toList();
  double get totalExpanses {
    double sum = 0;

    for (var expanse in expenses) {
      sum = sum + expanse.amount;
    }
    return sum;
  }
} */
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// This object is from the package to generate a unique ID.
const uuid = Uuid();

// This object is from the package to format dates.
final dateFormat = DateFormat().add_yMd();

enum Category { food, travel, leisure, work }

// To map each category to an icon.
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // Getter to format the date.
  String get formattedDate {
    return dateFormat.format(date);
  }

  // Constructor
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}

// To group expenses by category and calculate totals.
class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  // Constructor
  ExpenseBucket(this.category, this.expenses);

  // Special constructor to filter expenses by category.
  ExpenseBucket.forCategory(this.category, List<Expense> allExpenses)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  // Getter to calculate the total expenses.
  double get totalExpenses {
    return expenses.fold(0, (sum, expense) => sum + expense.amount);
  }
}

