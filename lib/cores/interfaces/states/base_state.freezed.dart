// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState<T> {
  T? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, T? data) initial,
    required TResult Function(bool isLoading, T? data) loading,
    required TResult Function(bool isLoading, T data) success,
    required TResult Function(bool isLoading, T? data, Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, T? data)? initial,
    TResult? Function(bool isLoading, T? data)? loading,
    TResult? Function(bool isLoading, T data)? success,
    TResult? Function(bool isLoading, T? data, Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, T? data)? initial,
    TResult Function(bool isLoading, T? data)? loading,
    TResult Function(bool isLoading, T data)? success,
    TResult Function(bool isLoading, T? data, Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateSuccess<T> value) success,
    required TResult Function(_BaseStateFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateSuccess<T> value)? success,
    TResult? Function(_BaseStateFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateSuccess<T> value)? success,
    TResult Function(_BaseStateFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
          BaseState<T> value, $Res Function(BaseState<T>) then) =
      _$BaseStateCopyWithImpl<T, $Res, BaseState<T>>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res, $Val extends BaseState<T>>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BaseStateInitialCopyWith<T, $Res> {
  factory _$$_BaseStateInitialCopyWith(_$_BaseStateInitial<T> value,
          $Res Function(_$_BaseStateInitial<T>) then) =
      __$$_BaseStateInitialCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isInitial, T? data});
}

