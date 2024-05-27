import 'package:incidents/src/utils/base_enum.dart';

class ProgressStatus extends BaseEnum<String> {
  final int index;
  const ProgressStatus._(this.index, String value) : super(value);
  static const submitted = ProgressStatus._(0, 'Submitted');
  static const inProgress = ProgressStatus._(1, 'InProgress');
  static const completed = ProgressStatus._(2, 'Completed');
  static const rejected = ProgressStatus._(3, 'Rejected');

  static const values = [submitted, inProgress, completed, rejected];

  static ProgressStatus fromIndex(int index) => values[index];

  int toJson() => index;
}
