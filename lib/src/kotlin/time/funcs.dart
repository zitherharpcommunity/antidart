part of kotlin.time;

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

extension DurationTimeFuncs on Duration {
  /// Converts `kotlin.time.Duration` value to `java.time.Duration` value.
  Duration toJavaDuration() => this;

  /// Converts `java.time.Duration` value to `kotlin.time.Duration` value.
  Duration toKotlinDuration() => this;
}

extension NumTimeFuncs on num {
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

extension UnitTimeFuncs on DurationUnit {
  /// Converts this `kotlin.time.DurationUnit` enum value
  /// to the corresponding `java.util.concurrent.TimeUnit` value.
  TimeUnit toTimeUnit() => this;

  /// Converts this `java.util.concurrent.TimeUnit` enum value
  /// to the corresponding `kotlin.time.DurationUnit` value.
  DurationUnit toDurationUnit() => this;
}
