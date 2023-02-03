import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // const NewTransaction({Key key}) : super(key: key);
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final entertedAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || entertedAmount <= 0) {
      return;
    } 
    widget.addTx(
      enteredTitle, entertedAmount
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title'
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount'
              ),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            TextButton(
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
              ),
              onPressed: submitData
            ),
          ],
        ),
      ),
    );
  }
}