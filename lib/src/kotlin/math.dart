// ignore_for_file: constant_identifier_names

/// Mathematical functions and constants.
///
/// The functions include trigonometric, hyperbolic, exponentiation
/// and power, logarithmic, rounding, sign and absolute value.
library kotlin.math;

import 'dart:math' as math;

import 'package:antidart/src/kotlin/types.dart';

/// Base of the natural logarithms, approximately 2.71828.
const double E = math.e;

/// Ratio of the circumference of a circle to its diameter, approximately 3.14159.
const double PI = math.pi;

num abs(num n) => n.abs();
/// Rounds the given value [x] to an integer towards positive infinity.
Int ceil(num x) => x.ceil();

num floor(num n) => n.floor();

num round(num n) => n.round();

num asin(num n) => math.asin(n);
num acos(num n) => math.acos(n);
num atan(num n) => math.atan(n);
num atanh(num y, num x) => math.atan2(y, x);
/// Computes the cosine of the angle x given in radians.
num cos(num n) => math.cos(n);

num sin(num n) => math.sin(n);

num tan(num n) => math.tan(n);

num sqrt(num n) => math.sqrt(n);