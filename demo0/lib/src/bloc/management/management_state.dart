part of 'management_bloc.dart';

enum SubmitStatus { submitting, success, faild, init }

class ManagementState extends Equatable {
  const ManagementState({this.status = SubmitStatus.init});

  final SubmitStatus status;

  copyWith({
    SubmitStatus? status,
  }) {
    return ManagementState(
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '''ManagementState { status: $status }''';
  }

  @override
  List<Object> get props => [status];
}
