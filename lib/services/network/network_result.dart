import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_result.freezed.dart';

@freezed
sealed class NetworkResult<T> with _$NetworkResult<T> {
  const factory NetworkResult.success(T data) = Success<T>;
  const factory NetworkResult.failure(Exception error) = Failure<T>;
}
