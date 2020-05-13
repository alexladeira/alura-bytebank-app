import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _accountController,
              label: 'Número da conta',
              hint: '0000',
            ),
            Editor(
              controller: _valueController,
              label: 'Valor',
              hint: '0.00',
              iconData: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _createTransfer(context),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int account = int.tryParse(_accountController.text);
    final double value = double.tryParse(_valueController.text);
    if (account != null && value != null) {
      final transfer = Transfer(value, account);
      Navigator.pop(context, transfer);
//      Scaffold.of(context).showSnackBar(SnackBar(
//        content: Text('$transfer'),
//      ));
    }
  }
}