/// @nodoc
class __$$_BaseStateInitialCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_BaseStateInitial<T>>
    implements _$$_BaseStateInitialCopyWith<T, $Res> {
  __$$_BaseStateInitialCopyWithImpl(_$_BaseStateInitial<T> _value,
      $Res Function(_$_BaseStateInitial<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? data = freezed,
  }) {
    return _then(_$_BaseStateInitial<T>(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_BaseStateInitial<T> implements _BaseStateInitial<T> {
  const _$_BaseStateInitial({this.isInitial = true, this.data = null});

  @override
  @JsonKey()
  final bool isInitial;
  @override
  @JsonKey()
  final T? data;

  @override
  String toString() {
    return 'BaseState<$T>.initial(isInitial: $isInitial, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseStateInitial<T> &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isInitial, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateInitialCopyWith<T, _$_BaseStateInitial<T>> get copyWith =>
      __$$_BaseStateInitialCopyWithImpl<T, _$_BaseStateInitial<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, T? data) initial,
    required TResult Function(bool isLoading, T? data) loading,
    required TResult Function(bool isLoading, T data) success,
    required TResult Function(bool isLoading, T? data, Failure failure) failure,
  }) {
    return initial(isInitial, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, T? data)? initial,
    TResult? Function(bool isLoading, T? data)? loading,
    TResult? Function(bool isLoading, T data)? success,
    TResult? Function(bool isLoading, T? data, Failure failure)? failure,
  }) {
    return initial?.call(isInitial, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, T? data)? initial,
    TResult Function(bool isLoading, T? data)? loading,
    TResult Function(bool isLoading, T data)? success,
    TResult Function(bool isLoading, T? data, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isInitial, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateSuccess<T> value) success,
    required TResult Function(_BaseStateFailure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateSuccess<T> value)? success,
    TResult? Function(_BaseStateFailure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateSuccess<T> value)? success,
    TResult Function(_BaseStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _BaseStateInitial<T> implements BaseState<T> {
  const factory _BaseStateInitial({final bool isInitial, final T? data}) =
      _$_BaseStateInitial<T>;

  bool get isInitial;
  @override
  T? get data;
  @JsonKey(ignore: true)
  _$$_BaseStateInitialCopyWith<T, _$_BaseStateInitial<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BaseStateLoadingCopyWith<T, $Res> {
  factory _$$_BaseStateLoadingCopyWith(_$_BaseStateLoading<T> value,
          $Res Function(_$_BaseStateLoading<T>) then) =
      __$$_BaseStateLoadingCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isLoading, T? data});
}

/// @nodoc
class __$$_BaseStateLoadingCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_BaseStateLoading<T>>
    implements _$$_BaseStateLoadingCopyWith<T, $Res> {
  __$$_BaseStateLoadingCopyWithImpl(_$_BaseStateLoading<T> _value,
      $Res Function(_$_BaseStateLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
  }) {
    return _then(_$_BaseStateLoading<T>(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_BaseStateLoading<T> implements _BaseStateLoading<T> {
  const _$_BaseStateLoading({this.isLoading = true, this.data = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final T? data;

  @override
  String toString() {
    return 'BaseState<$T>.loading(isLoading: $isLoading, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseStateLoading<T> &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateLoadingCopyWith<T, _$_BaseStateLoading<T>> get copyWith =>
      __$$_BaseStateLoadingCopyWithImpl<T, _$_BaseStateLoading<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, T? data) initial,
    required TResult Function(bool isLoading, T? data) loading,
    required TResult Function(bool isLoading, T data) success,
    required TResult Function(bool isLoading, T? data, Failure failure) failure,
  }) {
    return loading(isLoading, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, T? data)? initial,
    TResult? Function(bool isLoading, T? data)? loading,
    TResult? Function(bool isLoading, T data)? success,
    TResult? Function(bool isLoading, T? data, Failure failure)? failure,
  }) {
    return loading?.call(isLoading, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, T? data)? initial,
    TResult Function(bool isLoading, T? data)? loading,
    TResult Function(bool isLoading, T data)? success,
    TResult Function(bool isLoading, T? data, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isLoading, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateSuccess<T> value) success,
    required TResult Function(_BaseStateFailure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateSuccess<T> value)? success,
    TResult? Function(_BaseStateFailure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateSuccess<T> value)? success,
    TResult Function(_BaseStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _BaseStateLoading<T> implements BaseState<T> {
  const factory _BaseStateLoading({final bool isLoading, final T? data}) =
      _$_BaseStateLoading<T>;

  bool get isLoading;
  @override
  T? get data;
  @JsonKey(ignore: true)
  _$$_BaseStateLoadingCopyWith<T, _$_BaseStateLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BaseStateSuccessCopyWith<T, $Res> {
  factory _$$_BaseStateSuccessCopyWith(_$_BaseStateSuccess<T> value,
          $Res Function(_$_BaseStateSuccess<T>) then) =
      __$$_BaseStateSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isLoading, T data});
}

/// @nodoc
class __$$_BaseStateSuccessCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_BaseStateSuccess<T>>
    implements _$$_BaseStateSuccessCopyWith<T, $Res> {
  __$$_BaseStateSuccessCopyWithImpl(_$_BaseStateSuccess<T> _value,
      $Res Function(_$_BaseStateSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
  }) {
    return _then(_$_BaseStateSuccess<T>(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_BaseStateSuccess<T> implements _BaseStateSuccess<T> {
  const _$_BaseStateSuccess({this.isLoading = false, required this.data});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final T data;

  @override
  String toString() {
    return 'BaseState<$T>.success(isLoading: $isLoading, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseStateSuccess<T> &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateSuccessCopyWith<T, _$_BaseStateSuccess<T>> get copyWith =>
      __$$_BaseStateSuccessCopyWithImpl<T, _$_BaseStateSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, T? data) initial,
    required TResult Function(bool isLoading, T? data) loading,
    required TResult Function(bool isLoading, T data) success,
    required TResult Function(bool isLoading, T? data, Failure failure) failure,
  }) {
    return success(isLoading, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, T? data)? initial,
    TResult? Function(bool isLoading, T? data)? loading,
    TResult? Function(bool isLoading, T data)? success,
    TResult? Function(bool isLoading, T? data, Failure failure)? failure,
  }) {
    return success?.call(isLoading, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, T? data)? initial,
    TResult Function(bool isLoading, T? data)? loading,
    TResult Function(bool isLoading, T data)? success,
    TResult Function(bool isLoading, T? data, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(isLoading, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateSuccess<T> value) success,
    required TResult Function(_BaseStateFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateSuccess<T> value)? success,
    TResult? Function(_BaseStateFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateSuccess<T> value)? success,
    TResult Function(_BaseStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _BaseStateSuccess<T> implements BaseState<T> {
  const factory _BaseStateSuccess(
      {final bool isLoading, required final T data}) = _$_BaseStateSuccess<T>;

  bool get isLoading;
  @override
  T get data;
  @JsonKey(ignore: true)
  _$$_BaseStateSuccessCopyWith<T, _$_BaseStateSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BaseStateFailureCopyWith<T, $Res> {
  factory _$$_BaseStateFailureCopyWith(_$_BaseStateFailure<T> value,
          $Res Function(_$_BaseStateFailure<T>) then) =
      __$$_BaseStateFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isLoading, T? data, Failure failure});
}

/// @nodoc
class __$$_BaseStateFailureCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_BaseStateFailure<T>>
    implements _$$_BaseStateFailureCopyWith<T, $Res> {
  __$$_BaseStateFailureCopyWithImpl(_$_BaseStateFailure<T> _value,
      $Res Function(_$_BaseStateFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = freezed,
    Object? failure = null,
  }) {
    return _then(_$_BaseStateFailure<T>(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_BaseStateFailure<T> implements _BaseStateFailure<T> {
  const _$_BaseStateFailure(
      {this.isLoading = false, this.data = null, required this.failure});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final T? data;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'BaseState<$T>.failure(isLoading: $isLoading, data: $data, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseStateFailure<T> &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(data), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseStateFailureCopyWith<T, _$_BaseStateFailure<T>> get copyWith =>
      __$$_BaseStateFailureCopyWithImpl<T, _$_BaseStateFailure<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isInitial, T? data) initial,
    required TResult Function(bool isLoading, T? data) loading,
    required TResult Function(bool isLoading, T data) success,
    required TResult Function(bool isLoading, T? data, Failure failure) failure,
  }) {
    return failure(isLoading, data, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isInitial, T? data)? initial,
    TResult? Function(bool isLoading, T? data)? loading,
    TResult? Function(bool isLoading, T data)? success,
    TResult? Function(bool isLoading, T? data, Failure failure)? failure,
  }) {
    return failure?.call(isLoading, data, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isInitial, T? data)? initial,
    TResult Function(bool isLoading, T? data)? loading,
    TResult Function(bool isLoading, T data)? success,
    TResult Function(bool isLoading, T? data, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(isLoading, data, this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BaseStateInitial<T> value) initial,
    required TResult Function(_BaseStateLoading<T> value) loading,
    required TResult Function(_BaseStateSuccess<T> value) success,
    required TResult Function(_BaseStateFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BaseStateInitial<T> value)? initial,
    TResult? Function(_BaseStateLoading<T> value)? loading,
    TResult? Function(_BaseStateSuccess<T> value)? success,
    TResult? Function(_BaseStateFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BaseStateInitial<T> value)? initial,
    TResult Function(_BaseStateLoading<T> value)? loading,
    TResult Function(_BaseStateSuccess<T> value)? success,
    TResult Function(_BaseStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _BaseStateFailure<T> implements BaseState<T> {
  const factory _BaseStateFailure(
      {final bool isLoading,
      final T? data,
      required final Failure failure}) = _$_BaseStateFailure<T>;

  bool get isLoading;
  @override
  T? get data;
  Failure get failure;
  @JsonKey(ignore: true)
  _$$_BaseStateFailureCopyWith<T, _$_BaseStateFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
