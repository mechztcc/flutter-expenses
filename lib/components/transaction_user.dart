import 'dart:math';

import 'package:financeiro/components/transaction_form.dart';
import 'package:financeiro/components/transaction_list.dart';
import 'package:financeiro/models/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionUser extends StatefulWidget {
  TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1', title: 'Novo Tênis', value: 310.762, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de luz', value: 200.762, date: DateTime.now())
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TransactionForm(onSubmit: _addTransaction)
      ],
    );
  }
}
