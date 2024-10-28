// Copyright (c) 2024, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdamount/mdamount.dart';
import 'package:test/test.dart';

void main() {
  group('exception messages >', () {
    test('NotANumberException', () {
      final actual = const NotANumberException().message;
      const expected = 'Zero amount can not be divided by zero!';
      expect(actual, expected);
    });
    test('InfiniteNumberException', () {
      final actual = const InfiniteNumberException().message;
      const expected = 'Amount must be finite!';
      expect(actual, expected);
    });
    test('NegativePrecisionException', () {
      final actual = const NegativePrecisionException().message;
      const expected = 'Precision must be greater than or equals to zero!';
      expect(actual, expected);
    });
  });
}
