import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  String title = '';
  String value = '';

  TransactionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => {title = value},
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              onChanged: (value) => {value = value},
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('Nova transação'),
                  onPressed: () {
                    print(title);
                    print(value);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
