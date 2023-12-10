// ignore_for_file: non_constant_identifier_names

library org.w3c.dom.events;

import '/src/kotlin/kotlin.dart';

class Event {
  final String type;

  const Event({required this.type});

  external static Short get AT_TARGET;

  external static Short get BUBBLING_PHASE;

  external static Short get CAPTURING_PHASE;

  external static Short get NONE;
}

abstract class EventTarget {
  const EventTarget();
}

class MessageEvent {}

class MouseEvent {}

abstract interface class MouseEventInit {}
