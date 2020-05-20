import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((e) => Transaction.fromJson(e)).toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = transaction.toJson();

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'password': '1000',
        },
        body: jsonEncode(transactionMap));

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
