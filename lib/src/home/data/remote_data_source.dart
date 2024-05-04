import 'dart:convert';

import 'package:bookmywarehouse/common/exceptions/api_excetion.dart';
import 'package:bookmywarehouse/common/failure/failure.dart';
import 'package:bookmywarehouse/models/failures/api_failure.dart';
import 'package:bookmywarehouse/models/ware_house_model.dart';
import 'package:bookmywarehouse/src/home/repository/remote_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource implements RemoteRepository {
  @override
  Future<Either<Failure, List<WareHouseModel>>> fetchData(
      String location) async {
    try {
      final response = await http.get(
          Uri.parse("https://663529759bb0df2359a3fcbe.mockapi.io/warehouse"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        final wareHouseData =
            data.map((e) => WareHouseModel.fromMap(e)).toList();

        return Right(wareHouseData);
      } else {
        throw ApiExcetion(message: "Unable to Fetch Data");
      }
    } on ApiExcetion catch (e) {
      return Left(ApiFailure(message: e.message));
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
