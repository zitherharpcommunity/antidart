library kotlin.native.concurrent;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/kotlinx/cinterop.dart';

/// Marks all [Worker]-related API as obsolete.
const obsoleteWorkersApi = ObsoleteWorkersApi();

/// Note: this annotation has effect only in Kotlin/Native with legacy memory manager.
@Deprecated('This annotation is redundant and has no effect')
const sharedImmutable = SharedImmutable();

/// Marks a top level property with a backing field or an object as thread local.
///
/// The object remains mutable and it is possible to change its state,
/// but every thread will have a distinct copy of this object,
/// so changes in one thread are not reflected in another.
const threadLocal = ThreadLocal();

/// Atomic lazy initializer, could be used in frozen objects,
/// freezes initializing lambda, so use very carefully.
///
/// Also, as with other uses of an [AtomicReference] may potentially leak memory,
/// so it is recommended to use [atomicLazy] in cases of objects living forever,
/// such as object singletons, or in cases where it's guaranteed not to have cyclical garbage.
external Lazy<T> atomicLazy<T>(T Function() initializer);

@Deprecated('Use waitForMultipleFutures top-level function instead')
external Set<Future<T>> waitForMultipleFutures<T>(Int millis);

external fun waitWorkerTermination(Worker worker);

/// Executes [block] with new [Worker] as resource, by starting the new worker,
/// calling provided [block] (in current context) with newly started worker as `this`
/// and terminating worker after the block completes.
///
/// Note that this operation is pretty heavyweight,
/// use preconfigured worker or worker pool if need to execute it frequently.
///
/// **Parameters**:
/// * [name] - of the started worker.
///
/// * [errorReporting] - controls if uncaught errors in worker to be reported.
///
/// * [block] - to be executed.
///
/// **Return** value returned by the block.
external R withWorker<R>({
  String? name,
  Boolean errorReporting = true,
  required R Function() block,
});

/// Detached object graph encapsulates transferrable detached subgraph
/// which cannot be accessed externally,
/// until it is attached with the attach extension function.
class DetachedObjectGraph<T> {
  final TransferMode? mode;
  final T Function()? producer;
  final COpaquePointer? pointer;

  /// Restores detached object graph from the value stored earlier in a C raw pointer.
  factory DetachedObjectGraph.fromPointer(COpaquePointer? pointer) {
    return DetachedObjectGraph._(
      pointer: pointer,
    );
  }

  /// Creates stable pointer to object, ensuring associated object subgraph
  /// is disjoint in specified mode ([TransferMode.SAFE] by default).
  ///
  /// Raw value returned by [asCPointer] could be stored to a C variable
  /// or passed to another Kotlin machine.
  factory DetachedObjectGraph.fromProducer({
    TransferMode mode = TransferMode.SAFE,
    required T Function() producer,
  }) {
    return DetachedObjectGraph._(
      mode: mode,
      producer: producer,
    );
  }

  const DetachedObjectGraph._({
    this.mode,
    this.producer,
    this.pointer,
  });

  /// Returns raw C pointer value, usable for interoperability with C scenarious.
  external COpaquePointer? asCPointer();
}

/// Exception thrown whenever freezing is not possible.
class FreezingException extends RuntimeException {
  /// An object intended to be frozen.
  final Any toFreeze;

  /// An object preventing freezing, usually one marked with [ensureNeverFrozen] earlier.
  final Any blocker;

  /// Exception thrown whenever freezing is not possible.
  const FreezingException({
    required this.toFreeze,
    required this.blocker,
  });
}

class Future<T> {
  external Int get id;

  /// A [FutureState] of this future
  external FutureState get state;

  /// The result of the future computation.
  ///
  /// Blocks execution until the future is ready.
  ///
  /// Second attempt to get will result in an error.
  external T get value;

  /// Blocks execution until the future is ready.
  external R consume<R>(R Function(T) code);

  /// Returns a string representation of the object.
  @override
  external String toString();
}

@obsoleteWorkersApi
enum FutureState {
  INVALID(0),

  /// Future is scheduled for execution.
  SCHEDULED(1),

  /// Future result is computed.
  COMPUTED(2),

  /// Future is cancelled.
  CANCELLED(3),

  /// Computation thrown an exception.
  THROWN(4);

  final Int value;

  const FutureState(this.value);
}

/// Exception thrown whenever we attempt to mutate frozen objects.
class InvalidMutabilityException extends RuntimeException {
  /// Exception thrown whenever we attempt to mutate frozen objects.
  const InvalidMutabilityException({super.message});
}

/// Mutable concurrently accessible data buffer.
///
/// Could be accessed from several workers simultaneously.
class MutableData {
  final Int _capacity;

  MutableData([this._capacity = 16]);

  /// Current data size, may concurrently change later on.
  Int get size => _capacity;

  /// Get a byte from the mutable data.
  Byte operator [](Int index) => index;

