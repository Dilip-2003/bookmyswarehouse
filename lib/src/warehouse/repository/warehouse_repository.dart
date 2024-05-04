import 'package:bookmywarehouse/common/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class WarehouseRepository {
  Future<Either<Failure, Map<String, dynamic>>> fetchWarehouse(String uuid);
}
