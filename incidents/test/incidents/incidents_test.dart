import 'package:flutter_test/flutter_test.dart';
import 'package:incidents/src/models/ProgressStatues.dart';

void main() {
  group('Incident validation', () {
    test('Progress_index_to_Status', () {
      expect(ProgressStatus.fromIndex(0), ProgressStatus.submitted);
      expect(ProgressStatus.fromIndex(0).value, "Submitted");
      expect(ProgressStatus.fromIndex(1), ProgressStatus.inProgress);
      expect(ProgressStatus.fromIndex(1).value, "In Progress");
    });
  });
}
