import 'package:bookmywarehouse/common/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class RemoteRepository {
  Future<Either<Failure, Map<String, dynamic>>> fetchData(String location);
}
