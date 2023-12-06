library kotlin.native.runtime;

import '/src/kotlin.dart';

/// This annotation marks the Kotlin/Native standard library API that tweaks
/// or otherwise accesses the Kotlin runtime behavior.
const nativeRuntimeApi = NativeRuntimeApi();

/// **Note**: this API is unstable and may change in any release.
///
/// A set of utilities for debugging Kotlin/Native runtime.
@nativeRuntimeApi
sealed class Debugging {
  /// Run full checked deinitialization on shutdown.
  ///
  /// Make sure that after exiting `main()`
  /// only a single thread with Kotlin runtime remains.
  ///
  /// Run [GC] collecting everything including globals.
  ///
  /// When enabled together with [Platform.isCleanersLeakCheckerActive]
  /// additionally checks that no cleaners get executed after `main()`
  external static Boolean forceCheckedShutdown;

  /// Whether the current thread's state allows running Kotlin code.
  ///
  /// Used by Kotlin/Native internal tests. If it returns `false`, it's a bug.
  external static final Boolean isThreadStateRunnable;
}

/// **Note**: this API is unstable and may change in any release.
///
/// Kotlin/Native uses tracing garbage collector (GC)
/// that is executed periodically to collect objects
/// that are not reachable from the "roots",
/// like local and global variables.
///
/// See [documentation](https://kotlinlang.org/docs/native-memory-manager.html)
/// to learn more about Kotlin/Native memory management.
///
/// This object provides a set of functions and properties that allows to tune garbage collector.
///
/// **Legacy memory manager**
///
/// Kotlin/Native relies upon reference counting for object management,
/// however it could not collect cyclical garbage,
/// so we perform periodic garbage collection.
///
/// This may slow down application, so this interface provides control
/// over how garbage collector activates and runs.
///
/// Garbage collector can be in one of the following states:
///
/// * running
/// * suspended (so cycle candidates are collected, but GC is not performed until resume)
/// * stopped (all cyclical garbage is hopelessly lost) Immediately after startup GC is in running state.
/// Depending on application needs it may select to suspend GC for certain phases of its lifetime,
/// and resume it later on, or just completely turn it off,
/// if GC pauses are less desirable than cyclical garbage leaks.
@nativeRuntimeApi
sealed class GC {
  /// If true update targetHeapBytes after each collection.
  external Boolean autotune;

  @Deprecated('Deprecated and unused.')
  external Long collectCyclesThreshold;

  @Deprecated('Deprecated and unused.')
  external Boolean cyclicCollectorEnabled;

  /// The GC is scheduled when Kotlin heap overflows [heapTriggerCoefficient] * [targetHeapBytes].
  external Double heapTriggerCoefficient;

  /// Returns statistics of the last finished garbage collection run.
  ///
  /// This information is supposed to be used for testing and debugging purposes only
  external final GCInfo? lastGCInfo;

  /// The maximum value for targetHeapBytes.
  ///
  /// Only used if [autotune] is `true`.
  ///
  /// See [targetHeapBytes] for more details.
  external Long maxHeapBytes;

  /// The minimum value for targetHeapBytes.
  ///
  /// Only used if [autotune] is `true`.
  ///
  /// See [targetHeapBytes] for more details.
  external Long minHeapBytes;

  /// If `true`, the GC will pause Kotlin threads
  /// when Kotlin heap overflows [targetHeapBytes]
  /// and will resume them only after current GC is done.
  external Boolean pauseOnTargetHeapOverflow;

  /// When Kotlin code is not allocating enough to trigger GC,
  /// the GC scheduler uses timer to drive collection.
  /// Timer-triggered collection will happen roughly
  /// in [regularGCInterval] .. 2 * [regularGCInterval] since any previous collection.
  external Duration regularGCInterval;

