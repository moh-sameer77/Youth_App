import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class OfflineFailure extends Failure {}

class PhoneAlreadyToken extends Failure {}

class EmailAlreadyToken extends Failure {}

class PleaseEnterValidEmail extends Failure {}

class UnexpectedError extends Failure {}

class MyException implements Failure {
  final String msg;
  const MyException(this.msg);
  @override
  String toString() => msg;

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}
