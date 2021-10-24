// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'simple_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SimpleBlocStateTearOff {
  const _$SimpleBlocStateTearOff();

  _Idle<D> idle<D>() {
    return _Idle<D>();
  }

  _Progress<D> inProgress<D>() {
    return _Progress<D>();
  }

  _Completed<D> completed<D>(Either<ErrorAndStackTrace, D> either) {
    return _Completed<D>(
      either,
    );
  }
}

/// @nodoc
const $SimpleBlocState = _$SimpleBlocStateTearOff();

/// @nodoc
mixin _$SimpleBlocState<D> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() inProgress,
    required TResult Function(Either<ErrorAndStackTrace, D> either) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(Either<ErrorAndStackTrace, D> either)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(Either<ErrorAndStackTrace, D> either)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle<D> value) idle,
    required TResult Function(_Progress<D> value) inProgress,
    required TResult Function(_Completed<D> value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle<D> value)? idle,
    TResult Function(_Progress<D> value)? inProgress,
    TResult Function(_Completed<D> value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle<D> value)? idle,
    TResult Function(_Progress<D> value)? inProgress,
    TResult Function(_Completed<D> value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleBlocStateCopyWith<D, $Res> {
  factory $SimpleBlocStateCopyWith(
          SimpleBlocState<D> value, $Res Function(SimpleBlocState<D>) then) =
      _$SimpleBlocStateCopyWithImpl<D, $Res>;
}

/// @nodoc
class _$SimpleBlocStateCopyWithImpl<D, $Res>
    implements $SimpleBlocStateCopyWith<D, $Res> {
  _$SimpleBlocStateCopyWithImpl(this._value, this._then);

  final SimpleBlocState<D> _value;
  // ignore: unused_field
  final $Res Function(SimpleBlocState<D>) _then;
}

/// @nodoc
abstract class _$IdleCopyWith<D, $Res> {
  factory _$IdleCopyWith(_Idle<D> value, $Res Function(_Idle<D>) then) =
      __$IdleCopyWithImpl<D, $Res>;
}

/// @nodoc
class __$IdleCopyWithImpl<D, $Res>
    extends _$SimpleBlocStateCopyWithImpl<D, $Res>
    implements _$IdleCopyWith<D, $Res> {
  __$IdleCopyWithImpl(_Idle<D> _value, $Res Function(_Idle<D>) _then)
      : super(_value, (v) => _then(v as _Idle<D>));

  @override
  _Idle<D> get _value => super._value as _Idle<D>;
}

/// @nodoc

class _$_Idle<D> implements _Idle<D> {
  const _$_Idle();

  @override
  String toString() {
    return 'SimpleBlocState<$D>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Idle<D>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() inProgress,
    required TResult Function(Either<ErrorAndStackTrace, D> either) completed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(Either<ErrorAndStackTrace, D> either)? completed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(Either<ErrorAndStackTrace, D> either)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle<D> value) idle,
    required TResult Function(_Progress<D> value) inProgress,
    required TResult Function(_Completed<D> value) completed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle<D> value)? idle,
    TResult Function(_Progress<D> value)? inProgress,
    TResult Function(_Completed<D> value)? completed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle<D> value)? idle,
    TResult Function(_Progress<D> value)? inProgress,
    TResult Function(_Completed<D> value)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle<D> implements SimpleBlocState<D> {
  const factory _Idle() = _$_Idle<D>;
}

/// @nodoc
abstract class _$ProgressCopyWith<D, $Res> {
  factory _$ProgressCopyWith(
          _Progress<D> value, $Res Function(_Progress<D>) then) =
      __$ProgressCopyWithImpl<D, $Res>;
}

