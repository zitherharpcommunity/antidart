// ignore_for_file: non_constant_identifier_names

library kotlinx.cinterop.internal;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/kotlin.dart' as kt;
import '/src/kotlin/kotlinx/cinterop.dart';

/// Detaches the Objective-C object from this Kotlin wrapper.
///
/// More specifically, releases the Obj-C reference and zeroes the field where it is stored.
///
/// This doesn't affect other possible Kotlin wrappers of this Objective-C object.
///
/// Typically, when an Objective-C object gets into Kotlin,
/// a new Kotlin wrapper is created,
/// even if there is another wrapper already exists.
///
/// To get the Objective-C object actually deallocated, each Kotlin wrapper
/// should first be either GCed or detached with this function.
///
/// If you use this object (Kotlin wrapper) after calling this function,
/// the program behavior is undefined. In particular, it can crash.
external fun detachObjCObject(ObjCObject obj);

@Target([
  AnnotationTarget.PROPERTY_GETTER,
])
final class ArrayMemberAt {
  final Long offset;

  const ArrayMemberAt(this.offset);
}

@Target([
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
])
final class BitField {
  final Long offset;
  final Int size;

  const BitField(this.offset, this.size);
}

@Target([
  AnnotationTarget.FUNCTION,
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
])
final class CCall {
  final String id;

  const CCall(this.id);

  @Target([
    AnnotationTarget.VALUE_PARAMETER,
  ])
  const CCall.Consumed() : this('Consumed');

  @Target([
    AnnotationTarget.FUNCTION,
    AnnotationTarget.PROPERTY_GETTER,
    AnnotationTarget.PROPERTY_SETTER,
  ])
  const CCall.ConsumesReceiver() : this('ConsumesReceiver');

  @Target([
    AnnotationTarget.CONSTRUCTOR,
  ])
  const CCall.CppClassConstructor() : this('CppClassConstructor');

  @Target([
    AnnotationTarget.VALUE_PARAMETER,
  ])
  const CCall.CString() : this('CString');

  @Target([
    AnnotationTarget.FUNCTION,
    AnnotationTarget.PROPERTY_GETTER,
    AnnotationTarget.PROPERTY_SETTER,
  ])
  const CCall.ReturnsRetained() : this('ReturnsRetained');

  @Target([
    AnnotationTarget.VALUE_PARAMETER,
  ])
  const CCall.WCString() : this('WCString');
}

@Target([
  AnnotationTarget.CLASS,
])
final class CEnumEntryAlias {
  final String entryName;

  const CEnumEntryAlias(this.entryName);
}

/// Stores instance size of the type T: [CEnumVar].
@Target([
  AnnotationTarget.CLASS,
])
final class CEnumVarTypeSize {
  final Int size;

  const CEnumVarTypeSize(this.size);
}

/// Collection of annotations that allow to store constant values.
sealed class ConstantValue {
  const ConstantValue.Byte(kt.Byte value);

  const ConstantValue.Double(kt.Double value);

  const ConstantValue.Float(kt.Float value);

  const ConstantValue.Int(kt.Int value);

  const ConstantValue.Short(kt.Short value);

  const ConstantValue.String(String value);

  const ConstantValue.UByte(kt.UByte value);

  const ConstantValue.UInt(kt.UInt value);

  const ConstantValue.ULong(kt.ULong value);

  const ConstantValue.UShort(kt.UShort value);
}

@Target([AnnotationTarget.CLASS])
final class CPlusPlusClass {
  const CPlusPlusClass();
}

@Target([
  AnnotationTarget.CLASS,
])
final class CStruct {
  final String spelling;

  const CStruct(this.spelling);
}

@Target([
  AnnotationTarget.CLASS,
])
final class ManagedType {
  const ManagedType();
}

@Target([
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
])
final class MemberAt {
  final Long offset;

  const MemberAt(this.offset);
}

final class VarType {
  final Int align;
  final Long size;

  const VarType(this.size, this.align);
}
