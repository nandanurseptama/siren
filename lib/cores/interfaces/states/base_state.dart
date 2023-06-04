import 'package:siren/cores/failures/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial({
    @Default(true) bool isInitial,
    @Default(null) T? data,
  }) = _BaseStateInitial;

  const factory BaseState.loading({
    @Default(true) bool isLoading,
    @Default(null) T? data,
  }) = _BaseStateLoading;

  const factory BaseState.success({
    @Default(false) bool isLoading,
    required T data,
  }) = _BaseStateSuccess;

  const factory BaseState.failure({
    @Default(false) bool isLoading,
    @Default(null) T? data,
    required Failure failure,
  }) = _BaseStateFailure;
}

extension BaseStateExtension<T> on BaseState<T> {
  bool get isLoading => this is _BaseStateLoading<T>;
}
