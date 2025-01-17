// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdamount/mdamount.dart';
import 'package:test/test.dart';

import 'constants.dart';

void main() {
  group('generic >', () {
    test('100', () {
      final actual = Amount(BigInt.from(100)).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount(BigInt.one).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount(BigInt.zero).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount(-BigInt.one).value;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-100', () {
      final actual = Amount(-BigInt.from(100)).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final actual = Amount(maxFiniteNumerator).value;
      final expected = maxFiniteNumerator;
      expect(actual, expected);
    });
    test('precision -1', () {
      final actual = Amount(BigInt.from(123), precision: -1);
      final expected =
          Amount(BigInt.from(123), precision: Amount.defaultPrecision);
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Amount(BigInt.from(123456789), precision: 0).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Amount(BigInt.from(123456789), precision: 4).fractional;
      final expected = BigInt.from(6789);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Amount(BigInt.from(123456789), precision: 12).fractional;
      final expected = BigInt.from(123456789);
      expect(actual, expected);
    });
  });

  group('fromNumerator >', () {
    test('100', () {
      final actual = Amount.fromNumerator(100).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromNumerator(1).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromNumerator(0).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromNumerator(-1).value;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-100', () {
      final actual = Amount.fromNumerator(-100).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final actual = Amount.fromNumerator(maxFiniteInt).value;
      final expected = BigInt.from(maxFiniteInt);
      expect(actual, expected);
    });
    test('precision -1', () {
      Amount actual() => Amount.fromNumerator(0, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Amount.fromNumerator(123456789, precision: 0).fractional;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Amount.fromNumerator(123456789, precision: 4).fractional;
      final expected = BigInt.from(6789);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Amount.fromNumerator(123456789, precision: 12).fractional;
      final expected = BigInt.from(123456789);
      expect(actual, expected);
    });
  });

  group('fromBigInt >', () {
    test('1', () {
      final actual = Amount.fromBigInt(BigInt.one).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromBigInt(BigInt.zero).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromBigInt(-BigInt.one).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('precision -1', () {
      Amount actual() => Amount.fromBigInt(BigInt.one, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Amount.fromBigInt(BigInt.one, precision: 0).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Amount.fromBigInt(BigInt.one, precision: 4).value;
      final expected = BigInt.from(10000);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Amount.fromBigInt(BigInt.one, precision: 12).value;
      final expected = BigInt.from(1000000000000);
      expect(actual, expected);
    });
  });

  group('fromInt >', () {
    test('1', () {
      final actual = Amount.fromInt(1).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('0', () {
      final actual = Amount.fromInt(0).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromInt(-1).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final actual = Amount.fromInt(maxFiniteInt).value;
      final expected = BigInt.from(maxFiniteInt) * precisionModifier;
      expect(actual, expected);
    });
    test('precision -1', () {
      Amount actual() => Amount.fromInt(1, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Amount.fromInt(1, precision: 0).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Amount.fromInt(1, precision: 4).value;
      final expected = BigInt.from(10000);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Amount.fromInt(1, precision: 12).value;
      final expected = BigInt.from(1000000000000);
      expect(actual, expected);
    });
  });

  group('fromDecimal >', () {
    test('1', () {
      final actual = Amount.fromDecimal(Decimal.one).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDecimal(Decimal.parse('0.01')).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('65.4 flooring', () {
      final actual = Amount.fromDecimal(Decimal.parse('0.654')).value;
      final expected = BigInt.from(65);
      expect(actual, expected);
    });
    test('34.5 ceiling', () {
      final actual = Amount.fromDecimal(Decimal.parse('0.345')).value;
      final expected = BigInt.from(35);
      expect(actual, expected);
    });
    test('0 value', () {
      final actual = Amount.fromDecimal(Decimal.zero).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDecimal(Decimal.parse('-0.01')).value;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-34.5 ceiling', () {
      final actual = Amount.fromDecimal(Decimal.parse('-0.345')).value;
      final expected = -BigInt.from(35);
      expect(actual, expected);
    });
    test('-65.4 flooring', () {
      final actual = Amount.fromDecimal(Decimal.parse('-0.654')).value;
      final expected = -BigInt.from(65);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDecimal(-Decimal.one).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final amount = Decimal.parse('$maxFinite');
      final actual = Amount.fromDecimal(amount).value;
      final expected =
          (amount * Decimal.fromBigInt(precisionModifier)).round().toBigInt();
      expect(actual, expected);
    });
    test('precision -1', () {
      Amount actual() => Amount.fromDecimal(Decimal.zero, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual =
          Amount.fromDecimal(Decimal.parse('0.123456789'), precision: 0).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual =
          Amount.fromDecimal(Decimal.parse('0.123456789'), precision: 4).value;
      final expected = BigInt.from(1235);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual =
          Amount.fromDecimal(Decimal.parse('0.123456789'), precision: 12).value;
      final expected = BigInt.from(123456789000);
      expect(actual, expected);
    });
  });

  group('fromDouble >', () {
    test('1', () {
      final actual = Amount.fromDouble(1).value;
      final expected = BigInt.from(100);
      expect(actual, expected);
    });
    test('1', () {
      final actual = Amount.fromDouble(0.01).value;
      final expected = BigInt.one;
      expect(actual, expected);
    });
    test('65.4 flooring', () {
      final actual = Amount.fromDouble(0.654).value;
      final expected = BigInt.from(65);
      expect(actual, expected);
    });
    test('34.5 ceiling', () {
      final actual = Amount.fromDouble(0.345).value;
      final expected = BigInt.from(35);
      expect(actual, expected);
    });
    test('0 value', () {
      final actual = Amount.fromDouble(0).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-0.01).value;
      final expected = -BigInt.one;
      expect(actual, expected);
    });
    test('-34.5 ceiling', () {
      final actual = Amount.fromDouble(-0.345).value;
      final expected = -BigInt.from(35);
      expect(actual, expected);
    });
    test('-65.4 flooring', () {
      final actual = Amount.fromDouble(-0.654).value;
      final expected = -BigInt.from(65);
      expect(actual, expected);
    });
    test('-1', () {
      final actual = Amount.fromDouble(-1).value;
      final expected = -BigInt.from(100);
      expect(actual, expected);
    });
    test('max finite', () {
      final actual = Amount.fromDouble(maxFinite).value;
      final expected = maxFiniteNumerator;
      expect(actual, expected);
    });
    test('infinite', () {
      Amount actual() => Amount.fromDouble(double.infinity);
      final expected = throwsA(const TypeMatcher<InfiniteNumberException>());
      expect(actual, expected);
    });
    test('precision -1', () {
      Amount actual() => Amount.fromDouble(1, precision: -1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
    test('precision 0', () {
      final actual = Amount.fromDouble(0.123456789, precision: 0).value;
      final expected = BigInt.zero;
      expect(actual, expected);
    });
    test('precision 4', () {
      final actual = Amount.fromDouble(0.123456789, precision: 4).value;
      final expected = BigInt.from(1235);
      expect(actual, expected);
    });
    test('precision 12', () {
      final actual = Amount.fromDouble(0.123456789, precision: 12).value;
      final expected = BigInt.from(123456789000);
      expect(actual, expected);
    });
  });

  group('fromString >', () {
    group('dot >', () {
      test('1', () {
        final actual = Amount.fromString('1').value;
        final expected = BigInt.from(100);
        expect(actual, expected);
      });
      test('1', () {
        final actual = Amount.fromString('0.01').value;
        final expected = BigInt.one;
        expect(actual, expected);
      });
      test('65.4 value flooring', () {
        final actual = Amount.fromString('0.654').value;
        final expected = BigInt.from(65);
        expect(actual, expected);
      });
      test('34.5 value ceiling', () {
        final actual = Amount.fromString('0.345').value;
        final expected = BigInt.from(35);
        expect(actual, expected);
      });
      test('0 value', () {
        final actual = Amount.fromString('0').value;
        final expected = BigInt.zero;
        expect(actual, expected);
      });
      test('-1', () {
        final actual = Amount.fromString('-0.01').value;
        final expected = -BigInt.one;
        expect(actual, expected);
      });
      test('-34.5 value ceiling', () {
        final actual = Amount.fromString('-0.345').value;
        final expected = -BigInt.from(35);
        expect(actual, expected);
      });
      test('-65.4 value flooring', () {
        final actual = Amount.fromString('-0.654').value;
        final expected = -BigInt.from(65);
        expect(actual, expected);
      });
      test('-1', () {
        final actual = Amount.fromString('-1').value;
        final expected = -BigInt.from(100);
        expect(actual, expected);
      });

      group('comma >', () {
        test('1', () {
          final actual = Amount.fromString('0,01').value;
          final expected = BigInt.one;
          expect(actual, expected);
        });
        test('65.4 value flooring', () {
          final actual = Amount.fromString('0,654').value;
          final expected = BigInt.from(65);
          expect(actual, expected);
        });
        test('34.5 value ceiling', () {
          final actual = Amount.fromString('0,345').value;
          final expected = BigInt.from(35);
          expect(actual, expected);
        });
        test('-1', () {
          final actual = Amount.fromString('-0,01').value;
          final expected = -BigInt.one;
          expect(actual, expected);
        });
        test('-34.5 value ceiling', () {
          final actual = Amount.fromString('-0,345').value;
          final expected = -BigInt.from(35);
          expect(actual, expected);
        });
        test('-65.4 value flooring', () {
          final actual = Amount.fromString('-0,654').value;
          final expected = -BigInt.from(65);
          expect(actual, expected);
        });
      });

      group('Cases with spaces >', () {
        group('comma >', () {
          test('positive amount', () {
            final actual = Amount.fromString('1 000,01').value;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual = Amount.fromString('-1 000,01').value;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });

        group('dot >', () {
          test('positive amount', () {
            final actual = Amount.fromString('1 000.01').value;
            final expected = BigInt.from(100001);
            expect(actual, expected);
          });
          test('negative amount', () {
            final actual = Amount.fromString('-1 000.01').value;
            final expected = -BigInt.from(100001);
            expect(actual, expected);
          });
        });
      });
    });

    group('Misc >', () {
      test('empty string', () {
        final actual = Amount.fromString('');
        final expected = Amount.zero;
        expect(actual, expected);
      });
      test('string without fractions but with decimal separator', () {
        final actual = Amount.fromString('123.');
        final expected = Amount.fromString('123');
        expect(actual, expected);
      });
      test('max finite', () {
        final actual = Amount.fromString('$maxFinite').value;
        final expected = (Decimal.parse('$maxFinite') * Decimal.fromInt(100))
            .round()
            .toBigInt();
        expect(actual, expected);
      });
      test('precision -1', () {
        Amount actual() => Amount.fromString('1', precision: -1);
        final expected =
            throwsA(const TypeMatcher<NegativePrecisionException>());
        expect(actual, expected);
      });
      test('precision 0', () {
        final actual = Amount.fromString('0.123456789', precision: 0).value;
        final expected = BigInt.zero;
        expect(actual, expected);
      });
      test('precision 4', () {
        final actual = Amount.fromString('0.123456789', precision: 4).value;
        final expected = BigInt.from(1235);
        expect(actual, expected);
      });
      test('precision 12', () {
        final actual = Amount.fromString('0.123456789', precision: 12).value;
        final expected = BigInt.from(123456789000);
        expect(actual, expected);
      });
    });
  });

  group('static >', () {
    test('zero', () {
      final actual = Amount.zero;
      final expected = Amount.fromInt(0);
      expect(actual, expected);
    });
    test('zeroOf', () {
      final actual = Amount.zeroOf(4);
      final expected = Amount.fromInt(0, precision: 4);
      expect(actual, expected);
    });
    test('one', () {
      final actual = Amount.one;
      final expected = Amount.fromDouble(0.01);
      expect(actual, expected);
    });
    test('oneOf', () {
      final actual = Amount.oneOf(4);
      final expected = Amount.fromDouble(0.0001, precision: 4);
      expect(actual, expected);
    });
    test('oneInt', () {
      final actual = Amount.oneInt;
      final expected = Amount.fromInt(1);
      expect(actual, expected);
    });
    test('oneIntOf', () {
      final actual = Amount.oneIntOf(4);
      final expected = Amount.fromInt(1, precision: 4);
      expect(actual, expected);
    });
    test('default (2) precision', () {
      final actual = Amount.defaultPrecision;
      const expected = 2;
      expect(actual, expected);
    });
    test('set 0 precision', () {
      Amount.setDefaultPrecision(0);
      final actual = Amount.defaultPrecision;
      const expected = 0;
      expect(actual, expected);
    });
    test('set 4 precision', () {
      Amount.setDefaultPrecision(4);
      final actual = Amount.defaultPrecision;
      const expected = 4;
      expect(actual, expected);
    });
    test('set -1 precision', () {
      void actual() => Amount.setDefaultPrecision(-1);
      final expected = throwsA(const TypeMatcher<NegativePrecisionException>());
      expect(actual, expected);
    });
  });
}
