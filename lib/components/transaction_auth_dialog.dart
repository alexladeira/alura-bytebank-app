import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  TransactionAuthDialog({@required this.onConfirm});

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        maxLength: 4,
        obscureText: true,
        style: TextStyle(
          fontSize: 64,
          letterSpacing: 24,
        ),
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        FlatButton(
            onPressed: () {
              widget.onConfirm(_controller.text);
              Navigator.pop(context);
            },
            child: Text('Confirm')),
      ],
    );
  }
}
