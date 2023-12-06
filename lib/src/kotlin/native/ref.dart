library kotlin.native.ref;

import '/src/kotlin.dart';

/// Creates a [Cleaner] object that runs [cleanupAction] with given [resource] some time after its deallocation.
///
/// Example of usage:
/// ```kotlin
/// class ResourceWrapper {
///   private val resource = Resource()
///
///   private val cleaner = createCleaner(resource) { it.dispose() }
/// }
/// ```
/// When [ResourceWrapper] becomes unused and gets deallocated,
/// its cleaner is also deallocated, and the resource is disposed later.
///
/// It is not specified which thread runs [cleanupAction], as well as whether two
/// or more cleanup actions from different cleaners can be run in parallel.
///
/// **Note: if resource refers (directly or indirectly) the cleaner,
/// then both might leak, and the [cleanupAction] will not be called in this case.**
///
/// For example, the code below has a leak:
/// ```kotlin
/// class LeakingResourceWrapper {
///   private val resource = Resource()
///   private val cleaner = createCleaner(this) { it.resource.dispose() }
/// }
/// ```
/// In this case cleaner's argument [LeakingResourceWrapper] can't be deallocated
/// until cleanupAction `(it.resource.dispose())` is executed,
/// which can happen only strictly after the cleaner is deallocated,
/// which can't happen until [LeakingResourceWrapper] is deallocated.
///
/// So the requirements on object deallocations are contradictory in this case,
/// which can't be handled gracefully.
///
/// The cleanup action is not executed then,
/// and cleaner and its argument might leak (depending on the implementation).
///
/// The same problem occures when [cleanupAction] captures a value
/// that refers (directly or indirectly) the cleaner:
/// ```kotlin
/// class LeakingResourceWrapper {
///   private val cleaner = createCleaner(...) {
///     doSomething()
///     ...
///   }
///
///   private fun doSomething() {
///     ...
///   }
/// }
/// ```
/// In the example above the cleanup lambda implicitly 
/// captures this object to call `doSomething()`.
///
/// [cleanupAction] should not use `@ThreadLocal` globals, 
/// because it may be executed on a different thread.
///
/// If [cleanupAction] throws an exception, the behavior is unspecified.
///
/// Cleaners cannot be used to perform actions during the program shutdown:
///
/// cleaners that are referenced from globals will not be garbage collected at all,
/// cleaners that become unreferenced just before exiting `main()` might not be garbage collected,
/// because the GC might not get a chance to run.
///
/// Parameters:
/// * [resource] - an object for which to perform cleanupAction
///
/// * [cleanupAction] - a cleanup to perform on resource. Must not capture anything.
external Cleaner createCleaner<T>(
  T resource,
  Unit Function(T resource) cleanupAction,
);

/// The marker interface for objects that have a cleanup action associated with them.
///
/// Use [createCleaner] to create an instance of this type.
@experimentalNativeApi
abstract final class Cleaner {}

/// Class [WeakReference] encapsulates weak reference to an object,
/// which could be used to either retrieve a strong reference to an object,
/// or return `null`, if object was already destroyed by the memory manager.
@experimentalNativeApi
class WeekReference<T extends Any> {
  /// Backing store for the object pointer, inaccessible directly.
  T? _pointer;

  /// Creates a weak reference object pointing to an object.
  ///
  /// Weak reference doesn't prevent removing object, 
  /// and is nullified once object is collected.
  WeekReference(T referred) {
    _pointer = referred;
  }

  /// Returns either reference to an object or null, if it was collected.
  T? get value => _pointer;

  /// Clears reference to an object.
  fun clear() => _pointer = null;

  /// Returns either reference to an object or null, if it was collected.
  T? get() => value;
}
