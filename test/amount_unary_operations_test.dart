// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdamount/mdamount.dart';
import 'package:test/test.dart';

void main() {
  group('integer >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).integer;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).integer;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Amount.fromDouble(0.99).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Amount.fromDouble(-0.99).integer;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).integer;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).integer;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).integer;
      final expected = BigInt.from(123);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).integer;
      final expected = BigInt.from(123);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).integer;
      final expected = -BigInt.from(123);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).integer;
      final expected = -BigInt.from(123);
      expect(actual, expected);
    });
  });

  group('fractional >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).fractional;
      final expected = BigInt.from(50);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Amount.fromDouble(0.99).fractional;
      final expected = BigInt.from(99);
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).fractional;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).fractional;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Amount.fromDouble(-0.99).fractional;
      final expected = -BigInt.from(99);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).fractional;
      final expected = -BigInt.from(50);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).fractional;
      final expected = BigInt.from(4568);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).fractional;
      final expected = -BigInt.from(4568);
      expect(actual, expected);
    });
  });

  group('fractionalDecimal >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).fractionalDecimal;
      final expected = Decimal.parse('0.5');
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Amount.fromDouble(0.99).fractionalDecimal;
      final expected = Decimal.parse('0.99');
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).fractionalDecimal;
      final expected = Decimal.parse('0.01');
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).fractionalDecimal;
      final expected = Decimal.parse('-0.01');
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Amount.fromDouble(-0.99).fractionalDecimal;
      final expected = Decimal.parse('-0.99');
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).fractionalDecimal;
      final expected = Decimal.parse('-0.5');
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Amount.fromDouble(123.456789, precision: 0).fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Amount.fromDouble(123.456789, precision: 4).fractionalDecimal;
      final expected = Decimal.parse('0.4568');
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Amount.fromDouble(-123.456789, precision: 0).fractionalDecimal;
      final expected = Decimal.zero;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Amount.fromDouble(-123.456789, precision: 4).fractionalDecimal;
      final expected = -Decimal.parse('0.4568');
      expect(actual, expected);
    });
  });

  group('fractionalDouble >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).fractionalDouble;
      const expected = 0.5;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).fractionalDouble;
      const expected = 0.0;
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Amount.fromDouble(0.99).fractionalDouble;
      const expected = 0.99;
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).fractionalDouble;
      const expected = 0.01;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).fractionalDouble;
      const expected = 0;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).fractionalDouble;
      const expected = -0.01;
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Amount.fromDouble(-0.99).fractionalDouble;
      const expected = -0.99;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).fractionalDouble;
      const expected = 0.0;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).fractionalDouble;
      const expected = -0.5;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual =
          Amount.fromDouble(123.456789, precision: 0).fractionalDouble;
      const expected = 0.0;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual =
          Amount.fromDouble(123.456789, precision: 4).fractionalDouble;
      const expected = 0.4568;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual =
          Amount.fromDouble(-123.456789, precision: 0).fractionalDouble;
      const expected = 0.0;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual =
          Amount.fromDouble(-123.456789, precision: 4).fractionalDouble;
      const expected = -0.4568;
      expect(actual, expected);
    });
  });

  group('sign >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Amount.fromDouble(0.99).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).sign;
      const expected = 0;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Amount.fromDouble(-0.99).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).sign;
      const expected = 1;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).sign;
      const expected = -1;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).sign;
      const expected = -1;
      expect(actual, expected);
    });
  });

  group('isEven >', () {
    test('1.51', () {
      final actual = Amount.fromDouble(1.51).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('0.51', () {
      final actual = Amount.fromDouble(0.51).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('0.02', () {
      final actual = Amount.fromDouble(0.02).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('-0.02', () {
      final actual = Amount.fromDouble(-0.02).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('-0.51', () {
      final actual = Amount.fromDouble(-0.51).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('-1.51', () {
      final actual = Amount.fromDouble(-1.51).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).isEven;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).isEven;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).isEven;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('isOdd >', () {
    test('1.51', () {
      final actual = Amount.fromDouble(1.51).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('0.51', () {
      final actual = Amount.fromDouble(0.51).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('0.02', () {
      final actual = Amount.fromDouble(0.02).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('-0.02', () {
      final actual = Amount.fromDouble(-0.02).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('-0.51', () {
      final actual = Amount.fromDouble(-0.51).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('-1.51', () {
      final actual = Amount.fromDouble(-1.51).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).isOdd;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).isOdd;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).isOdd;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('isNegative >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).isNegative;
      const expected = true;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).isNegative;
      const expected = true;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).isNegative;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).isNegative;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).isNegative;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).isNegative;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('isPositive >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).isPositive;
      const expected = false;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).isPositive;
      const expected = false;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).isPositive;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).isPositive;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).isPositive;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).isPositive;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('isZero >', () {
    test('-1', () {
      final actual = Amount.fromInt(-1).isZero;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromInt(0).isZero;
      const expected = true;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromInt(1).isZero;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('isGreaterThanZero >', () {
    test('-1', () {
      final actual = Amount.fromInt(-1).isGreaterThanZero;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromInt(0).isGreaterThanZero;
      const expected = false;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromInt(1).isGreaterThanZero;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('isGreaterThanOrEqualZero >', () {
    test('-1', () {
      final actual = Amount.fromInt(-1).isGreaterThanOrEqualZero;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromInt(0).isGreaterThanOrEqualZero;
      const expected = true;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromInt(1).isGreaterThanOrEqualZero;
      const expected = true;
      expect(actual, expected);
    });
  });

  group('isLessThanZero >', () {
    test('-1', () {
      final actual = Amount.fromInt(-1).isLessThanZero;
      const expected = true;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromInt(0).isLessThanZero;
      const expected = false;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromInt(1).isLessThanZero;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('isLessThanOrEqualZero >', () {
    test('-1', () {
      final actual = Amount.fromInt(-1).isLessThanOrEqualZero;
      const expected = true;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromInt(0).isLessThanOrEqualZero;
      const expected = true;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromInt(1).isLessThanOrEqualZero;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('isInteger >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).isInteger;
      const expected = false;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).isInteger;
      const expected = true;
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).isInteger;
      const expected = false;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).isInteger;
      const expected = true;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).isInteger;
      const expected = false;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).isInteger;
      const expected = true;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).isInteger;
      const expected = false;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).isInteger;
      const expected = true;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).isInteger;
      const expected = false;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).isInteger;
      const expected = true;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).isInteger;
      const expected = false;
      expect(actual, expected);
    });
  });

  group('abs >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).abs();
      final expected = Amount.fromDouble(1.5);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).abs();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Amount.fromDouble(0.99).abs();
      final expected = Amount.fromDouble(0.99);
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).abs();
      final expected = Amount.fromDouble(0.01);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).abs();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).abs();
      final expected = Amount.fromDouble(0.01);
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Amount.fromDouble(-0.99).abs();
      final expected = Amount.fromDouble(0.99);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).abs();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).abs();
      final expected = Amount.fromDouble(1.5);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.456789, precision: 0).abs();
      final expected = Amount.fromDouble(123.456789, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.456789, precision: 4).abs();
      final expected = Amount.fromDouble(123.456789, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.456789, precision: 0).abs();
      final expected = Amount.fromDouble(123.456789, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.456789, precision: 4).abs();
      final expected = Amount.fromDouble(123.456789, precision: 4);
      expect(actual, expected);
    });
  });

  group('round >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).round();
      final expected = Amount.fromDouble(2);
      expect(actual, expected);
    });
    test('1.49', () {
      final actual = Amount.fromDouble(1.49).round();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).round();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0.5', () {
      final actual = Amount.fromDouble(0.50).round();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0.49', () {
      final actual = Amount.fromDouble(0.49).round();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).round();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-0.49', () {
      final actual = Amount.fromDouble(-0.49).round();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-0.5', () {
      final actual = Amount.fromDouble(-0.5).round();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).round();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-1.49', () {
      final actual = Amount.fromDouble(-1.49).round();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).round();
      final expected = Amount.fromDouble(-2);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.56789, precision: 0).round();
      final expected = Amount.fromDouble(124, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.56789, precision: 4).round();
      final expected = Amount.fromDouble(124, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.56789, precision: 0).round();
      final expected = Amount.fromDouble(-124, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.56789, precision: 4).round();
      final expected = Amount.fromDouble(-124, precision: 4);
      expect(actual, expected);
    });
  });

  group('ceil >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).ceil();
      final expected = Amount.fromDouble(2);
      expect(actual, expected);
    });
    test('1.49', () {
      final actual = Amount.fromDouble(1.49).ceil();
      final expected = Amount.fromDouble(2);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).ceil();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0.5', () {
      final actual = Amount.fromDouble(0.50).ceil();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0.49', () {
      final actual = Amount.fromDouble(0.49).ceil();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).ceil();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-0.49', () {
      final actual = Amount.fromDouble(-0.49).ceil();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-0.5', () {
      final actual = Amount.fromDouble(-0.5).ceil();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).ceil();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-1.49', () {
      final actual = Amount.fromDouble(-1.49).ceil();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).ceil();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.56789, precision: 0).ceil();
      final expected = Amount.fromDouble(124, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.56789, precision: 4).ceil();
      final expected = Amount.fromDouble(124, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.56789, precision: 0).ceil();
      final expected = Amount.fromDouble(-124, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.56789, precision: 4).ceil();
      final expected = Amount.fromDouble(-123, precision: 4);
      expect(actual, expected);
    });
  });

  group('floor >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).floor();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('1.49', () {
      final actual = Amount.fromDouble(1.49).floor();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).floor();
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('0.5', () {
      final actual = Amount.fromDouble(0.50).floor();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0.49', () {
      final actual = Amount.fromDouble(0.49).floor();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).floor();
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-0.49', () {
      final actual = Amount.fromDouble(-0.49).floor();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-0.5', () {
      final actual = Amount.fromDouble(-0.5).floor();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).floor();
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('-1.49', () {
      final actual = Amount.fromDouble(-1.49).floor();
      final expected = Amount.fromDouble(-2);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).floor();
      final expected = Amount.fromDouble(-2);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.56789, precision: 0).floor();
      final expected = Amount.fromDouble(124, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.56789, precision: 4).floor();
      final expected = Amount.fromDouble(123, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.56789, precision: 0).floor();
      final expected = Amount.fromDouble(-124, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.56789, precision: 4).floor();
      final expected = Amount.fromDouble(-124, precision: 4);
      expect(actual, expected);
    });
  });

  group('subtraction >', () {
    test('1.5', () {
      final actual = -Amount.fromDouble(1.5);
      final expected = Amount.fromDouble(-1.5);
      expect(actual, expected);
    });
    test('1', () {
      final actual = -Amount.fromDouble(1);
      final expected = Amount.fromDouble(-1);
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = -Amount.fromDouble(0.99);
      final expected = Amount.fromDouble(-0.99);
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = -Amount.fromDouble(0.01);
      final expected = Amount.fromDouble(-0.01);
      expect(actual, expected);
    });
    test('0', () {
      final actual = -Amount.fromDouble(0);
      final expected = Amount.fromDouble(0);
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = -Amount.fromDouble(-0.01);
      final expected = Amount.fromDouble(0.01);
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = -Amount.fromDouble(-0.99);
      final expected = Amount.fromDouble(0.99);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = -Amount.fromDouble(-1);
      final expected = Amount.fromDouble(1);
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = -Amount.fromDouble(-1.5);
      final expected = Amount.fromDouble(1.5);
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = -Amount.fromDouble(123.56789, precision: 0);
      final expected = Amount.fromDouble(-123.56789, precision: 0);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = -Amount.fromDouble(123.56789, precision: 4);
      final expected = Amount.fromDouble(-123.56789, precision: 4);
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = -Amount.fromDouble(-123.56789, precision: 0);
      final expected = Amount.fromDouble(123.56789, precision: 0);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = -Amount.fromDouble(-123.56789, precision: 4);
      final expected = Amount.fromDouble(123.56789, precision: 4);
      expect(actual, expected);
    });
  });

  group('hashCode >', () {
    test('value 1.11, precision 2', () {
      final amount = Amount.fromDouble(1.11, precision: 2);
      final actual = amount.hashCode;
      final expected = amount.value.hashCode ^ amount.precision.hashCode;
      expect(actual, expected);
    });
  });

  group('toDecimal >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).toDecimal();
      final expected = Decimal.parse('1.5');
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).toDecimal();
      final expected = Decimal.parse('1');
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Amount.fromDouble(0.99).toDecimal();
      final expected = Decimal.parse('0.99');
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).toDecimal();
      final expected = Decimal.parse('0.01');
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).toDecimal();
      final expected = Decimal.parse('0.0');
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).toDecimal();
      final expected = Decimal.parse('-0.01');
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Amount.fromDouble(-0.99).toDecimal();
      final expected = Decimal.parse('-0.99');
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).toDecimal();
      final expected = Decimal.parse('-1');
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).toDecimal();
      final expected = Decimal.parse('-1.5');
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.56789, precision: 0).toDecimal();
      final expected = Decimal.fromInt(124);
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.56789, precision: 4).toDecimal();
      final expected = Decimal.parse('123.5679');
      expect(actual, expected);
    });
    test('positive, precision 20', () {
      final actual =
          Amount.fromDouble(1.37079328058825288511, precision: 20).toDecimal();
      final expected = Decimal.parse('1.370793280588252');
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.56789, precision: 0).toDecimal();
      final expected = Decimal.fromInt(-124);
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.56789, precision: 4).toDecimal();
      final expected = Decimal.parse('-123.5679');
      expect(actual, expected);
    });
    test('negative, precision 20', () {
      final actual =
          Amount.fromDouble(-1.37079328058825288511, precision: 20).toDecimal();
      final expected = Decimal.parse('-1.370793280588252');
      expect(actual, expected);
    });
  });

  group('toDouble >', () {
    test('1.5', () {
      final actual = Amount.fromDouble(1.5).toDouble();
      const expected = 1.5;
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(1).toDouble();
      const expected = 1;
      expect(actual, expected);
    });
    test('0.99', () {
      final actual = Amount.fromDouble(0.99).toDouble();
      const expected = 0.99;
      expect(actual, expected);
    });
    test('0.01', () {
      final actual = Amount.fromDouble(0.01).toDouble();
      const expected = 0.01;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromDouble(0).toDouble();
      const expected = 0.0;
      expect(actual, expected);
    });
    test('-0.01', () {
      final actual = Amount.fromDouble(-0.01).toDouble();
      const expected = -0.01;
      expect(actual, expected);
    });
    test('-0.99', () {
      final actual = Amount.fromDouble(-0.99).toDouble();
      const expected = -0.99;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).toDouble();
      const expected = -1;
      expect(actual, expected);
    });
    test('-1.5', () {
      final actual = Amount.fromDouble(-1.5).toDouble();
      const expected = -1.5;
      expect(actual, expected);
    });
    test('positive, precision 0', () {
      final actual = Amount.fromDouble(123.56789, precision: 0).toDouble();
      const expected = 124.0;
      expect(actual, expected);
    });
    test('positive, precision 4', () {
      final actual = Amount.fromDouble(123.56789, precision: 4).toDouble();
      const expected = 123.5679;
      expect(actual, expected);
    });
    test('positive, precision 20', () {
      final actual =
          Amount.fromDouble(1.37079328058825288511, precision: 20).toDouble();
      const expected = 1.370793280588252;
      expect(actual, expected);
    });
    test('negative, precision 0', () {
      final actual = Amount.fromDouble(-123.56789, precision: 0).toDouble();
      const expected = -124.0;
      expect(actual, expected);
    });
    test('negative, precision 4', () {
      final actual = Amount.fromDouble(-123.56789, precision: 4).toDouble();
      const expected = -123.5679;
      expect(actual, expected);
    });
    test('positive, precision 20', () {
      final actual =
          Amount.fromDouble(-1.37079328058825288511, precision: 20).toDouble();
      const expected = -1.370793280588252;
      expect(actual, expected);
    });
  });

  group('toString >', () {
    group('AF-RF-DSF >', () {
      test('fixedDouble/none/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1000.10';
        expect(actual, expected);
      });
      test('fixedDouble/space/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1 000.10';
        expect(actual, expected);
      });
      test('fixedDouble/comma/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.comma,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1,000.10';
        expect(actual, expected);
      });
      test('fixedDouble/point/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.point,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1.000.10';
        expect(actual, expected);
      });
      test('fixedDouble/none/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000,10';
        expect(actual, expected);
      });
      test('fixedDouble/space/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1 000,10';
        expect(actual, expected);
      });
      test('fixedDouble/comma/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.comma,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1,000,10';
        expect(actual, expected);
      });
      test('fixedDouble/point/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.fixedDouble,
          rankFormat: RankFormat.point,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1.000,10';
        expect(actual, expected);
      });
      test('fixedDouble precision 0', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.fixedDouble, precision: 0);
        const expected = '100';
        expect(actual, expected);
      });
      test('fixedDouble precision 4', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.fixedDouble, precision: 4);
        const expected = '100.1200';
        expect(actual, expected);
      });
      test('fixedDouble precision 8', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.fixedDouble, precision: 8);
        const expected = '100.12000000';
        expect(actual, expected);
      });
      test('fixedDouble Amount.precision 0', () {
        final actual = Amount.fromDouble(100.123456, precision: 0)
            .toString(amountFormat: AmountFormat.fixedDouble);
        const expected = '100';
        expect(actual, expected);
      });
      test('fixedDouble Amount.precision 4', () {
        final actual = Amount.fromDouble(100.123456, precision: 4)
            .toString(amountFormat: AmountFormat.fixedDouble);
        const expected = '100.1235';
        expect(actual, expected);
      });
      test('fixedDouble Amount.precision 8', () {
        final actual = Amount.fromDouble(100.123456, precision: 8)
            .toString(amountFormat: AmountFormat.fixedDouble);
        const expected = '100.12345600';
        expect(actual, expected);
      });
      test('fixedDouble Amount.precision 4, precision 2', () {
        final actual = Amount.fromDouble(100.123456, precision: 4)
            .toString(amountFormat: AmountFormat.fixedDouble, precision: 2);
        const expected = '100.12';
        expect(actual, expected);
      });
      test('fixedDouble Amount.precision 2, precision 4', () {
        final actual = Amount.fromDouble(100.123456, precision: 2)
            .toString(amountFormat: AmountFormat.fixedDouble, precision: 4);
        const expected = '100.1200';
        expect(actual, expected);
      });

      test('integer/none/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1000';
        expect(actual, expected);
      });
      test('integer/space/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1 000';
        expect(actual, expected);
      });
      test('integer/comma/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.comma,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1,000';
        expect(actual, expected);
      });
      test('integer/point/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.point,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1.000';
        expect(actual, expected);
      });
      test('integer/none/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000';
        expect(actual, expected);
      });
      test('integer/space/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1 000';
        expect(actual, expected);
      });
      test('integer/comma/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.comma,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1,000';
        expect(actual, expected);
      });
      test('integer/point/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.integer,
          rankFormat: RankFormat.point,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1.000';
        expect(actual, expected);
      });
      test('integer precision 0', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.integer, precision: 0);
        const expected = '100';
        expect(actual, expected);
      });
      test('integer precision 4', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.integer, precision: 4);
        const expected = '100';
        expect(actual, expected);
      });
      test('integer precision 8', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.integer, precision: 8);
        const expected = '100';
        expect(actual, expected);
      });
      test('integer Amount.precision 0', () {
        final actual = Amount.fromDouble(100.123456, precision: 0)
            .toString(amountFormat: AmountFormat.integer);
        const expected = '100';
        expect(actual, expected);
      });
      test('integer Amount.precision 4', () {
        final actual = Amount.fromDouble(100.123456, precision: 4)
            .toString(amountFormat: AmountFormat.integer);
        const expected = '100';
        expect(actual, expected);
      });
      test('integer Amount.precision 8', () {
        final actual = Amount.fromDouble(100.123456, precision: 8)
            .toString(amountFormat: AmountFormat.integer);
        const expected = '100';
        expect(actual, expected);
      });
      test('integer Amount.precision 4, precision 2', () {
        final actual = Amount.fromDouble(100.123456, precision: 4)
            .toString(amountFormat: AmountFormat.integer, precision: 2);
        const expected = '100';
        expect(actual, expected);
      });
      test('integer Amount.precision 2, precision 4', () {
        final actual = Amount.fromDouble(100.123456, precision: 2)
            .toString(amountFormat: AmountFormat.integer, precision: 4);
        const expected = '100';
        expect(actual, expected);
      });

      test('flexibleDouble/none/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1000.1';
        expect(actual, expected);
      });
      test('flexibleDouble/space/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1 000.1';
        expect(actual, expected);
      });
      test('flexibleDouble/comma/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.comma,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1,000.1';
        expect(actual, expected);
      });
      test('flexibleDouble/point/point', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.point,
          decimalSeparatorFormat: DecimalSeparatorFormat.point,
        );
        const expected = '1.000.1';
        expect(actual, expected);
      });
      test('flexibleDouble/none/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.none,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1000,1';
        expect(actual, expected);
      });
      test('flexibleDouble/space/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.space,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1 000,1';
        expect(actual, expected);
      });
      test('flexibleDouble/comma/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.comma,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1,000,1';
        expect(actual, expected);
      });
      test('flexibleDouble/point/comma', () {
        final actual = Amount.fromDouble(1000.1).toString(
          amountFormat: AmountFormat.flexibleDouble,
          rankFormat: RankFormat.point,
          decimalSeparatorFormat: DecimalSeparatorFormat.comma,
        );
        const expected = '1.000,1';
        expect(actual, expected);
      });
      test('flexibleDouble precision 0 negative', () {
        final actual = Amount.fromDouble(-100.123456)
            .toString(amountFormat: AmountFormat.flexibleDouble, precision: 0);
        const expected = '-100.12';
        expect(actual, expected);
      });
      test('flexibleDouble precision 4 negative', () {
        final actual = Amount.fromDouble(-100.123456)
            .toString(amountFormat: AmountFormat.flexibleDouble, precision: 4);
        const expected = '-100.1200';
        expect(actual, expected);
      });
      test('flexibleDouble precision 8 negative', () {
        final actual = Amount.fromDouble(-100.123456)
            .toString(amountFormat: AmountFormat.flexibleDouble, precision: 8);
        const expected = '-100.12000000';
        expect(actual, expected);
      });
      test('flexibleDouble precision 0', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.flexibleDouble, precision: 0);
        const expected = '100.12';
        expect(actual, expected);
      });
      test('flexibleDouble precision 4', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.flexibleDouble, precision: 4);
        const expected = '100.1200';
        expect(actual, expected);
      });
      test('flexibleDouble precision 8', () {
        final actual = Amount.fromDouble(100.123456)
            .toString(amountFormat: AmountFormat.flexibleDouble, precision: 8);
        const expected = '100.12000000';
        expect(actual, expected);
      });
      test('flexibleDouble Amount.precision 0', () {
        final actual = Amount.fromDouble(100.123456, precision: 0)
            .toString(amountFormat: AmountFormat.flexibleDouble);
        const expected = '100';
        expect(actual, expected);
      });
      test('flexibleDouble Amount.precision 4', () {
        final actual = Amount.fromDouble(100.123456, precision: 4)
            .toString(amountFormat: AmountFormat.flexibleDouble);
        const expected = '100.1235';
        expect(actual, expected);
      });
      test('flexibleDouble Amount.precision 8', () {
        final actual = Amount.fromDouble(100.123456, precision: 8)
            .toString(amountFormat: AmountFormat.flexibleDouble);
        const expected = '100.123456';
        expect(actual, expected);
      });
      test('flexibleDouble Amount.precision 4, precision 2', () {
        final actual = Amount.fromDouble(100.123456, precision: 4)
            .toString(amountFormat: AmountFormat.flexibleDouble, precision: 2);
        const expected = '100.1235';
        expect(actual, expected);
      });
      test('flexibleDouble Amount.precision 2, precision 4', () {
        final actual = Amount.fromDouble(100.123456, precision: 2)
            .toString(amountFormat: AmountFormat.flexibleDouble, precision: 4);
        const expected = '100.1200';
        expect(actual, expected);
      });
    });
  });
}
