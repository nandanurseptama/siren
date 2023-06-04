import 'package:siren/cores/failures/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_state.freezed.dart';

@freezed
class ErrorState<T extends Object> with _$ErrorState<T> {
  const factory ErrorState({
    required Failure failure,
    @Default(null) T? data,
  }) = OnErrorState;
}
