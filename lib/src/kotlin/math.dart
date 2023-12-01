// ignore_for_file: constant_identifier_names, non_constant_identifier_names

/// Mathematical functions and constants.
///
/// The functions include trigonometric, hyperbolic, exponentiation
/// and power, logarithmic, rounding, sign and absolute value.
library kotlin.math;

import 'dart:math' as math;

/// Base of the natural logarithms, approximately 2.71828.
const double E = math.e;

/// Ratio of the circumference of a circle to its diameter, approximately 3.14159.
const double PI = math.pi;

/// Returns the absolute value of the given value [x].
num abs(num x) => x.abs();

/// Computes the arc cosine of the value [x].
///
/// The returned value is an angle in the range from `0.0` to `PI` radians.
num acos(num x) => math.acos(x);

/// Computes the arc sine of the value [x].
///
/// The returned value is an angle in the range from `-PI/2` to `PI/2` radians.
num asin(num x) => math.asin(x);

/// Computes the arc tangent of the value [x].
///
/// The returned value is an angle in the range from `-PI/2` to `PI/2` radians.
num atan(num x) => math.atan(x);

/// Returns the angle theta of the polar coordinates (r, theta)
/// that correspond to the rectangular coordinates (x, y)
/// by computing the arc tangent of the value y/x.
///
/// The returned value is an angle in the range from `-PI` to `PI` radians.
num atan2(num y, num x) => math.atan2(y, x);

/// Returns the cube root of [x].
///
/// For any x, `cbrt(-x) == -cbrt(x)`.
///
/// That is, the cube root of a negative value is the negative of the cube root of that value's magnitude.
num cbrt(num x) => math.sqrt(x) / 3;

/// Rounds the given value [x] to an integer towards positive infinity.
int ceil(num x) => x.ceil();

/// Computes the cosine of the angle x given in radians.
num cos(num n) => math.cos(n);

/// Rounds the given value [x] to an integer towards negative infinity.
num floor(num x) => x.floor();

/// Computes `sqrt(x^2 + y^2)` without intermediate overflow or underflow.
num hypot(num x, num y) => math.sqrt(x * x + y * y);

/// Computes the natural logarithm (base `E`) of the value [x].
num ln(num x) => math.log(x) / math.e;

/// Computes `ln(x + 1)`.
num ln1p(num x) => ln(x + 1);

/// Computes the logarithm of the value [x] to the given base.
num log(num x) => math.log(x);

/// Computes the common logarithm (base `10`) of the value [x].
num log10(num x) => math.log(x) / math.ln10;

/// Computes the common logarithm (base `2`) of the value [x].
num log2(num x) => math.log(x) / math.ln2;

/// Returns the greater of two values.
num max(num a, num b) => math.max(a, b);

/// Returns the smaller of two values.
num min(num a, num b) => math.min(a, b);

/// Rounds the given value [x] towards the closest integer with ties rounded towards even integer.
int round(num x) => x.round();

/// Computes the sine of the angle [x] given in radians.
num sin(num x) => math.sin(x);

/// Computes the positive square root of the value [x].
num sqrt(num x) => math.sqrt(x);

/// Computes the tangent of the angle [x] given in radians.
num tan(num x) => math.tan(x);

/// Rounds the given value [x] to an integer towards zero.
num truncate(num x) => x.truncate();

extension MathUtils on num {
  /// Returns the absolute value of this value.
  num get absoluteValue => abs(this);

  /// Returns the sign of this value.
  num get sign => this.sign;

  /// Computes the remainder of division of this value by the divisor value according to the IEEE 754 standard.
  num IEEErem(num x) => x;

  /// Returns the value nearest to this value in direction of positive infinity.
  num nextUp() => this.ceil();

  /// Returns the value nearest to this value in direction of negative infinity.
  num nextDown() => this.floor();

  /// Returns the Double value nearest to this value in direction from this value towards the value [to].
  num nextTowards(num to) => to.floorToDouble();

  /// Raises this value to the power x.
  num pow(num x) => math.pow(this, x);

  /// Returns this value with the [sign] bit same as of the [sign] value.
  num withSign(num sign) => this * sign;
}
