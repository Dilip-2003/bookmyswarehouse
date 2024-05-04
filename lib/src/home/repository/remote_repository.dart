import 'package:bookmywarehouse/common/failure/failure.dart';
import 'package:bookmywarehouse/models/ware_house_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class RemoteRepository {
  Future<Either<Failure, List<WareHouseModel>>> fetchData(String location);
}
