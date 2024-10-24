import 'dart:math' as math;

import 'package:decimal/decimal.dart';
import 'package:meta/meta.dart';

import 'exceptions.dart';
import 'formats.dart';

/// Object that stores amount and provides methods to operate with this amount.
@immutable
class Amount implements Comparable<Amount> {
  /// Constructs an instance of the [Amount] from [BigInt] [value] and [int]
  /// [precision].
  ///
  /// Internal contructor.
  const Amount._(this.value, this.precision) : assert(precision >= 0);

  /// Constructs an instance of the [Amount] from [int] [numerator] and
  /// [precision].
  ///
  /// If [precision] was not explicitly set - [Amount.defaultPrecision] will be
  /// used instead.
  factory Amount.fromNumerator(
    int numerator, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? Amount.defaultPrecision;
    return Amount._(BigInt.from(numerator), adjustedPrecision);
  }

  /// Constructs an instance of the [Amount] from [BigInt] [amount] and
  /// [precision].
  ///
  /// If [precision] was not explicitly set - [Amount.defaultPrecision] will be
  /// used instead.
  factory Amount.fromBigInt(
    BigInt amount, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? Amount.defaultPrecision;
    final precisionModifier = _precisionModifier(adjustedPrecision);
    final value = amount * BigInt.from(precisionModifier);
    return Amount._(value, adjustedPrecision);
  }

  /// Constructs an instance of the [Amount] from [int] [amount] and
  /// [precision].
  ///
  /// If [precision] was not explicitly set - [Amount.defaultPrecision] will be
  /// used instead.
  factory Amount.fromInt(
    int amount, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? Amount.defaultPrecision;
    final precisionModifier = _precisionModifier(adjustedPrecision);
    final value = BigInt.from(amount) * BigInt.from(precisionModifier);
    return Amount._(value, adjustedPrecision);
  }

  /// Constructs an instance of the [Amount] from [Decimal] [amount] and
  /// [precision].
  ///
  /// If [precision] was not explicitly set - [Amount.defaultPrecision] will be
  /// used instead.
  factory Amount.fromDecimal(
    Decimal amount, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? Amount.defaultPrecision;
    final precisionModifier = _precisionModifier(adjustedPrecision);
    final value = (amount * Decimal.fromInt(precisionModifier)).round();
    return Amount._(value.toBigInt(), adjustedPrecision);
  }

  /// Constructs an instance of the [Amount] from [double] [amount] and
  /// [precision].
  ///
  /// If [precision] was not explicitly set - [Amount.defaultPrecision] will be
  /// used instead.
  factory Amount.fromDouble(
    double amount, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? Amount.defaultPrecision;
    final precisionModifier = _precisionModifier(adjustedPrecision);
    final value = (amount * precisionModifier).roundToDouble();

    if (value.isInfinite) {
      throw const InfiniteNumberException();
    }

    return Amount._(BigInt.from(value), adjustedPrecision);
  }

  /// Constructs an instance of the [Amount] from [String] amount and
  /// [precision].
  ///
  /// If [precision] was not explicitly set - [Amount.defaultPrecision] will be
  /// used instead.
  factory Amount.fromString(
    String amount, {
    int? precision,
  }) {
    if (precision != null && precision < 0) {
      throw const NegativePrecisionException();
    }

    final adjustedPrecision = precision ?? Amount.defaultPrecision;

    if (amount.isEmpty) {
      return Amount.zeroOf(adjustedPrecision);
    }

    final internalAmount = amount.replaceAll(' ', '').replaceAll(',', '.');
    final decimalAmount = Decimal.parse(internalAmount);

    return Amount.fromDecimal(
      decimalAmount,
      precision: adjustedPrecision,
    );
  }

  /// Zero amount with secific [precision].
  factory Amount.zeroOf(int precision) => Amount._(BigInt.zero, precision);

  /// One amount with secific [precision].
  factory Amount.oneOf(int precision) => Amount._(BigInt.one, precision);

  /// Zero amount with [Amount.defaultPrecision].
  static final zero = Amount.fromInt(0);

  /// One amount with [Amount.defaultPrecision].
  static final one = Amount.fromDouble(1);

  static int _precisionModifier(int precision) =>
      math.pow(10, precision).toInt();
  static int _defaultPrecision = 2;

  /// Returns the default precision, which could be changed via
  /// [setDefaultPrecision].
  ///
  /// Defaults to `2`.
  static int get defaultPrecision => _defaultPrecision;

  /// Sets default precision that will be used for all newly created instances
  /// of [Amount].
  static void setDefaultPrecision(int precision) =>
      _defaultPrecision = precision;

  /// Current amount as numerator.
  final BigInt value;

  /// Precision to use with this amount.
  ///
  /// *Please note* that precision cannot be negative, if so -
  /// [NegativePrecisionException] will be thrown.
  final int precision;

  /// Returns the sign of this amount.
  ///
  /// Returns 0 for zero, -1 for values less than zero and
  /// +1 for values greater than zero.
  int get sign => value.sign;

  /// Whether this amount is even.
  bool get isEven => value.isEven;

  /// Whether this amount is odd.
  bool get isOdd => value.isOdd;

  /// Whether this amount is negative.
  bool get isNegative => value.isNegative;

  /// Whether this amount is positive.
  bool get isPositive => !isNegative;

  /// Whether this amount is equals to zero or not.
  bool get isZero => this == Amount.zeroOf(precision);

  /// Whether this amount is greater than zero or not.
  bool get isGreaterThanZero => this > Amount.zeroOf(precision);

