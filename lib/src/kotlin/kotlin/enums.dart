library kotlin.enums;

/// A specialized immutable implementation of [List] interface
/// that contains all enum entries of the specified enum type [E].
/// [EnumEntries] contains all enum entries in the order
/// they are declared in the source code,
/// consistently with the corresponding [Enum.ordinal] values.
///
/// An instance of this interface can be obtained
/// from [EnumClass.entries] property or with [enumEntries] function.
///
/// **Implementation note**:
///
/// All basic operations, such as `contains` and `indexOf`, are executed in constant time
/// and are likely to be faster than regular `ArrayList<E>` counterparts.
abstract class EnumEntries<E extends Enum> implements List<E> {}

/// Returns [EnumEntries] list containing all enum entries for the given enum type [E].
EnumEntries<E> enumEntries<E extends Enum>() => throw UnimplementedError();
