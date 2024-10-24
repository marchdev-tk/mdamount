import 'package:meta/meta.dart';

@sealed
abstract class AmountException implements Exception {}

class NotANumberException implements AmountException {
  const NotANumberException();

  String get message => 'Zero money amount can not be divided by zero!';
}

class InfiniteNumberException implements AmountException {
  const InfiniteNumberException();

  String get message => 'Money amount must be finite!';
}

class NegativePrecisionException implements AmountException {
  const NegativePrecisionException();

  String get message => 'Precision must be greater than or equals to zero!';
}