  /// Appends byte array to the buffer.
  external fun appendByteArray(
    ByteArray data, {
    Int fromIndex = 0,
    Int toIndex = 16,
  });

  /// Appends C data to the buffer, if [data] is null or [count] is non-positive - return.
  external fun appendCData(COpaquePointer? data, Int count);

  /// Appends data to the buffer.
  external fun appendData(MutableData data);

  /// Copies range of mutable data to the byte array.
  external fun copyInto({
    required ByteArray output,
    required Int destinationIndex,
    required Int startIndex,
    required Int endIndex,
  });

  /// Reset the data buffer, makings its size 0.
  external fun reset();

  /// Executes provided block under lock with the raw data buffer.
  ///
  /// Block is executed under the spinlock, and must be short.
  external R withBufferLocked<R>(
    R Function(ByteArray array, Int dataSize) block,
  );

  /// Executes provided block under lock with raw pointer to the data stored in the buffer.
  ///
  /// Block is executed under the spinlock, and must be short.
  external R withPointerLocked<R>(
    R Function(COpaquePointer, Int dataSize) block,
  );
}

/// Marks all Worker-related API as obsolete.
///
/// Workers are considered **obsolete**: their API shape, design,
/// and behaviour have known flaws and pitfalls
/// that are impossible to address in Worker's current form.
///
/// Workers continue being supported and maintained,
/// but they eventually will be replaced
/// with threads API and then deprecated.
///
/// It is not recommended to expose workers in public API
/// or to have high coupling with Workers API, and instead,
/// we suggest encapsulating them in a domain-specific API
/// to simplify future migration and reduce potential exposure to dangerous API.
@Target([
  AnnotationTarget.CLASS,
  AnnotationTarget.ANNOTATION_CLASS,
  AnnotationTarget.PROPERTY,
  AnnotationTarget.FIELD,
  AnnotationTarget.LOCAL_VARIABLE,
  AnnotationTarget.VALUE_PARAMETER,
  AnnotationTarget.CONSTRUCTOR,
  AnnotationTarget.FUNCTION,
  AnnotationTarget.PROPERTY_GETTER,
  AnnotationTarget.PROPERTY_SETTER,
  AnnotationTarget.TYPEALIAS,
])
final class ObsoleteWorkersApi {
  const ObsoleteWorkersApi();
}

/// Note: this annotation has effect only in Kotlin/Native with legacy memory manager.
///
/// Marks a top level property with a backing field as immutable.
/// It is possible to share the value of such property between multiple threads,
/// but it becomes deeply frozen, so no changes can be made to its state
/// or the state of objects it refers to.
///
/// The annotation has effect only in Kotlin/Native platform.
///
/// **PLEASE NOTE THAT THIS ANNOTATION MAY GO AWAY IN UPCOMING RELEASES**.
///
/// Since 1.7.20 usage of this annotation is deprecated.
///
/// See https://kotlinlang.org/docs/native-migration-guide.html for details.
@DeprecatedSinceKotlin("1.9")
@Target([
  AnnotationTarget.PROPERTY,
])
final class SharedImmutable {
  const SharedImmutable();
}

/// Marks a top level property with a backing field or an object as thread local.
///
/// The object remains mutable and it is possible to change its state,
/// but every thread will have a distinct copy of this object,
/// so changes in one thread are not reflected in another.
///
/// The annotation has effect only in Kotlin/Native platform.
///
/// **PLEASE NOTE THAT THIS ANNOTATION MAY GO AWAY IN UPCOMING RELEASES**.
@Target([
  AnnotationTarget.PROPERTY,
  AnnotationTarget.CLASS,
])
final class ThreadLocal {
  const ThreadLocal();
}

/// Note: modern Kotlin/Native memory manager allows
/// to share objects between threads without additional ceremonies,
/// so [TransferMode] has effect only in legacy memory manager.
enum TransferMode {
  /// Reachability check is performed.
  SAFE(0),

  /// Skip reachability check, can lead to mysterious crashes in an application.
  ///
  /// **USE UNSAFE MODE ONLY IF ABSOLUTELY SURE WHAT YOU'RE DOING!!!**
  UNSAFE(1);

  final Int value;

  const TransferMode(this.value);
}

class Worker {
  /// Get a list of all unterminated workers.
  external static List<Worker> get activeWorkers;

  /// Return the current worker.
  ///
  /// Worker context is accessible to any valid Kotlin context,
  /// but only actual active worker produced with [Worker.start]
  /// automatically processes execution requests.
  ///
  /// For other situations processQueue must be called explicitly to process request queue.
  ///
  /// **Return** current worker object, usable across multiple concurrent contexts.
  external static Worker get current;

  external final Int id;

  /// Name of the worker, as specified in [Worker.start] or "worker $id" by default,
  external final String name;

