// Copyright (c) 2025, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math' as math;

import 'package:mdamount/mdamount.dart';

final _doubleRegex = RegExp(r'^(-?)(0|([1-9][0-9]*))(\.[0-9]{1,})?$');
final _doubleRankedRegex = RegExp(r'^(-?)(0|([1-9][0-9 ]*))(\.[0-9]{1,})?$');

abstract interface class AmountFormatterInteface<T> {
  String format(T value);
}

/// Describes possible decimal separator formats.
enum DecimalSeparatorFormat implements AmountFormatterInteface<String> {
  /// Decimal point.
  point,

  /// Decimal comma.
  comma;

  /// Formats given [amount] per current decimal separator format.
  ///
  /// **Please note**: [amount] string should be normalized, which means that
  /// this string must:
  ///
  /// * contain only numbers and rank symbol
  /// * decimal separator must be `.`
  @override
  String format(String amount) {
    if (!_doubleRankedRegex.hasMatch(amount)) {
      throw ArgumentError.value(
        amount,
        'amount',
        'Must contain only money amount style string, '
            'for instanse: "123.45"/"321.4"/"456"',
      );
    }

    switch (this) {
      case point:
        return amount;
      case comma:
        return amount.replaceAll('.', ',');
    }
  }
}

/// Describes possible rank formatting options.
enum RankFormat implements AmountFormatterInteface<String> {
  /// Amount will not be formatted.
  none,

  /// Amount will be divided into chunks, within each chunk will be 3 digits
  /// max. Each chunk will be separated by space char.
  space;

  /// Formats given [amount] per current ranking format.
  ///
  /// **Please note**: [amount] string should be normalized, which means that
  /// this string must:
  ///
  /// * contain only numbers
  /// * decimal separator must be `.`
  @override
  String format(String amount) {
    if (!_doubleRegex.hasMatch(amount)) {
      throw ArgumentError.value(
        amount,
        'amount',
        'Must contain only money amount style string, '
            'for instanse: "123.45"/"321.4"/"456"',
      );
    }

    switch (this) {
      case none:
        return amount;
      case space:
        final indexOfPoint = amount.indexOf('.');
        final hasMinusSign = amount.startsWith('-');
        final integer = amount
            .substring(
              hasMinusSign ? 1 : 0,
              indexOfPoint == -1 ? null : indexOfPoint,
            )
            .runes
            .toList();

        if (integer.length <= 3) {
          return amount;
        }

        final integerLength = integer.length;
        for (var i = 3, counter = 0; i < integerLength; i++) {
          if (i % 3 == 0) {
            integer.insert(
              integer.length - i - counter,
              ' '.codeUnits.single,
            );
            counter++;
          }
        }
        var fractional = '';
        if (amount.contains('.')) {
          fractional = amount.substring(indexOfPoint);
        }
        var sign = '';
        if (hasMinusSign) {
          sign = '-';
        }

        return '$sign${String.fromCharCodes(integer)}$fractional';
    }
  }
}

/// Describes possible [Amount] formatting options.
enum AmountFormat implements AmountFormatterInteface<Amount> {
  /// [Amount] value will be formatted as an integer truncating any fractional
  /// parts.
  ///
  /// For instance: `XXXX`.
  integer,

  /// [Amount] value will be formatted depending on the presence of the
  /// fractional part. If fractional part contains only one digit, it will be
  /// formatted as a single fractional digit.
  ///
  /// For instance: `XXXX`/`XXXX.X`/`XXXX.XX`.
  flexibleDouble,

  /// [Amount] value will be formatted as a double value with fixed 2 digits
  /// after the decimal point, no matter whether this value has a fractional
  /// part or not.
  ///
  /// For instance: `XXXX.XX`.
  fixedDouble;

  /// Formats [Amount].
  ///
  /// If [precision] is set, this method will behave differently based on
  /// [AmountFormat]:
  /// - [AmountFormat.integer] - [precision] is omitted;
  /// - [AmountFormat.fixedDouble] - [precision] will be used as an override to
  /// [value.precision];
  /// - [AmountFormat.flexibleDouble] - [precision] will be used only if length
  /// of fractionals will be less than [precision].
  @override
  String format(Amount value, [int? precision]) {
    switch (this) {
      case integer:
        return value.round().integer.toString();
      case flexibleDouble:
        if (precision != null && precision < 0) {
          throw const NegativePrecisionException();
        }

        if (precision != null) {
          final fractionLength = value.fractionalDecimal
              .toString()
              .replaceAll('-', '')
              .replaceFirst('0.', '')
              .length;
          final adjustedPrecision = math.max(precision, fractionLength);
          return value.toDecimal().toStringAsFixed(adjustedPrecision);
        } else if (value.fractional == BigInt.zero) {
          return value.integer.toString();
        } else {
          return value.toDecimal().toString();
        }
      case fixedDouble:
        final adjustedPrecision = precision ?? value.precision;

        if (adjustedPrecision < 0) {
          throw const NegativePrecisionException();
        }

        return value.toDecimal().toStringAsFixed(adjustedPrecision);
    }
  }
}