  /// Whether this amount is greater than or equals to zero or not.
  bool get isGreaterThanOrEqualZero => this >= Amount.zeroOf(precision);

  /// Whether this amount is less than zero or not.
  bool get isLessThanZero => this < Amount.zeroOf(precision);

  /// Whether this amount is less than or equals to zero or not.
  bool get isLessThanOrEqualZero => this <= Amount.zeroOf(precision);

  /// Gets integer part of the current amount.
  BigInt get integer => value ~/ BigInt.from(_precisionModifier(precision));

  /// Gets fractional part.
  ///
  /// Possible values starts with `0` and ends with maximum available value 
  /// of `precision of fraction`.
  BigInt get fractional {
    if (precision == 0) {
      return BigInt.zero;
    }

    if (value.isNegative) {
      return -(value.abs() % BigInt.from(_precisionModifier(precision)));
    }

    return value % BigInt.from(_precisionModifier(precision));
  }

  /// Gets fractional part as decimal value.
  ///
  /// Possible values starts with `0.0` and ends with maximum available value 
  /// of `0.<precision of fraction>`.
  Decimal get fractionalDecimal {
    if (precision == 0) {
      return Decimal.zero;
    }

    final precisionModifier = _precisionModifier(precision);
    return (Decimal.fromBigInt(fractional) / Decimal.fromInt(precisionModifier))
        .toDecimal();
  }

  /// Gets fractional part as double value.
  ///
  /// Possible values starts with `0.0` and ends with maximum available value 
  /// of `0.<precision of fraction>`.
  double get fractionalDouble => fractionalDecimal.toDouble();

  /// Gets decimal representation of the current amount.
  Decimal toDecimal() {
    final precisionModifier = _precisionModifier(precision);
    return (Decimal.fromBigInt(value) / Decimal.fromInt(precisionModifier))
        .toDecimal();
  }

  /// Gets double representation of the current amount.
  double toDouble() => toDecimal().toDouble();

  /// Returns the absolute value of this amount.
  Amount abs() {
    if (value.isNegative) {
      return Amount._(value.abs(), precision);
    }

    return this;
  }

  /// Returns the integer amount closest to the current amount.
  Amount round() {
    return Amount.fromDouble(
      toDouble().roundToDouble(),
      precision: precision,
    );
  }

  /// Returns the least amount that is not smaller than this amount.
  ///
  /// Rounds the amount towards infinity.
  Amount ceil() {
    if (fractional == BigInt.zero) {
      return this;
    }

    final addition = isPositive ? BigInt.one : BigInt.zero;

    return Amount._(
      (integer + addition) * BigInt.from(_precisionModifier(precision)),
      precision,
    );
  }

  /// Returns the greatest amount no greater than this amount.
  ///
  /// Rounds the amount towards negative infinity.
  Amount floor() {
    if (fractional == BigInt.zero) {
      return this;
    }

    final substraction = isPositive ? BigInt.zero : BigInt.one;

    return Amount._(
      (integer - substraction) * BigInt.from(_precisionModifier(precision)),
      precision,
    );
  }

  Amount operator -() => Amount._(-value, precision);
  Amount operator +(Amount other) =>
      Amount.fromDecimal(toDecimal() + other.toDecimal(), precision: precision);
  Amount operator -(Amount other) =>
      Amount.fromDecimal(toDecimal() - other.toDecimal(), precision: precision);

  Amount operator *(Amount multiplier) {
    final amount =
        Decimal.fromBigInt(value) * Decimal.parse(multiplier.toString());

    return Amount._(amount.round().toBigInt(), precision);
  }

  Amount operator /(Amount divider) {
    if (value == BigInt.zero && divider == Amount.zero) {
      throw const NotANumberException();
    }

    final amount =
        Decimal.fromBigInt(value) / Decimal.parse(divider.toString());

    return Amount._(amount.round(), precision);
  }

  bool operator <(Amount other) => toDecimal() < other.toDecimal();
  bool operator <=(Amount other) => toDecimal() <= other.toDecimal();
  bool operator >(Amount other) => toDecimal() > other.toDecimal();
  bool operator >=(Amount other) => toDecimal() >= other.toDecimal();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Amount &&
            runtimeType == other.runtimeType &&
            value == other.value &&
            precision == other.precision;
  }

  @override
  int get hashCode => value.hashCode ^ precision.hashCode;

  @override
  int compareTo(Amount other) {
    if (toDecimal() < other.toDecimal()) {
      return -1;
    } else if (toDecimal() > other.toDecimal()) {
      return 1;
    } else {
      return 0;
    }

    // ! Use this out-of-the-box solution when it will be fixed
    // ! Now it provides -110/110/0 results
    // return value.compareTo(other.value);
  }

  /// Gets formatted string representation of the current amount, based on the:
  /// - [AmountFormat];
  /// - [RankFormat];
  /// - [DecimalSeparatorFormat].
  ///
  /// Defaults are [AmountFormat.fixedDouble], [RankFormat.space] and
  /// [DecimalSeparatorFormat.point].
  @override
  String toString({
    AmountFormat amountFormat = AmountFormat.fixedDouble,
    RankFormat rankFormat = RankFormat.space,
    DecimalSeparatorFormat decimalSeparatorFormat =
        DecimalSeparatorFormat.point,
  }) {
    final amountFmt = decimalSeparatorFormat.format(
      rankFormat.format(
        amountFormat.format(this),
      ),
    );

    return amountFmt;
  }
}