  /// Total amount of heap available for Kotlin objects.
  ///
  /// The [GC] tries to schedule execution so that Kotlin heap doesn't overflow this heap.
  ///
  /// Automatically adjusts when [autotune] is `true`: after each collection the [targetHeapBytes]
  /// is set to heapBytes / [targetHeapUtilization] and capped between [minHeapBytes] and [maxHeapBytes],
  /// where heapBytes is heap usage after the garbage is collected.
  ///
  /// Note, that if after a collection heapBytes > [targetHeapBytes]
  /// (which may happen if autotune is false, or maxHeapBytes is set too low),
  /// the next collection will be triggered almost immediately.
  external Long targetHeapBytes;

  /// What fraction of the Kotlin heap should be populated.
  ///
  /// Only used if [autotune] is `true`.
  ///
  /// See [targetHeapBytes] for more details.
  external Long targetHeapUtilization;

  @Deprecated('Deprecated and unused.')
  external Int threshold;
  
  @Deprecated('Deprecated and unused.')
  external Long thresholdAllocations;

  /// Trigger new collection and wait for its completion.
  fun collect();

  @Deprecated('Deprecated and unused.')
  fun collectCyclic();

  @Deprecated('Deprecated and unused. Always return null.')
  Array<Any>? detectCycles() => null;

  @Deprecated('Deprecated and unused. Always return null.')
  Array<Any>? findCycle(Any root) => null;

  @Deprecated('Deprecated and unused.')
  fun resume();

  /// Trigger new collection without waiting for its completion.
  fun schedule();

  @Deprecated('Deprecated and unused.')
  fun start();

  @Deprecated('Deprecated and unused.')
  fun stop();

  @Deprecated('Deprecated and unused.')
  fun suspend();
}

/// This class represents statistics about the single run of the garbage collector.
///
/// It is supposed to be used for testing and debugging purposes only.
@nativeRuntimeApi
class GCInfo {
  /// Time, when garbage collector run is ended,
  /// measured by `kotlin.system.getTimeNanos`.
  ///
  /// After this point, most of the memory is reclaimed,
  /// and a new garbage collector run can start.
  final Long endTimeNs;

  /// ID of garbage collector run.
  final Long epoch;

  /// Time, when mutator threads are unsuspended for the first time,
  /// mesured by `kotlin.system.getTimeNanos`.
  final Long firstPauseEndTimeNs;

  /// Time, when the garbage collector thread requested
  /// suspension of mutator threads for the first time,
  /// mesured by `kotlin.system.getTimeNanos`.
  final Long firstPauseRequestTimeNs;

  /// Time, when mutator threads are suspended for the first time,
  /// mesured by `kotlin.system.getTimeNanos`.
  final Long firstPauseStartTimeNs;

  /// How many objects were processed during marking phase.
  final Long markedCount;

  /// Memory usage at the start of garbage collector run, separated by memory pools.
  ///
  /// The set of memory pools depends on the collector implementation.
  ///
  /// Can be empty, if collection is in progress.
  final Map<String, MemoryUsage> memoryUsageAfter;

  /// Memory usage at the end of garbage collector run, separated by memory pools.
  ///
  /// The set of memory pools depends on the collector implementation.
  ///
  /// Can be empty, if collection is in progress.
  final Map<String, MemoryUsage> memoryUsageBefore;

  /// Time, when all memory is reclaimed,
  /// measured by `kotlin.system.getTimeNanos`.
  ///
  /// If `null`, memory reclamation is still in progress.
  final Long? postGcCleanupTimeNs;

  /// The number of objects in each root set pool.
  ///
  /// Check [RootSetStatistics] doc for details.
  final RootSetStatistics rootSet;

  /// Time, when mutator threads are unsuspended for the second time,
  /// mesured by `kotlin.system.getTimeNanos`.
  final Long? secondPauseEndTimeNs;

  /// Time, when the garbage collector thread requested
  /// suspension of mutator threads for the second time,
  /// mesured by `kotlin.system.getTimeNanos`.
  final Long? secondPauseRequestTimeNs;

