import 'package:bookmywarehouse/common/failure/failure.dart';
import 'package:bookmywarehouse/src/home/pages/chat_screen.dart';
import 'package:fpdart/fpdart.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchChats(
      String agentId, String uuid);
}
