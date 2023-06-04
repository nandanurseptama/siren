import 'dart:async';
import 'package:siren/cores/services/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:siren/cores/failures/failure.dart';
import 'package:siren/cores/usecase/result_usecase.dart';
import 'package:siren/cores/utils/uuid_generator.dart';

/// abstract class for usecase
abstract class Usecase<Params, Result> {
  /// Uuid generator function that will generate processId for logging purpose
  final UUIDGenerator _uuidGenerator;
  final Logger _logger;

  Usecase({required UUIDGenerator uuidGenerator, required Logger logger})
      : _uuidGenerator = uuidGenerator,
        _logger = logger;

  bool isLoading = false;

  late String processId;
  Future<ResultUsecase<Result, Failure>> call(Params params) async {
    try {
      processId = _uuidGenerator();
      isLoading = true;
      var result = await calling(params);
      isLoading = false;
      return ResultUsecase.ok(result);
    } on Failure catch (e) {
      isLoading = false;
      _logger.jsonify(type: LogType.error, data: e.copyWith(processId: processId).toJson());
      return ResultUsecase.err(e.copyWith(processId: processId));
    } catch (e, st) {
      isLoading = false;
      var f = Failure(
          message: "Internal Error",
          processId: processId,
          trace: StackTrace.fromString("{err : ${e.toString()}, trace : $st}"));
      _logger.jsonify(type: LogType.error, data: f.toJson());
      return ResultUsecase.err(f);
    } finally {
      isLoading = false;
      processId = "";
    }
  }

  /// an abstraction of usecase caller
  Future<Result> calling(Params params);
}

class NoUsecaseParams extends Equatable {
  @override
  List<Object?> get props => [];
}
