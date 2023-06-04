// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationState<T> {
  int get currentPage => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int? get prevPage => throw _privateConstructorUsedError;
  List<T>? get results => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, int currentPage, int? nextPage,
            int total, int? prevPage, List<T>? results)
        initial,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)
        loading,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)
        loaded,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationStateInitial<T> value) initial,
    required TResult Function(_PaginationStateLoading<T> value) loading,
    required TResult Function(_PaginationStateLoaded<T> value) loaded,
    required TResult Function(_PaginationStateFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaginationStateInitial<T> value)? initial,
    TResult? Function(_PaginationStateLoading<T> value)? loading,
    TResult? Function(_PaginationStateLoaded<T> value)? loaded,
    TResult? Function(_PaginationStateFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationStateInitial<T> value)? initial,
    TResult Function(_PaginationStateLoading<T> value)? loading,
    TResult Function(_PaginationStateLoaded<T> value)? loaded,
    TResult Function(_PaginationStateFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationStateCopyWith<T, PaginationState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<T, $Res> {
  factory $PaginationStateCopyWith(
          PaginationState<T> value, $Res Function(PaginationState<T>) then) =
      _$PaginationStateCopyWithImpl<T, $Res, PaginationState<T>>;
  @useResult
  $Res call(
      {int currentPage,
      int? nextPage,
      int total,
      int? prevPage,
      List<T> results});
}

/// @nodoc
class _$PaginationStateCopyWithImpl<T, $Res, $Val extends PaginationState<T>>
    implements $PaginationStateCopyWith<T, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? nextPage = freezed,
    Object? total = null,
    Object? prevPage = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      results: null == results
          ? _value.results!
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationStateInitialCopyWith<T, $Res>
    implements $PaginationStateCopyWith<T, $Res> {
  factory _$$_PaginationStateInitialCopyWith(_$_PaginationStateInitial<T> value,
          $Res Function(_$_PaginationStateInitial<T>) then) =
      __$$_PaginationStateInitialCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isInitial,
      int currentPage,
      int? nextPage,
      int total,
      int? prevPage,
      List<T>? results});
}

