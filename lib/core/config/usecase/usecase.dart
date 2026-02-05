import 'resource.dart';

abstract class UseCase<T, R> {
  Future<Resource<T>> call(R param);
}

class NoParams {}
