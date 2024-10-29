# mdamount

![Build](https://github.com/marchdev-tk/mdamount/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/marchdev-tk/mdamount/branch/master/graph/badge.svg)](https://codecov.io/gh/marchdev-tk/mdamount)
[![Pub](https://img.shields.io/pub/v/mdamount.svg)](https://pub.dartlang.org/packages/mdamount)
![GitHub](https://img.shields.io/github/license/marchdev-tk/mdamount)
![GitHub stars](https://img.shields.io/github/stars/marchdev-tk/mdamount?style=social)

march.dev amount library. Provides a new way to work with an amount. From highly flexible creation to rich data manipulation and stringification options.

## Getting Started

### Construction

To begin your work with a money object you need to create it, there are several ways to do it:

  * `Amount` with following args:
    * `BigInt` numerator
    * custom `precision`, if not provided or if negative precision was set - `Amount.defaultPrecision` will be used instead
  * `Amount.fromNumerator` with following args:
    * `int` numerator
    * custom `precision`, if not provided - `Amount.defaultPrecision` will be used instead
  * `Amount.fromBigInt` with following args:
    * `BigInt` amount
    * custom `precision`, if not provided - `Amount.defaultPrecision` will be used instead
  * `Amount.fromInt` with following args:
    * `int` amount
    * custom `precision`, if not provided - `Amount.defaultPrecision` will be used instead
  * `Amount.fromDecimal` with following args:
    * `Decimal` amount (from `decimal` package)
    * custom `precision`, if not provided - `Amount.defaultPrecision` will be used instead
  * `Amount.fromDouble` with following args:
    * `double` amount
    * custom `precision`, if not provided - `Amount.defaultPrecision` will be used instead
  * `Amount.fromString` with following args:
    * `Stirng`
    * custom `precision`, if not provided - `Amount.defaultPrecision` will be used instead

Also there are some convenient ways to create an object:

  * `Amount.zeroOf` to create the amount with `0` as numerator with custom `precision`
  * `Amount.oneOf` to create the amount with `1` as numerator with custom `precision`
  * `Amount.oneIntOf` to create the amount with `1` as integer with custom `precision`
  * `Amount.zero` to create the amount with `0` as numerator with default precision (`Amount.defaultPrecision`)
  * `Amount.one` to create the amount with `1` as numerator with default precision (`Amount.defaultPrecision`)
  * `Amount.oneInt` to create the amount with `1` as integer with default precision (`Amount.defaultPrecision`)

### Manipulation

First of all, `Amount` object is `comparable` and has all required operators:
  * unary `operator -`
  * binary `operator -`
  * `operator +`
  * `operator *`
  * `operator /`
  * `operator <`
  * `operator <=`
  * `operator >`
  * `operator >=`
  * `operator ==`

Regarding what you can do with this object, let's break down following methods/getters/fields:
  
  * `cents` - returns the `BigInt` `cents` representation of the amount 
  * `currency` - returns the `currency` of the amount
  * `precision` - returns the `precision` of the amount (quantity of digits in fractional part)
  * `sign` - returns the `sign` of the amount
  * `isEven` - whether the amount is `even` or not
  * `isOdd` - whether the amount is `odd` or not
  * `isNegative` - whether the amount is `negative` or not
  * `isPositive` - whether the amount is `positive` or not
  * `isZero` - whether the amount is equals to `zero` or not
  * `isGreaterThanZero` - whether the amount is greater than `zero` or not
  * `isGreaterThanOrEqualZero` - whether the amount is greater than or equals to `zero` or not
  * `isLessThanZero` - whether the amount is less than `zero` or not
  * `isLessThanOrEqualZero` - whether the amount is less than or equals to `zero` or not
  * `integer` - returns the `integer` part of the amount
  * `fractional` - returns the `fractional` part of the amount in `BigInt` cents
  * `fractionalDecimal` - returns the `fractional` part of the amount in `Decimal`
  * `fractionalDouble` - returns the `fractional` part of the amount in `double`
  * `toDecimal` - returns the amount in `Decimal`
  * `toDouble` - returns theamount in `double`
  * `abs` - returns the `absolute` (always positive) amount
  * `round` - returns the `rounded` amount
  * `ceil` - returns the `ceiled` amount (rounded to the next integer)
  * `floor` - returns the `floored` amount (truncating fractional part of the amount)
  * `toString` - return the `String` representation of the amount with lots of customisation options, they are:
    * `DecimalSeparatorFormat` - specifies which decimal separator to use:
      * `point`
      * `comma` 
    * `RankFormat` - specifies rank formatting:
      * `none` (`XXXX`)
      * `space` (`X XXX`)
    * `MoneyFormat` - specifies amount display formatting:
      * `integer` - only integer part (`XXXX`)
      * `flexibleDouble` - fractional parts will not display trailing zeros (`XXXX`/`XXXX.X`/`XXXX.XX`)
      * `fixedDouble` - fractional parts will display full precision, even zeros (`XXXX.XX`)

### Changing or accessing default precision

To access default precision use following static getter:
  * `Amount.defaultPrecision`

And for changing default precision use following static method:
  * `Amount.setDefaultPrecision(<new_precision>)`

But be cautious, precision cannot be less than zero.

## Examples

To see usage example navigate to the [Example](example/README.md) section.

## Feature requests and Bug reports

Feel free to post a feature requests or report a bug [here](https://github.com/marchdev-tk/mdamount/issues).