/// @nodoc
class __$$_PaginationStateInitialCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$_PaginationStateInitial<T>>
    implements _$$_PaginationStateInitialCopyWith<T, $Res> {
  __$$_PaginationStateInitialCopyWithImpl(_$_PaginationStateInitial<T> _value,
      $Res Function(_$_PaginationStateInitial<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? currentPage = null,
    Object? nextPage = freezed,
    Object? total = null,
    Object? prevPage = freezed,
    Object? results = freezed,
  }) {
    return _then(_$_PaginationStateInitial<T>(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc

class _$_PaginationStateInitial<T> implements _PaginationStateInitial<T> {
  const _$_PaginationStateInitial(
      {this.isInitial = true,
      this.currentPage = 0,
      this.nextPage = 1,
      this.total = 0,
      this.prevPage = null,
      final List<T>? results = null})
      : _results = results;

  @override
  @JsonKey()
  final bool isInitial;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int? nextPage;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int? prevPage;
  final List<T>? _results;
  @override
  @JsonKey()
  List<T>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaginationState<$T>.initial(isInitial: $isInitial, currentPage: $currentPage, nextPage: $nextPage, total: $total, prevPage: $prevPage, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationStateInitial<T> &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitial, currentPage, nextPage,
      total, prevPage, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationStateInitialCopyWith<T, _$_PaginationStateInitial<T>>
      get copyWith => __$$_PaginationStateInitialCopyWithImpl<T,
          _$_PaginationStateInitial<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, int currentPage, int? nextPage,
            int total, int? prevPage, List<T>? results)
        initial,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)
        loading,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)
        loaded,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)
        failure,
  }) {
    return initial(isInitial, currentPage, nextPage, total, prevPage, results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
  }) {
    return initial?.call(
        isInitial, currentPage, nextPage, total, prevPage, results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          isInitial, currentPage, nextPage, total, prevPage, results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationStateInitial<T> value) initial,
    required TResult Function(_PaginationStateLoading<T> value) loading,
    required TResult Function(_PaginationStateLoaded<T> value) loaded,
    required TResult Function(_PaginationStateFailure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaginationStateInitial<T> value)? initial,
    TResult? Function(_PaginationStateLoading<T> value)? loading,
    TResult? Function(_PaginationStateLoaded<T> value)? loaded,
    TResult? Function(_PaginationStateFailure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationStateInitial<T> value)? initial,
    TResult Function(_PaginationStateLoading<T> value)? loading,
    TResult Function(_PaginationStateLoaded<T> value)? loaded,
    TResult Function(_PaginationStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _PaginationStateInitial<T> implements PaginationState<T> {
  const factory _PaginationStateInitial(
      {final bool isInitial,
      final int currentPage,
      final int? nextPage,
      final int total,
      final int? prevPage,
      final List<T>? results}) = _$_PaginationStateInitial<T>;

  bool get isInitial;
  @override
  int get currentPage;
  @override
  int? get nextPage;
  @override
  int get total;
  @override
  int? get prevPage;
  @override
  List<T>? get results;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationStateInitialCopyWith<T, _$_PaginationStateInitial<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PaginationStateLoadingCopyWith<T, $Res>
    implements $PaginationStateCopyWith<T, $Res> {
  factory _$$_PaginationStateLoadingCopyWith(_$_PaginationStateLoading<T> value,
          $Res Function(_$_PaginationStateLoading<T>) then) =
      __$$_PaginationStateLoadingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int currentPage,
      int? nextPage,
      int? prevPage,
      int total,
      List<T>? results});
}

/// @nodoc
class __$$_PaginationStateLoadingCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$_PaginationStateLoading<T>>
    implements _$$_PaginationStateLoadingCopyWith<T, $Res> {
  __$$_PaginationStateLoadingCopyWithImpl(_$_PaginationStateLoading<T> _value,
      $Res Function(_$_PaginationStateLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentPage = null,
    Object? nextPage = freezed,
    Object? prevPage = freezed,
    Object? total = null,
    Object? results = freezed,
  }) {
    return _then(_$_PaginationStateLoading<T>(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc

class _$_PaginationStateLoading<T> implements _PaginationStateLoading<T> {
  const _$_PaginationStateLoading(
      {this.isLoading = true,
      this.currentPage = 1,
      this.nextPage = null,
      this.prevPage = null,
      this.total = 0,
      final List<T>? results = null})
      : _results = results;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int? nextPage;
  @override
  @JsonKey()
  final int? prevPage;
  @override
  @JsonKey()
  final int total;
  final List<T>? _results;
  @override
  @JsonKey()
  List<T>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaginationState<$T>.loading(isLoading: $isLoading, currentPage: $currentPage, nextPage: $nextPage, prevPage: $prevPage, total: $total, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationStateLoading<T> &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, currentPage, nextPage,
      prevPage, total, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationStateLoadingCopyWith<T, _$_PaginationStateLoading<T>>
      get copyWith => __$$_PaginationStateLoadingCopyWithImpl<T,
          _$_PaginationStateLoading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, int currentPage, int? nextPage,
            int total, int? prevPage, List<T>? results)
        initial,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)
        loading,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)
        loaded,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)
        failure,
  }) {
    return loading(isLoading, currentPage, nextPage, prevPage, total, results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
  }) {
    return loading?.call(
        isLoading, currentPage, nextPage, prevPage, total, results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(
          isLoading, currentPage, nextPage, prevPage, total, results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationStateInitial<T> value) initial,
    required TResult Function(_PaginationStateLoading<T> value) loading,
    required TResult Function(_PaginationStateLoaded<T> value) loaded,
    required TResult Function(_PaginationStateFailure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaginationStateInitial<T> value)? initial,
    TResult? Function(_PaginationStateLoading<T> value)? loading,
    TResult? Function(_PaginationStateLoaded<T> value)? loaded,
    TResult? Function(_PaginationStateFailure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationStateInitial<T> value)? initial,
    TResult Function(_PaginationStateLoading<T> value)? loading,
    TResult Function(_PaginationStateLoaded<T> value)? loaded,
    TResult Function(_PaginationStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PaginationStateLoading<T> implements PaginationState<T> {
  const factory _PaginationStateLoading(
      {final bool isLoading,
      final int currentPage,
      final int? nextPage,
      final int? prevPage,
      final int total,
      final List<T>? results}) = _$_PaginationStateLoading<T>;

  bool get isLoading;
  @override
  int get currentPage;
  @override
  int? get nextPage;
  @override
  int? get prevPage;
  @override
  int get total;
  @override
  List<T>? get results;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationStateLoadingCopyWith<T, _$_PaginationStateLoading<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PaginationStateLoadedCopyWith<T, $Res>
    implements $PaginationStateCopyWith<T, $Res> {
  factory _$$_PaginationStateLoadedCopyWith(_$_PaginationStateLoaded<T> value,
          $Res Function(_$_PaginationStateLoaded<T>) then) =
      __$$_PaginationStateLoadedCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int currentPage,
      int? nextPage,
      int? prevPage,
      int total,
      List<T> results});
}

/// @nodoc
class __$$_PaginationStateLoadedCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$_PaginationStateLoaded<T>>
    implements _$$_PaginationStateLoadedCopyWith<T, $Res> {
  __$$_PaginationStateLoadedCopyWithImpl(_$_PaginationStateLoaded<T> _value,
      $Res Function(_$_PaginationStateLoaded<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentPage = null,
    Object? nextPage = freezed,
    Object? prevPage = freezed,
    Object? total = null,
    Object? results = null,
  }) {
    return _then(_$_PaginationStateLoaded<T>(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_PaginationStateLoaded<T> implements _PaginationStateLoaded<T> {
  const _$_PaginationStateLoaded(
      {this.isLoading = false,
      this.currentPage = 1,
      this.nextPage = null,
      this.prevPage = null,
      required this.total,
      required final List<T> results})
      : _results = results;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int? nextPage;
  @override
  @JsonKey()
  final int? prevPage;
  @override
  final int total;
  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginationState<$T>.loaded(isLoading: $isLoading, currentPage: $currentPage, nextPage: $nextPage, prevPage: $prevPage, total: $total, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationStateLoaded<T> &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, currentPage, nextPage,
      prevPage, total, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationStateLoadedCopyWith<T, _$_PaginationStateLoaded<T>>
      get copyWith => __$$_PaginationStateLoadedCopyWithImpl<T,
          _$_PaginationStateLoaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, int currentPage, int? nextPage,
            int total, int? prevPage, List<T>? results)
        initial,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)
        loading,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)
        loaded,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)
        failure,
  }) {
    return loaded(isLoading, currentPage, nextPage, prevPage, total, results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
  }) {
    return loaded?.call(
        isLoading, currentPage, nextPage, prevPage, total, results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(isLoading, currentPage, nextPage, prevPage, total, results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationStateInitial<T> value) initial,
    required TResult Function(_PaginationStateLoading<T> value) loading,
    required TResult Function(_PaginationStateLoaded<T> value) loaded,
    required TResult Function(_PaginationStateFailure<T> value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaginationStateInitial<T> value)? initial,
    TResult? Function(_PaginationStateLoading<T> value)? loading,
    TResult? Function(_PaginationStateLoaded<T> value)? loaded,
    TResult? Function(_PaginationStateFailure<T> value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationStateInitial<T> value)? initial,
    TResult Function(_PaginationStateLoading<T> value)? loading,
    TResult Function(_PaginationStateLoaded<T> value)? loaded,
    TResult Function(_PaginationStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _PaginationStateLoaded<T> implements PaginationState<T> {
  const factory _PaginationStateLoaded(
      {final bool isLoading,
      final int currentPage,
      final int? nextPage,
      final int? prevPage,
      required final int total,
      required final List<T> results}) = _$_PaginationStateLoaded<T>;

  bool get isLoading;
  @override
  int get currentPage;
  @override
  int? get nextPage;
  @override
  int? get prevPage;
  @override
  int get total;
  @override
  List<T> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationStateLoadedCopyWith<T, _$_PaginationStateLoaded<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PaginationStateFailureCopyWith<T, $Res>
    implements $PaginationStateCopyWith<T, $Res> {
  factory _$$_PaginationStateFailureCopyWith(_$_PaginationStateFailure<T> value,
          $Res Function(_$_PaginationStateFailure<T>) then) =
      __$$_PaginationStateFailureCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int currentPage,
      int? nextPage,
      int? prevPage,
      List<T>? results,
      int total,
      Failure failure});
}

/// @nodoc
class __$$_PaginationStateFailureCopyWithImpl<T, $Res>
    extends _$PaginationStateCopyWithImpl<T, $Res, _$_PaginationStateFailure<T>>
    implements _$$_PaginationStateFailureCopyWith<T, $Res> {
  __$$_PaginationStateFailureCopyWithImpl(_$_PaginationStateFailure<T> _value,
      $Res Function(_$_PaginationStateFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentPage = null,
    Object? nextPage = freezed,
    Object? prevPage = freezed,
    Object? results = freezed,
    Object? total = null,
    Object? failure = null,
  }) {
    return _then(_$_PaginationStateFailure<T>(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      prevPage: freezed == prevPage
          ? _value.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_PaginationStateFailure<T> implements _PaginationStateFailure<T> {
  const _$_PaginationStateFailure(
      {this.isLoading = false,
      this.currentPage = 1,
      this.nextPage = null,
      this.prevPage = null,
      final List<T>? results = null,
      this.total = 0,
      required this.failure})
      : _results = results;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int? nextPage;
  @override
  @JsonKey()
  final int? prevPage;
  final List<T>? _results;
  @override
  @JsonKey()
  List<T>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int total;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'PaginationState<$T>.failure(isLoading: $isLoading, currentPage: $currentPage, nextPage: $nextPage, prevPage: $prevPage, results: $results, total: $total, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationStateFailure<T> &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, currentPage, nextPage,
      prevPage, const DeepCollectionEquality().hash(_results), total, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationStateFailureCopyWith<T, _$_PaginationStateFailure<T>>
      get copyWith => __$$_PaginationStateFailureCopyWithImpl<T,
          _$_PaginationStateFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, int currentPage, int? nextPage,
            int total, int? prevPage, List<T>? results)
        initial,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)
        loading,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)
        loaded,
    required TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)
        failure,
  }) {
    return failure(isLoading, currentPage, nextPage, prevPage, results, total,
        this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult? Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
  }) {
    return failure?.call(isLoading, currentPage, nextPage, prevPage, results,
        total, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, int currentPage, int? nextPage, int total,
            int? prevPage, List<T>? results)?
        initial,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T>? results)?
        loading,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, int total, List<T> results)?
        loaded,
    TResult Function(bool isLoading, int currentPage, int? nextPage,
            int? prevPage, List<T>? results, int total, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(isLoading, currentPage, nextPage, prevPage, results, total,
          this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaginationStateInitial<T> value) initial,
    required TResult Function(_PaginationStateLoading<T> value) loading,
    required TResult Function(_PaginationStateLoaded<T> value) loaded,
    required TResult Function(_PaginationStateFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaginationStateInitial<T> value)? initial,
    TResult? Function(_PaginationStateLoading<T> value)? loading,
    TResult? Function(_PaginationStateLoaded<T> value)? loaded,
    TResult? Function(_PaginationStateFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaginationStateInitial<T> value)? initial,
    TResult Function(_PaginationStateLoading<T> value)? loading,
    TResult Function(_PaginationStateLoaded<T> value)? loaded,
    TResult Function(_PaginationStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _PaginationStateFailure<T> implements PaginationState<T> {
  const factory _PaginationStateFailure(
      {final bool isLoading,
      final int currentPage,
      final int? nextPage,
      final int? prevPage,
      final List<T>? results,
      final int total,
      required final Failure failure}) = _$_PaginationStateFailure<T>;

  bool get isLoading;
  @override
  int get currentPage;
  @override
  int? get nextPage;
  @override
  int? get prevPage;
  @override
  List<T>? get results;
  @override
  int get total;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationStateFailureCopyWith<T, _$_PaginationStateFailure<T>>
      get copyWith => throw _privateConstructorUsedError;
}
