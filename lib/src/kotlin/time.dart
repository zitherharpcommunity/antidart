// ignore_for_file: deprecated_member_use_from_same_package

/// API for measuring time intervals and calculating durations.
///
/// For more information, see our [Time measurement](https://kotlinlang.org/docs/time-measurement.html) guide.
library kotlin.time;

import '/src/kotlin.dart';

/// This annotation marks the experimental preview of the standard library API
/// for measuring time and working with durations.
const experimentalTime = ExperimentalTime();

/// Executes the given function [block] and returns the duration of elapsed time interval.
Duration measureTime(Unit Function() block) {
  final start = DateTime.now();
  block();
  return DateTime.now().difference(start);
}

/// Executes the given function block and returns an instance of [TimedValue] class,
/// containing both the result of the function execution and the duration of elapsed time interval.
TimedValue<T> measureTimedValue<T>(T Function() block) {
  final start = DateTime.now();
  final value = block();
  return (DateTime.now().difference(start), value);
}

/// Data class representing a result of executing an action,
/// along with the duration of elapsed time interval.
typedef TimedValue<T> = (Duration, T);

typedef TimeUnit = DurationUnit;

/// The list of possible time measurement units, in which a duration can be expressed.
///
/// The smallest time unit is [NANOSECONDS] and the largest is [DAYS],
/// which corresponds to exactly 24 [HOURS].
enum DurationUnit {
  /// Time unit representing one day, which is always equal to 24 hours.
  DAYS,

  /// Time unit representing one hour.
  HOURS,

  /// Time unit representing one minute.
  MINUTES,

  /// Time unit representing one second.
  SECONDS,

  /// Time unit representing one millisecond, which is 1/1000 of a second.
  MILLISECONDS,

  /// Time unit representing one microsecond, which is 1/1000 of a millisecond.
  MICROSECONDS,

  /// Time unit representing one nanosecond, which is 1/1000 of a microsecond.
  NANOSECONDS;
}

/// This annotation marks the experimental preview of the standard library API
/// for measuring time and working with durations.
///
/// Note that this API is in a preview state
/// and has a very high chance of being changed in the future.
///
/// Do not use it if you develop a library
/// since your library will become binary incompatible
/// with the future versions of the standard library.
@Target([
  AnnotationTarget.CLASS,
  AnnotationTarget.ANNOTATION_CLASS,
  AnnotationTarget.PROPERTY,
  AnnotationTarget.FIELD,
  AnnotationTarget.LOCAL_VARIABLE,
  AnnotationTarget.VALUE_PARAMETER,
  AnnotationTarget.CONSTRUCTOR,
  AnnotationTarget.FUNCTION,
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
  AnnotationTarget.TYPEALIAS,
])
final class ExperimentalTime {
  const ExperimentalTime();
}

extension DurationExtension on Duration {
  /// Converts `kotlin.time.Duration` value to `java.time.Duration` value.
  Duration toJavaDuration() => this;

  /// Converts `java.time.Duration` value to `kotlin.time.Duration` value.
  Duration toKotlinDuration() => this;
}

extension DurationUnitExtension on DurationUnit {
  /// Converts this `java.util.concurrent.TimeUnit` enum value
  /// to the corresponding `kotlin.time.DurationUnit` value.
  DurationUnit toDurationUnit() => this;

  /// Converts this `kotlin.time.DurationUnit` enum value
  /// to the corresponding `java.util.concurrent.TimeUnit` value.
  TimeUnit toTimeUnit() => this;
}

extension NumberExtension on Number {
  /// Returns a [Duration] equal to this number of days.
  @Deprecated(
    'Use num.days extension property from Duration.Companion instead.',
  )
  Duration get days => Duration(days: toInt());

  /// Returns a [Duration] equal to this number of hours.
  @Deprecated(
    'Use num.hours extension property from Duration.Companion instead.',
  )
  Duration get hours => Duration(hours: toInt());

  /// Returns a [Duration] equal to this number of microseconds.
  @Deprecated(
    'Use num.microseconds extension property from Duration.Companion instead.',
  )
  Duration get microseconds => Duration(microseconds: toInt());

  /// Returns a [Duration] equal to this number of milliseconds.
  @Deprecated(
    'Use num.milliseconds extension property from Duration.Companion instead.',
  )
  Duration get milliseconds => Duration(milliseconds: toInt());

  /// Returns a [Duration] equal to this number of minutes.
  @Deprecated(
    'Use num.minutes extension property from Duration.Companion instead.',
  )
  Duration get minutes => Duration(minutes: toInt());

  /// Returns a [Duration] equal to this number of seconds.
  @Deprecated(
    'Use num.nanoseconds extension property from Duration.Companion instead.',
  )
  Duration get nanoseconds => microseconds ~/ 1000;

  /// Returns a [Duration] equal to this number of seconds.
  @Deprecated(
    'Use num.seconds extension property from Duration.Companion instead.',
  )
  Duration get seconds => Duration(seconds: toInt());

  /// Returns a duration whose value is the specified [duration] value multiplied by this number.
  Duration times({required Duration duration}) {
    return Duration(
      seconds: (this * duration.inSeconds).toInt(),
    );
  }

  /// Returns a [Duration] equal to this number of the specified [unit].
  Duration toDuration({required DurationUnit unit}) {
    return switch (unit) {
      DurationUnit.DAYS => days,
      DurationUnit.HOURS => hours,
      DurationUnit.MINUTES => minutes,
      DurationUnit.SECONDS => seconds,
      DurationUnit.MILLISECONDS => milliseconds,
      DurationUnit.MICROSECONDS => microseconds,
      DurationUnit.NANOSECONDS => nanoseconds,
    };
  }
}
