part of kotlin.time;

extension TimeProps on num {
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
}
