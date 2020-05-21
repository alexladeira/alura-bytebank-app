import 'package:bytebank/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return the value when we create an transaction', (){
    final Transaction transaction = Transaction(null, 200, null);
    expect(transaction.value, 200);
  });
  
  test('should fail if value less then zero', (){
    expect(() => Transaction(null, 0, null), throwsAssertionError);
  });
}