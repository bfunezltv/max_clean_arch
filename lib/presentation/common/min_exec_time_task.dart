import 'dart:math';

import 'package:max_clean_arch/presentation/extensions/duration_x.dart';

class MinExecTimeTask<R> {
  MinExecTimeTask({required this.minDelay, required this.compute});

  final Function compute;
  final Duration minDelay;

  late int _startTime;

  Future<R> start() async {
    _startTime = DateTime.now().millisecondsSinceEpoch;
    try {
      final result = await compute();
      await _calculateDelay().ms.delay;
      return result;
    } catch (_) {
      await _calculateDelay().ms.delay;
      rethrow;
    }
  }

  int _calculateDelay() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final computationTime = now - _startTime;
    return max(0, minDelay.inMilliseconds - computationTime);
  }
}
