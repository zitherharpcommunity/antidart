library org.w3c.dom.events;

class Event {
  final String type;

  const Event({required this.type});
}

abstract class EventTarget {
  const EventTarget();
}

class MouseEvent {}

abstract interface class MouseEventInit {}
