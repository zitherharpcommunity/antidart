// ignore_for_file: non_constant_identifier_names

/// Provides the default generator of pseudo-random values,
/// the repeatable generator, and a base class for other RNG implementations.
library kotlin.random;

import 'dart:math' as math;

import '/src/kotlin/kotlin.dart';

abstract class Random {
  /// The default random number generator.
  ///
  /// On JVM this generator is thread-safe, its methods can be invoked from multiple threads.
  static math.Random get Default => math.Random.secure();
}

extension RandomExtension on math.Random {
  /// Creates a `java.util.Random` instance
  /// that uses the specified Kotlin [Random] generator as a randomness source.
  math.Random asJavaRandom() => Random.Default;

  /// Creates a Kotlin [Random] instance
  /// that uses the specified `java.util.Random` generator as a randomness source.
  math.Random asKotlinRandom() => Random.Default;

  /// Gets the next random [bitCount] number of bits.
  Int nextBits(Int bitCount) => this.nextInt(bitCount);

  /// Gets the next random [Boolean] value.
  Boolean nextBoolean() => nextBool();

  /// Fills a subrange of the specified byte array starting
  /// from [fromIndex] inclusive and ending [toIndex] exclusive with random bytes.
  ByteArray nextBytes(
    ByteArray array, {
    Int fromIndex = 0,
    Int toIndex = DEFAULT_BUFFER_SIZE,
  }) {
    return List.generate(
      toIndex - fromIndex,
      (index) => this.nextInt(index),
    );
  }

  /// Gets the next random Double from the random number generator in the specified range.
  Double nextDouble({
    Double from = 0,
    Double until = 1,
  }) {
    return this.nextDouble() * (until - from) + from;
  }

  /// Gets the next random [Float] value uniformly distributed between 0 (inclusive) and 1 (exclusive).
  Float nextFloat() => this.nextDouble();

  /// Gets the next random [Int] from the random number generator in the specified range.
  Int nextInt({
    Int from = -DEFAULT_BUFFER_SIZE,
    Int until = DEFAULT_BUFFER_SIZE,
  }) {
    return until - this.nextInt(until - from) + from;
  }

  /// Gets the next random [Long] from the random number generator in the specified range.
  Int nextLong({
    Long from = -DEFAULT_BUFFER_SIZE,
    Long until = DEFAULT_BUFFER_SIZE,
  }) {
    return until - this.nextInt(until - from) + from;
  }

  /// Gets the next random [UByte] from the random number generator.
  UByteArray nextUBytes(
    ByteArray array, {
    Int fromIndex = 0,
    Int toIndex = DEFAULT_BUFFER_SIZE,
  }) {
    return List.generate(
      toIndex - fromIndex,
      (index) => this.nextInt(index),
    );
  }

  /// Gets the next random [UInt] from the random number generator in the specified range.
  UInt nextUInt({
    UInt from = -DEFAULT_BUFFER_SIZE,
    UInt until = DEFAULT_BUFFER_SIZE,
  }) {
    return until - this.nextInt(until - from) + from;
  }

  /// Gets the next random [ULong] from the random number generator in the specified range.
  ULong nextULong({
    ULong from = -DEFAULT_BUFFER_SIZE,
    ULong until = DEFAULT_BUFFER_SIZE,
  }) {
    return until - this.nextInt(until - from) + from;
  }
}
