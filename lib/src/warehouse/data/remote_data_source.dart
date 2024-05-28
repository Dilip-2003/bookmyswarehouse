import 'dart:convert';

import 'package:bookmywarehouse/common/exceptions/api_excetion.dart';
import 'package:bookmywarehouse/common/failure/failure.dart';
import 'package:bookmywarehouse/models/failures/api_failure.dart';
import 'package:bookmywarehouse/src/warehouse/repository/warehouse_repository.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource implements WarehouseRepository {
  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchWarehouse(
      String uuid) async {
    try {
      final response = await http.get(
          Uri.parse("https://663529759bb0df2359a3fcbe.mockapi.io/warehouse"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Right(data);
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
