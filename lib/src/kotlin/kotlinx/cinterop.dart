library kotlinx.cinterop;

export 'cinterop/internal.dart';

/// C pointer.
class CPointer<T extends CPointed> {}

/// C data or code.
abstract class CPointed {}

/// The pointer with an opaque type.
typedef COpaquePointer = CPointer<CPointed>;

abstract interface class ObjCObject {}