  /// Time, when mutator threads are suspended for the second time,
  /// mesured by `kotlin.system.getTimeNanos`.
  final Long? secondPauseStartTimeNs;

  /// Time, when garbage collector run is started,
  /// meausered by `kotlin.system.getTimeNanos`.
  final Long startTimeNs;

  /// Sweeping statistics separated by memory pools.
  ///
  /// The set of memory pools depends on the collector implementation.
  ///
  /// Can be empty, if collection is in progress.
  final Map<String, SweepStatistics> sweepStatistics;

  /// This class represents statistics about the single run of the garbage collector.
  ///
  /// It is supposed to be used for testing and debugging purposes only.
  const GCInfo({
    required this.endTimeNs,
    required this.epoch,
    required this.firstPauseEndTimeNs,
    required this.firstPauseRequestTimeNs,
    required this.firstPauseStartTimeNs,
    required this.markedCount,
    required this.memoryUsageAfter,
    required this.memoryUsageBefore,
    this.postGcCleanupTimeNs,
    required this.rootSet,
    this.secondPauseEndTimeNs,
    this.secondPauseRequestTimeNs,
    this.secondPauseStartTimeNs,
    required this.startTimeNs,
    required this.sweepStatistics,
  });
}

/// This class represents statistics of memory usage in one memory pool.
@nativeRuntimeApi
class MemoryUsage {
  /// The total size of allocated objects.
  ///
  /// System allocator overhead is not included,
  /// so it can not perfectly match the value received by os tools.
  ///
  /// All alignment and auxiliary object headers are included.
  final Long totalObjectsSizeBytes;

  /// This class represents statistics of memory usage in one memory pool.
  const MemoryUsage(this.totalObjectsSizeBytes);
}

/// This annotation marks the Kotlin/Native standard library API that tweaks
/// or otherwise accesses the Kotlin runtime behavior.
///
/// The API marked with this annotation is considered unstable
/// and is **not** intended to become stable in the future.
///
/// Behavior of such an API may be changed
/// or the API may be removed completely in any further release.
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
final class NativeRuntimeApi {
  const NativeRuntimeApi();
}

/// This class represents statistics of the root set
/// for garbage collector run, separated by root set pools.
///
/// These nodes are assumed to be used, even if there are no references for them.
@nativeRuntimeApi
class RootSetStatistics {
  /// The number of objects in global variables.
  ///
  /// The object is counted only if the variable is initialized.
  final Long globalReferences;

  /// The number of objects referenced by `kotlinx.cinterop.StableRef`.
  ///
  /// It includes both explicit usage of this API,
  /// and internal usages, e.g. inside interop and Worker API.
  final Long stableReferences;

  /// The number of objects referenced from the stack of any thread.
  ///
  /// These are function local variables and different temporary values,
  /// as function call arguments and return values.
  ///
  /// They would be automatically removed from the root set
  /// when a corresponding function call is finished.
  final Long stackReferences;

  /// The number of objects in global variables with `@ThreadLocal` annotation.
  ///
  /// Object is counted once per each thread it was initialized in.
  final Long threadLocalReferences;

  /// This class represents statistics of the root set
  /// for garbage collector run, separated by root set pools.
  ///
  /// These nodes are assumed to be used, even if there are no references for them.
  const RootSetStatistics({
    required this.globalReferences,
    required this.stableReferences,
    required this.stackReferences,
    required this.threadLocalReferences,
  });
}

/// This class represents statistics of sweeping in one memory pool.
@nativeRuntimeApi
class SweepStatistics {
  /// The number of objects that were processed but kept alive.
  final Long keptCount;

  /// The of objects that were freed.
  final Long sweptCount;

  /// This class represents statistics of sweeping in one memory pool.
  const SweepStatistics(this.keptCount, this.sweptCount);
}
