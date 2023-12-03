/// Experimental DSL for declaring custom function contracts.
library kotlin.contracts;

import 'package:antidart/kotlin.dart';

/// This marker distinguishes the experimental contract declaration API
/// and is used to opt-in for that feature when declaring contracts of user functions.
const experimentalContracts = ExperimentalContracts();

/// Specifies the contract of a function.
///
/// The contract description must be at the beginning of a function and have at least one effect.
///
/// Only the top-level functions can have a contract for now.
///
/// Parameter:
/// * [builder] - the lambda where the contract of a function
/// is described with the help of the [ContractBuilder] members.
@experimentalContracts
external fun contract(Unit Function(ContractBuilder) builder);

/// An effect of calling a functional parameter in place.
///
/// A function is said to call its functional parameter in place,
/// if the functional parameter is only invoked
/// while the execution has not been returned from the function,
/// and the functional parameter cannot be invoked after the function is completed.
///
/// See also:
/// * [ContractBuilder.callsInPlace]
@experimentalContracts
abstract interface class CallsInPlace extends Effect {}

/// An effect of some condition being true after observing another effect of a function.
///
/// This effect is specified in the `contract { }` block by attaching a boolean expression
/// to another [SimpleEffect] effect with the function [SimpleEffect.implies].
@experimentalContracts
abstract interface class ConditionalEffect extends Effect {}

/// Provides a scope, where the functions of the contract DSL, such as [returns], [callsInPlace], etc.,
/// can be used to describe the contract of a function.
///
/// This type is used as a receiver type of the lambda function passed to the [contract] function.
///
/// See also:
/// * [contract]
@experimentalContracts
abstract interface class ContractBuilder {
  /// Specifies that the function parameter [lambda] is invoked in place.
  ///
  /// This contract specifies that:
  /// 1. the function [lambda] can only be invoked during the call of the owner function,
  /// and it won't be invoked after that owner function call is completed.
  /// 2. _(optionally)_ the function lambda is invoked the number of times
  /// specified by the [kind] parameter, see the [InvocationKind] enum for possible values.
  ///
  /// A function declaring the [callsInPlace] effect must be `inline`.
  CallsInPlace callsInPlace<R>(
    R Function() lambda, {
    InvocationKind kind = InvocationKind.UNKNOWN,
  });

  /// Describes a situation when a function returns normally
  /// with the specified return [value]
  /// or without any exceptions thrown if [value] is `null`.
  ///
  /// The possible values of value are limited to `true`, `false` or `null`.
  ///
  /// Use [SimpleEffect.implies] function to describe a conditional effect that happens in such case.
  Returns returns({Any? value});

  /// Describes a situation when a function returns normally with any value that is not `null`.
  ///
  /// Use [SimpleEffect.implies] function to describe a conditional effect that happens in such case.
  ReturnsNotNull returnsNotNull();
}

/// Represents an effect of a function invocation, either directly observable,
/// such as the function returning normally, or a side-effect,
/// such as the function's lambda parameter being called in place.
///
/// The inheritors are used in [ContractBuilder] to describe the contract of a function.
///
/// See also:
/// * [ConditionalEffect]
/// * [SimpleEffect]
/// * [CallsInPlace]
@experimentalContracts
abstract interface class Effect {}

/// This marker distinguishes the experimental contract declaration API
/// and is used to opt-in for that feature when declaring contracts of user functions.
final class ExperimentalContracts {
  const ExperimentalContracts();
}

/// Specifies how many times a function invokes its function parameter in place.
///
/// See [ContractBuilder.callsInPlace] for the details of the call-in-place function contract.
@experimentalContracts
enum InvocationKind {
  /// A function parameter will be invoked one time or not invoked at all.
  AT_MOST_ONCE,

  /// A function parameter will be invoked one or more times.
  AT_LEAST_ONCE,

  /// A function parameter will be invoked exactly one time.
  EXACTLY_ONCE,

  /// A function parameter is called in place, but it's unknown how many times it can be called.
  UNKNOWN,
}

/// Describes a situation when a function returns normally with a given return value.
///
/// See also:
/// * [ContractBuilder.returns]
@experimentalContracts
abstract interface class Returns extends SimpleEffect {}

/// Describes a situation when a function returns normally with any non-null return value.
///
/// See also:
/// * [ContractBuilder.returnsNotNull]
@experimentalContracts
abstract interface class ReturnsNotNull extends SimpleEffect {}

/// An effect that can be observed after a function invocation.
///
/// See also:
/// * [ContractBuilder.returns]
/// * [ContractBuilder.returnsNotNull]
@experimentalContracts
abstract interface class SimpleEffect {
  /// Specifies that this effect, when observed, guarantees [booleanExpression] to be true.
  ///
  /// Note: [booleanExpression] can accept only a subset of boolean expressions,
  /// where a function parameter or receiver (`this`) undergoes:
  /// * true of false checks, in case if the parameter or receiver is Boolean;
  /// * null-checks (`== null`, `!= null`);
  /// * instance-checks (`is`, `!is`);
  /// * a combination of the above with the help of logic operators (`&&`, `||`, `!`).
  ConditionalEffect implies(Boolean booleanExpression);
}
