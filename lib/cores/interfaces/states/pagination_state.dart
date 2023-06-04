import 'package:siren/cores/failures/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_state.freezed.dart';

@freezed
class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState.initial({
    @Default(true) bool isInitial,
    @Default(0) int currentPage,
    @Default(1) int? nextPage,
    @Default(0) int total,
    @Default(null) int? prevPage,
    @Default(null) List<T>? results,
  }) = _PaginationStateInitial;

  const factory PaginationState.loading({
    @Default(true) bool isLoading,
    @Default(1) int currentPage,
    @Default(null) int? nextPage,
    @Default(null) int? prevPage,
    @Default(0) int total,
    @Default(null) List<T>? results,
  }) = _PaginationStateLoading;

  const factory PaginationState.loaded({
    @Default(false) bool isLoading,
    @Default(1) int currentPage,
    @Default(null) int? nextPage,
    @Default(null) int? prevPage,
    required int total,
    required List<T> results,
  }) = _PaginationStateLoaded;

  const factory PaginationState.failure({
    @Default(false) bool isLoading,
    @Default(1) int currentPage,
    @Default(null) int? nextPage,
    @Default(null) int? prevPage,
    @Default(null) List<T>? results,
    @Default(0) int total,
    required Failure failure,
  }) = _PaginationStateFailure;
}

extension PaginationStateExt<T> on PaginationState<T> {
  bool get isLoading => this is _PaginationStateLoading<T>;
}