/// @nodoc
class __$ProgressCopyWithImpl<D, $Res>
    extends _$SimpleBlocStateCopyWithImpl<D, $Res>
    implements _$ProgressCopyWith<D, $Res> {
  __$ProgressCopyWithImpl(
      _Progress<D> _value, $Res Function(_Progress<D>) _then)
      : super(_value, (v) => _then(v as _Progress<D>));

  @override
  _Progress<D> get _value => super._value as _Progress<D>;
}

/// @nodoc

class _$_Progress<D> implements _Progress<D> {
  const _$_Progress();

  @override
  String toString() {
    return 'SimpleBlocState<$D>.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Progress<D>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() inProgress,
    required TResult Function(Either<ErrorAndStackTrace, D> either) completed,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(Either<ErrorAndStackTrace, D> either)? completed,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(Either<ErrorAndStackTrace, D> either)? completed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle<D> value) idle,
    required TResult Function(_Progress<D> value) inProgress,
    required TResult Function(_Completed<D> value) completed,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle<D> value)? idle,
    TResult Function(_Progress<D> value)? inProgress,
    TResult Function(_Completed<D> value)? completed,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle<D> value)? idle,
    TResult Function(_Progress<D> value)? inProgress,
    TResult Function(_Completed<D> value)? completed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _Progress<D> implements SimpleBlocState<D> {
  const factory _Progress() = _$_Progress<D>;
}

/// @nodoc
abstract class _$CompletedCopyWith<D, $Res> {
  factory _$CompletedCopyWith(
          _Completed<D> value, $Res Function(_Completed<D>) then) =
      __$CompletedCopyWithImpl<D, $Res>;
  $Res call({Either<ErrorAndStackTrace, D> either});
}

/// @nodoc
class __$CompletedCopyWithImpl<D, $Res>
    extends _$SimpleBlocStateCopyWithImpl<D, $Res>
    implements _$CompletedCopyWith<D, $Res> {
  __$CompletedCopyWithImpl(
      _Completed<D> _value, $Res Function(_Completed<D>) _then)
      : super(_value, (v) => _then(v as _Completed<D>));

  @override
  _Completed<D> get _value => super._value as _Completed<D>;

  @override
  $Res call({
    Object? either = freezed,
  }) {
    return _then(_Completed<D>(
      either == freezed
          ? _value.either
          : either // ignore: cast_nullable_to_non_nullable
              as Either<ErrorAndStackTrace, D>,
    ));
  }
}

/// @nodoc

class _$_Completed<D> implements _Completed<D> {
  const _$_Completed(this.either);

  @override
  final Either<ErrorAndStackTrace, D> either;

  @override
  String toString() {
    return 'SimpleBlocState<$D>.completed(either: $either)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Completed<D> &&
            (identical(other.either, either) || other.either == either));
  }

  @override
  int get hashCode => Object.hash(runtimeType, either);

  @JsonKey(ignore: true)
  @override
  _$CompletedCopyWith<D, _Completed<D>> get copyWith =>
      __$CompletedCopyWithImpl<D, _Completed<D>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() inProgress,
    required TResult Function(Either<ErrorAndStackTrace, D> either) completed,
  }) {
    return completed(either);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(Either<ErrorAndStackTrace, D> either)? completed,
  }) {
    return completed?.call(either);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(Either<ErrorAndStackTrace, D> either)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(either);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle<D> value) idle,
    required TResult Function(_Progress<D> value) inProgress,
    required TResult Function(_Completed<D> value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle<D> value)? idle,
    TResult Function(_Progress<D> value)? inProgress,
    TResult Function(_Completed<D> value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle<D> value)? idle,
    TResult Function(_Progress<D> value)? inProgress,
    TResult Function(_Completed<D> value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed<D> implements SimpleBlocState<D> {
  const factory _Completed(Either<ErrorAndStackTrace, D> either) =
      _$_Completed<D>;

  Either<ErrorAndStackTrace, D> get either;
  @JsonKey(ignore: true)
  _$CompletedCopyWith<D, _Completed<D>> get copyWith =>
      throw _privateConstructorUsedError;
}
