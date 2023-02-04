import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // const NewTransaction({Key key}) : super(key: key);
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;


  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
  
    final enteredTitle = _titleController.text;
    final entertedAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || entertedAmount <= 0 || _selectedDate == null) {
      return;
    } 
    widget.addTx(
      enteredTitle, entertedAmount, _selectedDate
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount'
              ),
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null ? 'No Date Chosen' : 'Picked Date: ' +DateFormat.yMd().format(_selectedDate)),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      // f
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.labelLarge.color,
              ),
              onPressed: _submitData
            ),
          ],
        ),
      ),
    );
  }
}