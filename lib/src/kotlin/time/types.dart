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
