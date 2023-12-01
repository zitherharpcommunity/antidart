/// Provides the default generator of pseudo-random values,
/// the repeatable generator, and a base class for other RNG implementations.
library kotlin.random;

import 'dart:math';

import 'package:antidart/src/kotlin/core.dart';

/// An abstract class that is implemented by random number generator algorithms.
extension RandomUtils on Random {
  /// Creates a `java.util.Random` instance
  /// that uses the specified Kotlin [Random] generator as a randomness source.
  Random asJavaRandom() => Random(nextInt(256));

  /// Creates a Kotlin [Random] instance
  /// that uses the specified `java.util.Random` generator as a randomness source.
  Random asKotlinRandom() => Random(nextInt(256));

  /// Gets the next random [Long] from the random number generator in the specified [range].
  Long nextLong(int range) => nextInt(range);

  /// Gets the next random [UInt] from the random number generator.
  UInt nextUInt(int range) => nextInt(range);

  /// Gets the next random [UByte] from the random number generator.
  UByte nextUBytes(int range) => nextInt(range);

  /// Gets the next random [ULong] from the random number generator.
  ULong nextULong(int range) => nextInt(range);
}
