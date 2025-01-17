// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:mdamount/mdamount.dart';
import 'package:test/test.dart';

void main() {
  group('DecimalSeparatorFormat >', () {
    group('Exceptions >', () {
      test('empty', () {
        String actual() => DecimalSeparatorFormat.point.format('');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('comma separated', () {
        String actual() => DecimalSeparatorFormat.point.format('1234,5');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('comma separated with too much fractionals', () {
        String actual() => DecimalSeparatorFormat.point.format('1234,567');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('integer with decimal point', () {
        String actual() => DecimalSeparatorFormat.point.format('123.');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point', () {
        String actual() => DecimalSeparatorFormat.point.format('.');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point and fractionals', () {
        String actual() => DecimalSeparatorFormat.point.format('.23');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point and too much fractionals', () {
        String actual() => DecimalSeparatorFormat.point.format('.234');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
    });

    group('Point >', () {
      test('1234', () {
        final actual = DecimalSeparatorFormat.point.format('1234');
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234.5', () {
        final actual = DecimalSeparatorFormat.point.format('1234.5');
        const expected = '1234.5';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual = DecimalSeparatorFormat.point.format('1234.56');
        const expected = '1234.56';
        expect(actual, expected);
      });
      test('-1234', () {
        final actual = DecimalSeparatorFormat.point.format('-1234');
        const expected = '-1234';
        expect(actual, expected);
      });
      test('-1234.5', () {
        final actual = DecimalSeparatorFormat.point.format('-1234.5');
        const expected = '-1234.5';
        expect(actual, expected);
      });
      test('-1234.56', () {
        final actual = DecimalSeparatorFormat.point.format('-1234.56');
        const expected = '-1234.56';
        expect(actual, expected);
      });
    });

    group('Comma >', () {
      test('1234', () {
        final actual = DecimalSeparatorFormat.comma.format('1234');
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234,5', () {
        final actual = DecimalSeparatorFormat.comma.format('1234.5');
        const expected = '1234,5';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual = DecimalSeparatorFormat.comma.format('1234.56');
        const expected = '1234,56';
        expect(actual, expected);
      });
      test('-1234', () {
        final actual = DecimalSeparatorFormat.comma.format('-1234');
        const expected = '-1234';
        expect(actual, expected);
      });
      test('-1234.5', () {
        final actual = DecimalSeparatorFormat.comma.format('-1234.5');
        const expected = '-1234,5';
        expect(actual, expected);
      });
      test('-1234.56', () {
        final actual = DecimalSeparatorFormat.comma.format('-1234.56');
        const expected = '-1234,56';
        expect(actual, expected);
      });
    });
  });

  group('RankFormat >', () {
    group('Exceptions >', () {
      test('empty', () {
        String actual() => RankFormat.none.format('');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('comma separated', () {
        String actual() => RankFormat.none.format('1234,5');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('comma separated with too much fractionals', () {
        String actual() => RankFormat.none.format('1234,567');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('integer with decimal point', () {
        String actual() => RankFormat.none.format('123.');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point', () {
        String actual() => RankFormat.none.format('.');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point and fractionals', () {
        String actual() => RankFormat.none.format('.23');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
      test('decimal point and too much fractionals', () {
        String actual() => RankFormat.none.format('.234');
        final expected = throwsA(const TypeMatcher<ArgumentError>());
        expect(actual, expected);
      });
    });

    group('None >', () {
      group('Integer >', () {
        test('1', () {
          final actual = RankFormat.none.format('1');
          const expected = '1';
          expect(actual, expected);
        });
        test('-12', () {
          final actual = RankFormat.none.format('-12');
          const expected = '-12';
          expect(actual, expected);
        });
        test('123', () {
          final actual = RankFormat.none.format('123');
          const expected = '123';
          expect(actual, expected);
        });
        test('1234', () {
          final actual = RankFormat.none.format('1234');
          const expected = '1234';
          expect(actual, expected);
        });
        test('12345', () {
          final actual = RankFormat.none.format('12345');
          const expected = '12345';
          expect(actual, expected);
        });
        test('123456', () {
          final actual = RankFormat.none.format('123456');
          const expected = '123456';
          expect(actual, expected);
        });
        test('1234567', () {
          final actual = RankFormat.none.format('1234567');
          const expected = '1234567';
          expect(actual, expected);
        });
        test('12345678', () {
          final actual = RankFormat.none.format('12345678');
          const expected = '12345678';
          expect(actual, expected);
        });
        test('123456789', () {
          final actual = RankFormat.none.format('123456789');
          const expected = '123456789';
          expect(actual, expected);
        });
      });
      group('Integer with fractionals >', () {
        test('1.1', () {
          final actual = RankFormat.none.format('1.1');
          const expected = '1.1';
          expect(actual, expected);
        });
        test('1234.1', () {
          final actual = RankFormat.none.format('1234.1');
          const expected = '1234.1';
          expect(actual, expected);
        });
        test('12345678.1', () {
          final actual = RankFormat.none.format('12345678.1');
          const expected = '12345678.1';
          expect(actual, expected);
        });
        test('1.85', () {
          final actual = RankFormat.none.format('1.85');
          const expected = '1.85';
          expect(actual, expected);
        });
        test('1234.85', () {
          final actual = RankFormat.none.format('1234.85');
          const expected = '1234.85';
          expect(actual, expected);
        });
        test('12345678.85', () {
          final actual = RankFormat.none.format('12345678.85');
          const expected = '12345678.85';
          expect(actual, expected);
        });
        test('1234.857562', () {
          final actual = RankFormat.none.format('1234.857562');
          const expected = '1234.857562';
          expect(actual, expected);
        });
      });
    });

    group('Space >', () {
      group('Integer >', () {
        test('1', () {
          final actual = RankFormat.space.format('1');
          const expected = '1';
          expect(actual, expected);
        });
        test('-12', () {
          final actual = RankFormat.space.format('-12');
          const expected = '-12';
          expect(actual, expected);
        });
        test('123', () {
          final actual = RankFormat.space.format('123');
          const expected = '123';
          expect(actual, expected);
        });
        test('1234', () {
          final actual = RankFormat.space.format('1234');
          const expected = '1 234';
          expect(actual, expected);
        });
        test('12345', () {
          final actual = RankFormat.space.format('12345');
          const expected = '12 345';
          expect(actual, expected);
        });
        test('123456', () {
          final actual = RankFormat.space.format('123456');
          const expected = '123 456';
          expect(actual, expected);
        });
        test('1234567', () {
          final actual = RankFormat.space.format('1234567');
          const expected = '1 234 567';
          expect(actual, expected);
        });
        test('12345678', () {
          final actual = RankFormat.space.format('12345678');
          const expected = '12 345 678';
          expect(actual, expected);
        });
        test('123456789', () {
          final actual = RankFormat.space.format('123456789');
          const expected = '123 456 789';
          expect(actual, expected);
        });
      });
      group('Integer with fractionals >', () {
        test('1.1', () {
          final actual = RankFormat.space.format('1.1');
          const expected = '1.1';
          expect(actual, expected);
        });
        test('1234.1', () {
          final actual = RankFormat.space.format('1234.1');
          const expected = '1 234.1';
          expect(actual, expected);
        });
        test('12345678.1', () {
          final actual = RankFormat.space.format('12345678.1');
          const expected = '12 345 678.1';
          expect(actual, expected);
        });
        test('1.85', () {
          final actual = RankFormat.space.format('1.85');
          const expected = '1.85';
          expect(actual, expected);
        });
        test('1234.85', () {
          final actual = RankFormat.space.format('1234.85');
          const expected = '1 234.85';
          expect(actual, expected);
        });
        test('12345678.85', () {
          final actual = RankFormat.space.format('12345678.85');
          const expected = '12 345 678.85';
          expect(actual, expected);
        });
        test('1234.857562', () {
          final actual = RankFormat.space.format('1234.857562');
          const expected = '1 234.857562';
          expect(actual, expected);
        });
      });
    });
  });

  group('AmountFormat >', () {
    group('integer >', () {
      test('1234', () {
        final actual = AmountFormat.integer.format(Amount.fromDouble(1234));
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234.49', () {
        final actual = AmountFormat.integer.format(Amount.fromDouble(1234.49));
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234.5', () {
        final actual = AmountFormat.integer.format(Amount.fromDouble(1234.5));
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual = AmountFormat.integer.format(Amount.fromDouble(1234.56));
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.56789, precision 0', () {
        final actual =
            AmountFormat.integer.format(Amount.fromDouble(1234.56789), 0);
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.56789, precision 4', () {
        final actual =
            AmountFormat.integer.format(Amount.fromDouble(1234.56789), 4);
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.56789, Amount.precision 0', () {
        final actual = AmountFormat.integer
            .format(Amount.fromDouble(1234.56789, precision: 0));
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.56789, Amount.precision 4', () {
        final actual = AmountFormat.integer
            .format(Amount.fromDouble(1234.56789, precision: 4));
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.567, Amount.precision 4, precision 2', () {
        final actual = AmountFormat.integer
            .format(Amount.fromDouble(1234.567, precision: 4), 2);
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.567, Amount.precision 2, precision 4', () {
        final actual = AmountFormat.integer
            .format(Amount.fromDouble(1234.567, precision: 2), 4);
        const expected = '1235';
        expect(actual, expected);
      });
    });

    group('fixedDouble >', () {
      test('1234', () {
        final actual = AmountFormat.fixedDouble.format(Amount.fromDouble(1234));
        const expected = '1234.00';
        expect(actual, expected);
      });
      test('1234.49', () {
        final actual =
            AmountFormat.fixedDouble.format(Amount.fromDouble(1234.49));
        const expected = '1234.49';
        expect(actual, expected);
      });
      test('1234.5', () {
        final actual =
            AmountFormat.fixedDouble.format(Amount.fromDouble(1234.5));
        const expected = '1234.50';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual =
            AmountFormat.fixedDouble.format(Amount.fromDouble(1234.56));
        const expected = '1234.56';
        expect(actual, expected);
      });
      test('1234.56789, precision 0', () {
        final actual =
            AmountFormat.fixedDouble.format(Amount.fromDouble(1234.56789), 0);
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.56789, precision 4', () {
        final actual =
            AmountFormat.fixedDouble.format(Amount.fromDouble(1234.56789), 4);
        const expected = '1234.5700';
        expect(actual, expected);
      });
      test('1234.56789, Amount.precision 0', () {
        final actual = AmountFormat.fixedDouble
            .format(Amount.fromDouble(1234.56789, precision: 0));
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.56789, Amount.precision 4', () {
        final actual = AmountFormat.fixedDouble
            .format(Amount.fromDouble(1234.56789, precision: 4));
        const expected = '1234.5679';
        expect(actual, expected);
      });
      test('1234.567, Amount.precision 4, precision 2', () {
        final actual = AmountFormat.fixedDouble
            .format(Amount.fromDouble(1234.567, precision: 4), 2);
        const expected = '1234.57';
        expect(actual, expected);
      });
      test('1234.567, Amount.precision 2, precision 4', () {
        final actual = AmountFormat.fixedDouble
            .format(Amount.fromDouble(1234.567, precision: 2), 4);
        const expected = '1234.5700';
        expect(actual, expected);
      });
      test('precision -1', () {
        String actual() =>
            AmountFormat.fixedDouble.format(Amount.fromNumerator(0), -1);
        final expected =
            throwsA(const TypeMatcher<NegativePrecisionException>());
        expect(actual, expected);
      });
    });

    group('flexibleDouble >', () {
      test('1234', () {
        final actual =
            AmountFormat.flexibleDouble.format(Amount.fromDouble(1234));
        const expected = '1234';
        expect(actual, expected);
      });
      test('1234.49', () {
        final actual =
            AmountFormat.flexibleDouble.format(Amount.fromDouble(1234.49));
        const expected = '1234.49';
        expect(actual, expected);
      });
      test('1234.5', () {
        final actual =
            AmountFormat.flexibleDouble.format(Amount.fromDouble(1234.5));
        const expected = '1234.5';
        expect(actual, expected);
      });
      test('1234.56', () {
        final actual =
            AmountFormat.flexibleDouble.format(Amount.fromDouble(1234.56));
        const expected = '1234.56';
        expect(actual, expected);
      });
      test('1234.567, precision 0', () {
        final actual =
            AmountFormat.flexibleDouble.format(Amount.fromDouble(1234.567), 0);
        const expected = '1234.57';
        expect(actual, expected);
      });
      test('1234.567, precision 4', () {
        final actual =
            AmountFormat.flexibleDouble.format(Amount.fromDouble(1234.567), 4);
        const expected = '1234.5700';
        expect(actual, expected);
      });
      test('-1234.567, precision 0', () {
        final actual =
            AmountFormat.flexibleDouble.format(Amount.fromDouble(-1234.567), 0);
        const expected = '-1234.57';
        expect(actual, expected);
      });
      test('-1234.567, precision 4', () {
        final actual =
            AmountFormat.flexibleDouble.format(Amount.fromDouble(-1234.567), 4);
        const expected = '-1234.5700';
        expect(actual, expected);
      });
      test('1234.567, Amount.precision 0', () {
        final actual = AmountFormat.flexibleDouble
            .format(Amount.fromDouble(1234.567, precision: 0));
        const expected = '1235';
        expect(actual, expected);
      });
      test('1234.567, Amount.precision 4', () {
        final actual = AmountFormat.flexibleDouble
            .format(Amount.fromDouble(1234.567, precision: 4));
        const expected = '1234.567';
        expect(actual, expected);
      });
      test('1234.567, Amount.precision 4, precision 2', () {
        final actual = AmountFormat.flexibleDouble
            .format(Amount.fromDouble(1234.567, precision: 4), 2);
        const expected = '1234.567';
        expect(actual, expected);
      });
      test('1234.567, Amount.precision 2, precision 4', () {
        final actual = AmountFormat.flexibleDouble
            .format(Amount.fromDouble(1234.567, precision: 2), 4);
        const expected = '1234.5700';
        expect(actual, expected);
      });
      test('precision -1', () {
        String actual() =>
            AmountFormat.flexibleDouble.format(Amount.fromNumerator(0), -1);
        final expected =
            throwsA(const TypeMatcher<NegativePrecisionException>());
        expect(actual, expected);
      });
    });
  });
}