  /// Get platform thread id of the worker thread.
  external final ULong platformThreadId;

  /// Convert worker to a COpaquePointer value that could be passed via native void* pointer.
  ///
  /// Can be used as an argument of [Worker.fromCPointer].
  @Deprecated('Use kotlinx.cinterop.StableRef instead')
  external COpaquePointer? asCOpaquePointer();

  /// Plan job for further execution in the worker.
  ///
  /// Execute is a two-phase operation:
  /// 1. [producer] function is executed on the caller's thread.
  /// 2. The result of [producer] and [job] function pointer
  /// is being added to jobs queue of the selected worker.
  ///
  /// Note that job must not capture any state itself.
  ///
  /// Parameter [mode] has no effect.
  ///
  /// **Return** the future with the computation result of [job].
  external Future<T2> execute<T1, T2>({
    required TransferMode mode,
    required T1 Function() producer,
    required T2 Function(T1) job,
  });

  /// Plan job for further execution in the worker.
  external fun executeAfter(
    Unit Function() operation, {
    Long afterMicroseconds = 0,
  });

  /// Park execution of the current worker until a new request arrives
  /// or timeout specified in [timeoutMicroseconds] elapsed.
  ///
  /// If [process] is `true`, pending queue elements are processed, including delayed requests.
  ///
  /// Note that multiple requests could be processed this way.
  external Boolean park({
    Boolean process = true,
    Int timeoutMicroseconds = 0,
  });

  /// Process pending job(s) on the queue of this worker. Note that jobs scheduled
  /// with [executeAfter] using non-zero timeout are not processed this way.
  ///
  /// If termination request arrives while processing the queue via this API,
  /// worker is marked as terminated and will exit once the current request is done with.
  external Boolean processQueue();

  /// Requests termination of the worker.
  external Future<Unit> requestTermination({
    Boolean processScheduledJobs = true,
  });

  /// String representation of the worker.
  external String toString();

  /// Create worker object from a C pointer.
  ///
  /// This function is deprecated. See [Worker.asCPointer] for more details.
  @Deprecated('Use kotlinx.cinterop.StableRef instead')
  external static Worker fromCPointer();

  /// Start new scheduling primitive, such as thread, to accept new tasks via execute interface.
  ///
  /// Typically new worker may be needed for computations offload to another core,
  /// for IO it may be better to use non-blocking IO combined with more lightweight coroutines.
  ///
  /// **Return** worker object, usable across multiple concurrent contexts.
  external static Worker start({
    Boolean errorReporting = true,
    String? name,
  });
}

/// A shared reference to a Kotlin object
/// that doesn't freeze the referred object when it gets frozen itself.
///
/// After freezing can be safely passed between workers,
/// but value can only be accessed on the worker [WorkerBoundReference] was created on,
/// unless the referred object is frozen too.
///
/// Note: Garbage collector currently cannot free any reference cycles
/// with frozen [WorkerBoundReference] in them.
///
/// To resolve such cycles consider using [AtomicReference]`<WorkerBoundReference?>`
/// which can be explicitly nulled out.
class WorkerBoundReference<T extends Any> {
  /// The referenced value.
  final T value;

  /// The referenced value or null if referred object is not frozen
  /// and current worker is different from the one created this.
  external final T? valueOrNull;

  /// Worker that [value] is bound to.
  external final Worker worker;

  /// A shared reference to a Kotlin object
  /// that doesn't freeze the referred object when it gets frozen itself.
  const WorkerBoundReference(this.value);
}

extension NativeConcurrentAnyExtension on Any {
  /// Checks if given object is null or frozen or permanent (i.e. instantiated at compile-time).
  ///
  /// Return `true` if given object is null or frozen or permanent.
  external Boolean get isFrozen;

  /// This function ensures that if we see such an object during
  /// freezing attempt - freeze fails and FreezingException is thrown.
  ///
  /// **Exceptions**:
  ///
  /// * [FreezingException] - thrown immediately if this object is already frozen.
  ///
  /// **See also**:
  ///
  /// * [freeze]
  external fun ensureNeverFrozen<T>();

  /// Freezes object subgraph reachable from this object.
  ///
  /// Frozen objects can be freely shared between threads/workers.
  ///
  /// **Exceptions**:
  ///
  /// * [FreezingException] - if freezing is not possible.
  ///
  /// **Return** the object itself.
  ///
  /// **See also**:
  ///
  /// * [ensureNeverFrozen]
  external T freeze<T>();
}

extension NativeConcurrentDetachedObjectGraphExtension on DetachedObjectGraph {
  /// Attaches previously detached object subgraph created by [DetachedObjectGraph].
  ///
  /// Please note, that once object graph is attached,
  /// the [DetachedObjectGraph.stable] pointer does not make sense anymore,
  /// and shall be discarded, so attach of one DetachedObjectGraph object can only happen once.
  external T attach<T>();
}
