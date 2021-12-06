import 'dart:developer';

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  final void Function(String, double, DateTime) onSubmit;

  TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    DateTime _selectedDate = DateTime.now();

    if (title.isEmpty || value <= 0) {
      return;
    } else {
      onSubmit(title, value, _selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              onSubmitted: (_) => _submitForm(),
              controller: _valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Nova transação'),
                  onPressed: () => {_submitForm()},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
