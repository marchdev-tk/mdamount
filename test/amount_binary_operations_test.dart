// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdamount/mdamount.dart';
import 'package:test/test.dart';

import 'constants.dart';

void main() {
  group('addition >', () {
    test('0 + 0', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(0);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 + 0.1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(0.1);
      expect(actual, expected);
    });
    test('0 + 1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0 + 1.1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(1.1);
      expect(actual, expected);
    });
    test('1 + 0.1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(1.1);
      expect(actual, expected);
    });
    test('1 + 1.1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(2.1);
      expect(actual, expected);
    });
    test('1.1 + 0.1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(1.2);
      expect(actual, expected);
    });
    test('1.1 + 1.1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(2.2);
      expect(actual, expected);
    });
    test('0 + -0.1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(-0.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(-0.1);
      expect(actual, expected);
    });
    test('0 + -1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(-1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('0 + -1.1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(-1.1);
      expect(actual, expected);
    });
    test('1 + -0.1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(-0.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(0.9);
      expect(actual, expected);
    });
    test('1 + -1.1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(-0.1);
      expect(actual, expected);
    });
    test('1.1 + -0.1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(-0.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('1.1 + -1.1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-1.1 + -1.1', () {
      final amount1 = Amount.fromDouble(-1.1);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(-2.2);
      expect(actual, expected);
    });
    test('a1 + a2, precision 0', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 0);
      final amount2 = Amount.fromDouble(12.3456789, precision: 0);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(111, precision: 0);
      expect(actual, expected);
    });
    test('a1 + -a2, precision 0', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 0);
      final amount2 = Amount.fromDouble(-12.3456789, precision: 0);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(87, precision: 0);
      expect(actual, expected);
    });
    test('-a1 + -a2, precision 0', () {
      final amount1 = Amount.fromDouble(-98.7654321, precision: 0);
      final amount2 = Amount.fromDouble(-12.3456789, precision: 0);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(-111, precision: 0);
      expect(actual, expected);
    });
    test('a1 + a2, precision 4', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 4);
      final amount2 = Amount.fromDouble(12.3456789, precision: 4);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(111.1111, precision: 4);
      expect(actual, expected);
    });
    test('a1 + -a2, precision 4', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 4);
      final amount2 = Amount.fromDouble(-12.3456789, precision: 4);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(86.4197, precision: 4);
      expect(actual, expected);
    });
    test('-a1 + -a2, precision 4', () {
      final amount1 = Amount.fromDouble(-98.7654321, precision: 4);
      final amount2 = Amount.fromDouble(-12.3456789, precision: 4);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(-111.1111, precision: 4);
      expect(actual, expected);
    });
    test('a1(2) + a2(4), different precisions', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 2);
      final amount2 = Amount.fromDouble(12.3456789, precision: 4);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(111.12, precision: 2);
      expect(actual, expected);
    });
    test('a1(4) + a2(2), different precisions', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 4);
      final amount2 = Amount.fromDouble(12.3456789, precision: 2);
      final actual = amount1 + amount2;
      final expected = Amount.fromDouble(111.1154, precision: 4);
      expect(actual, expected);
    });
  });

  group('subtraction >', () {
    test('0 - 0', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 - 0.1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-0.1);
      expect(actual, expected);
    });
    test('0 - 1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('0 - 1.1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1.1);
      expect(actual, expected);
    });
    test('0.1 - 0', () {
      final amount1 = Amount.fromDouble(0.1);
      final amount2 = Amount.fromDouble(0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0.1);
      expect(actual, expected);
    });
    test('0.1 - 0.1', () {
      final amount1 = Amount.fromDouble(0.1);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0.1 - 1', () {
      final amount1 = Amount.fromDouble(0.1);
      final amount2 = Amount.fromDouble(1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-0.9);
      expect(actual, expected);
    });
    test('0.1 - 1.1', () {
      final amount1 = Amount.fromDouble(0.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('1 - 0', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('1 - 0.1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0.9);
      expect(actual, expected);
    });
    test('1 - 1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('1 - 1.1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-0.1);
      expect(actual, expected);
    });
    test('1.1 - 0', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1.1);
      expect(actual, expected);
    });
    test('1.1 - 0.1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('1.1 - 1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0.1);
      expect(actual, expected);
    });
    test('1.1 - 1.1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 - -0.1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(-0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0.1);
      expect(actual, expected);
    });
    test('0 - -1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(-1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0 - -1.1', () {
      final amount1 = Amount.fromDouble(0);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1.1);
      expect(actual, expected);
    });
    test('0.1 - -0.1', () {
      final amount1 = Amount.fromDouble(0.1);
      final amount2 = Amount.fromDouble(-0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0.2);
      expect(actual, expected);
    });
    test('0.1 - -1', () {
      final amount1 = Amount.fromDouble(0.1);
      final amount2 = Amount.fromDouble(-1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1.1);
      expect(actual, expected);
    });
    test('0.1 - -1.1', () {
      final amount1 = Amount.fromDouble(0.1);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1.2);
      expect(actual, expected);
    });
    test('1 - -0.1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(-0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1.1);
      expect(actual, expected);
    });
    test('1 - -1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(-1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(2);
      expect(actual, expected);
    });
    test('1 - -1.1', () {
      final amount1 = Amount.fromDouble(1);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(2.1);
      expect(actual, expected);
    });
    test('1.1 - -0.1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(-0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(1.2);
      expect(actual, expected);
    });
    test('1.1 - -1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(-1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(2.1);
      expect(actual, expected);
    });
    test('1.1 - -1.1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(2.2);
      expect(actual, expected);
    });
    test('-0.1 - 0', () {
      final amount1 = Amount.fromDouble(-0.1);
      final amount2 = Amount.fromDouble(0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-0.1);
      expect(actual, expected);
    });
    test('-0.1 - 0.1', () {
      final amount1 = Amount.fromDouble(-0.1);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-0.2);
      expect(actual, expected);
    });
    test('-0.1 - 1', () {
      final amount1 = Amount.fromDouble(-0.1);
      final amount2 = Amount.fromDouble(1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1.1);
      expect(actual, expected);
    });
    test('-0.1 - 1.1', () {
      final amount1 = Amount.fromDouble(-0.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1.2);
      expect(actual, expected);
    });
    test('-1 - 0', () {
      final amount1 = Amount.fromDouble(-1);
      final amount2 = Amount.fromDouble(0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-1 - 0.1', () {
      final amount1 = Amount.fromDouble(-1);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1.1);
      expect(actual, expected);
    });
    test('-1 - 1', () {
      final amount1 = Amount.fromDouble(-1);
      final amount2 = Amount.fromDouble(1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-2);
      expect(actual, expected);
    });
    test('-1 - 1.1', () {
      final amount1 = Amount.fromDouble(-1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-2.1);
      expect(actual, expected);
    });
    test('-1.1 - 0', () {
      final amount1 = Amount.fromDouble(-1.1);
      final amount2 = Amount.fromDouble(0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1.1);
      expect(actual, expected);
    });
    test('-1.1 - 0.1', () {
      final amount1 = Amount.fromDouble(-1.1);
      final amount2 = Amount.fromDouble(0.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-1.2);
      expect(actual, expected);
    });
    test('-1.1 - 1', () {
      final amount1 = Amount.fromDouble(-1.1);
      final amount2 = Amount.fromDouble(1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-2.1);
      expect(actual, expected);
    });
    test('-1.1 - 1.1', () {
      final amount1 = Amount.fromDouble(-1.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-2.2);
      expect(actual, expected);
    });
    test('-1.1 - -1.1', () {
      final amount1 = Amount.fromDouble(-1.1);
      final amount2 = Amount.fromDouble(-1.1);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('a1 - a2, precision 0', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 0);
      final amount2 = Amount.fromDouble(12.3456789, precision: 0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(87, precision: 0);
      expect(actual, expected);
    });
    test('a1 - -a2, precision 0', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 0);
      final amount2 = Amount.fromDouble(-12.3456789, precision: 0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(111, precision: 0);
      expect(actual, expected);
    });
    test('-a1 - -a2, precision 0', () {
      final amount1 = Amount.fromDouble(-98.7654321, precision: 0);
      final amount2 = Amount.fromDouble(-12.3456789, precision: 0);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-87, precision: 0);
      expect(actual, expected);
    });
    test('a1 - a2, precision 4', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 4);
      final amount2 = Amount.fromDouble(12.3456789, precision: 4);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(86.4197, precision: 4);
      expect(actual, expected);
    });
    test('a1 - -a2, precision 4', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 4);
      final amount2 = Amount.fromDouble(-12.3456789, precision: 4);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(111.1111, precision: 4);
      expect(actual, expected);
    });
    test('-a1 - -a2, precision 4', () {
      final amount1 = Amount.fromDouble(-98.7654321, precision: 4);
      final amount2 = Amount.fromDouble(-12.3456789, precision: 4);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(-86.4197, precision: 4);
      expect(actual, expected);
    });
    test('a1(2) - a2(4), different precisions', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 2);
      final amount2 = Amount.fromDouble(12.3456789, precision: 4);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(86.42, precision: 2);
      expect(actual, expected);
    });
    test('a1(4) - a2(2), different precisions', () {
      final amount1 = Amount.fromDouble(98.7654321, precision: 4);
      final amount2 = Amount.fromDouble(12.3456789, precision: 2);
      final actual = amount1 - amount2;
      final expected = Amount.fromDouble(86.4154, precision: 4);
      expect(actual, expected);
    });
  });

  group('multiplication >', () {
    test('0 * 0', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.zero;
      final actual = amount * coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 * 0.1', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(0.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 * 1', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.one;
      final actual = amount * coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 * 1.1', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(1.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('1 * 0.1', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(0.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(0.1);
      expect(actual, expected);
    });
    test('1 * 1.1', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(1.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(1.1);
      expect(actual, expected);
    });
    test('1.1 * 0.1', () {
      final amount = Amount.fromDouble(1.1);
      final coef = Amount.fromDouble(0.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(0.11);
      expect(actual, expected);
    });
    test('1.1 * 1.1', () {
      final amount = Amount.fromDouble(1.1);
      final coef = Amount.fromDouble(1.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(1.21);
      expect(actual, expected);
    });
    test('0 * -0.1', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 * -1', () {
      final amount = Amount.fromDouble(0);
      final coef = -Amount.one;
      final actual = amount * coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 * -1.1', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(-1.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('1 * -0.1', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(-0.1);
      expect(actual, expected);
    });
    test('1 * -1.1', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(-1.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(-1.1);
      expect(actual, expected);
    });
    test('1.1 * -0.1', () {
      final amount = Amount.fromDouble(1.1);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(-0.11);
      expect(actual, expected);
    });
    test('1.1 * -1.1', () {
      final amount = Amount.fromDouble(1.1);
      final coef = Amount.fromDouble(-1.1);
      final actual = amount * coef;
      final expected = Amount.fromDouble(-1.21);
      expect(actual, expected);
    });
    test('ceil rounding', () {
      final amount = Amount.fromDouble(123.45);
      final coef = Amount.fromDouble(1.24);
      final actual = amount * coef;
      final expected = Amount.fromDouble(153.078);
      expect(expected.toDouble(), 153.08);
      expect(actual, expected);
    });
    test('floor rounding', () {
      final amount = Amount.fromDouble(123.45);
      final coef = Amount.fromDouble(0.23);
      final actual = amount * coef;
      final expected = Amount.fromDouble(28.3935);
      expect(expected.toDouble(), 28.39);
      expect(actual, expected);
    });
    test('a(0) * 11', () {
      final amount = Amount.fromDouble(1.123456, precision: 0);
      final coef = Amount.fromDouble(11.0);
      final actual = amount * coef;
      final expected = Amount.fromDouble(11, precision: 0);
      expect(actual, expected);
    });
    test('a(4) * 1.1', () {
      final amount = Amount.fromDouble(1.123456, precision: 4);
      final coef = Amount.fromDouble(11.0);
      final actual = amount * coef;
      final expected = Amount.fromDouble(12.3585, precision: 4);
      expect(actual, expected);
    });
    test('a(0) * -1.1', () {
      final amount = Amount.fromDouble(1.123456, precision: 0);
      final coef = Amount.fromDouble(-11.0);
      final actual = amount * coef;
      final expected = Amount.fromDouble(-11, precision: 0);
      expect(actual, expected);
    });
    test('a(4) * -1.1', () {
      final amount = Amount.fromDouble(1.123456, precision: 4);
      final coef = Amount.fromDouble(-11.0);
      final actual = amount * coef;
      final expected = Amount.fromDouble(-12.3585, precision: 4);
      expect(actual, expected);
    });
  });

  group('division >', () {
    test('0 / 0 (NaN)', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.zero;
      Amount actual() => amount / coef;
      final expected = throwsA(const TypeMatcher<NotANumberException>());
      expect(actual, expected);
    });
    test('0 / 0.1', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(0.1);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 / 2', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 / 1.25', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(1.25);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0.1 / 0.1', () {
      final amount = Amount.fromDouble(0.1);
      final coef = Amount.fromDouble(0.1);
      final actual = amount / coef;
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0.1 / 2', () {
      final amount = Amount.fromDouble(0.1);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0.05);
      expect(actual, expected);
    });
    test('0.1 / 1.25', () {
      final amount = Amount.fromDouble(0.1);
      final coef = Amount.fromDouble(1.25);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0.08);
      expect(actual, expected);
    });
    test('1 / 0.1', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(0.1);
      final actual = amount / coef;
      final expected = Amount.fromDouble(10);
      expect(actual, expected);
    });
    test('1 / 2', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0.5);
      expect(actual, expected);
    });
    test('1 / 1.25', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(1.25);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0.8);
      expect(actual, expected);
    });
    test('1.25 / 0.1', () {
      final amount = Amount.fromDouble(1.25);
      final coef = Amount.fromDouble(0.1);
      final actual = amount / coef;
      final expected = Amount.fromDouble(12.5);
      expect(actual, expected);
    });
    test('1.1 / 2', () {
      final amount = Amount.fromDouble(1.1);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0.55);
      expect(actual, expected);
    });
    test('4.5 / 1.5', () {
      final amount = Amount.fromDouble(4.5);
      final coef = Amount.fromDouble(1.5);
      final actual = amount / coef;
      final expected = Amount.fromDouble(3);
      expect(actual, expected);
    });
    test('0 / -0.1', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 / -2', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(-2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0 / -1.25', () {
      final amount = Amount.fromDouble(0);
      final coef = Amount.fromDouble(-1.25);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0.1 / -0.1', () {
      final amount = Amount.fromDouble(0.1);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('0.1 / -2', () {
      final amount = Amount.fromDouble(0.1);
      final coef = Amount.fromDouble(-2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-0.05);
      expect(actual, expected);
    });
    test('0.1 / -1.25', () {
      final amount = Amount.fromDouble(0.1);
      final coef = Amount.fromDouble(-1.25);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-0.08);
      expect(actual, expected);
    });
    test('1 / -0.1', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-10);
      expect(actual, expected);
    });
    test('1 / -2', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(-2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-0.5);
      expect(actual, expected);
    });
    test('1 / -1.25', () {
      final amount = Amount.fromDouble(1);
      final coef = Amount.fromDouble(-1.25);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-0.8);
      expect(actual, expected);
    });
    test('1.25 / -0.1', () {
      final amount = Amount.fromDouble(1.25);
      final coef = Amount.fromDouble(-0.1);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-12.5);
      expect(actual, expected);
    });
    test('1.1 / -2', () {
      final amount = Amount.fromDouble(1.1);
      final coef = Amount.fromDouble(-2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-0.55);
      expect(actual, expected);
    });
    test('4.5 / -1.5', () {
      final amount = Amount.fromDouble(4.5);
      final coef = Amount.fromDouble(-1.5);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-3);
      expect(actual, expected);
    });
    test('ceil rounding', () {
      final amount = Amount.fromDouble(4.55);
      final coef = Amount.fromDouble(2.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(2.275);
      expect(expected.toDouble(), 2.28);
      expect(actual, expected);
    });
    test('floor rounding', () {
      final amount = Amount.fromDouble(1.45);
      final coef = Amount.fromDouble(3.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0.48333333333);
      expect(expected.toDouble(), 0.48);
      expect(actual, expected);
    });
    test('infinite', () {
      final amount = Amount.fromDouble(maxFinite);
      final coef = Amount.fromDouble(double.minPositive);
      Amount actual() => amount / coef;
      final expected = throwsA(const TypeMatcher<InfiniteNumberException>());
      expect(actual, expected);
    });
    test('a(0) / 11', () {
      final amount = Amount.fromDouble(1.123456, precision: 0);
      final coef = Amount.fromDouble(11.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0, precision: 0);
      expect(actual, expected);
    });
    test('a(4) / 11', () {
      final amount = Amount.fromDouble(1.123456, precision: 4);
      final coef = Amount.fromDouble(11.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0.1021, precision: 4);
      expect(actual, expected);
    });
    test('a(0) / -11', () {
      final amount = Amount.fromDouble(1.123456, precision: 0);
      final coef = Amount.fromDouble(-11.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(0, precision: 0);
      expect(actual, expected);
    });
    test('a(4) / -11', () {
      final amount = Amount.fromDouble(1.123456, precision: 4);
      final coef = Amount.fromDouble(-11.0);
      final actual = amount / coef;
      final expected = Amount.fromDouble(-0.1021, precision: 4);
      expect(actual, expected);
    });
  });

  group('less than (<) >', () {
    test('less', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(2.2);
      final actual = amount1 < amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('equal', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('greater', () {
      final amount1 = Amount.fromDouble(2.2);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });

    test('less, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(2.2345, precision: 4);
      final actual = amount1 < amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('equal, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('greater, precision 4', () {
      final amount1 = Amount.fromDouble(2.2345, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });

    test('a1(2) < a2(4), different precisions', () {
      final amount1 = Amount.fromDouble(1.12, precision: 2);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 < amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('a1(4) < a2(2), different precisions', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.12, precision: 2);
      final actual = amount1 < amount2;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('less than or equal (<=) >', () {
    test('less', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(2.2);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('equal', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('greater', () {
      final amount1 = Amount.fromDouble(2.2);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 <= amount2;
      const expected = false;
      expect(actual, expected);
    });

    test('less, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(2.2345, precision: 4);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('equal, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('greater, precision 4', () {
      final amount1 = Amount.fromDouble(2.2345, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 <= amount2;
      const expected = false;
      expect(actual, expected);
    });

    test('a1(2) < a2(4), different precisions', () {
      final amount1 = Amount.fromDouble(1.12, precision: 2);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 <= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('a1(4) < a2(2), different precisions', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.12, precision: 2);
      final actual = amount1 <= amount2;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('greater than (>) >', () {
    test('less', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(2.2);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('equal', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('greater', () {
      final amount1 = Amount.fromDouble(2.2);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 > amount2;
      const expected = true;
      expect(actual, expected);
    });

    test('less, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(2.2345, precision: 4);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('equal, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('greater, precision 4', () {
      final amount1 = Amount.fromDouble(2.2345, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 > amount2;
      const expected = true;
      expect(actual, expected);
    });

    test('a1(2) < a2(4), different precisions', () {
      final amount1 = Amount.fromDouble(1.12, precision: 2);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 > amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('a1(4) < a2(2), different precisions', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.12, precision: 2);
      final actual = amount1 > amount2;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('greater than or equal (>=) >', () {
    test('less', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(2.2);
      final actual = amount1 >= amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('equal', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('greater', () {
      final amount1 = Amount.fromDouble(2.2);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });

    test('less, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(2.2345, precision: 4);
      final actual = amount1 >= amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('equal, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });
    test('greater, precision 4', () {
      final amount1 = Amount.fromDouble(2.2345, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });

    test('a1(2) < a2(4), different precisions', () {
      final amount1 = Amount.fromDouble(1.12, precision: 2);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1 >= amount2;
      const expected = false;
      expect(actual, expected);
    });
    test('a1(4) < a2(2), different precisions', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.12, precision: 2);
      final actual = amount1 >= amount2;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('compareTo >', () {
    test('-1', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(2.2);
      final actual = amount1.compareTo(amount2);
      const expected = -1;
      expect(actual, expected);
    });
    test('0', () {
      final amount1 = Amount.fromDouble(1.1);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1.compareTo(amount2);
      const expected = 0;
      expect(actual, expected);
    });
    test('+1', () {
      final amount1 = Amount.fromDouble(2.2);
      final amount2 = Amount.fromDouble(1.1);
      final actual = amount1.compareTo(amount2);
      const expected = 1;
      expect(actual, expected);
    });

    test('-1, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(2.2345, precision: 4);
      final actual = amount1.compareTo(amount2);
      const expected = -1;
      expect(actual, expected);
    });
    test('0, precision 4', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1.compareTo(amount2);
      const expected = 0;
      expect(actual, expected);
    });
    test('+1, precision 4', () {
      final amount1 = Amount.fromDouble(2.2345, precision: 4);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1.compareTo(amount2);
      const expected = 1;
      expect(actual, expected);
    });

    test('a1(2) compareTo a2(4), different precisions', () {
      final amount1 = Amount.fromDouble(1.12, precision: 2);
      final amount2 = Amount.fromDouble(1.1234, precision: 4);
      final actual = amount1.compareTo(amount2);
      const expected = -1;
      expect(actual, expected);
    });
    test('a1(4) compareTo a2(2), different precisions', () {
      final amount1 = Amount.fromDouble(1.1234, precision: 4);
      final amount2 = Amount.fromDouble(1.12, precision: 2);
      final actual = amount1.compareTo(amount2);
      const expected = 1;
      expect(actual, expected);
    });
  });
}
