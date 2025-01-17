// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

abstract interface class AmountException implements Exception {}

class NotANumberException implements AmountException {
  const NotANumberException();

  String get message => 'Zero amount can not be divided by zero!';
}

class InfiniteNumberException implements AmountException {
  const InfiniteNumberException();

  String get message => 'Amount must be finite!';
}

class NegativePrecisionException implements AmountException {
  const NegativePrecisionException();

  String get message => 'Precision must be greater than or equals to zero!';
}
