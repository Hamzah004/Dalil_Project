import 'package:dalil_project/core/errors/failure.dart';
import 'package:dalil_project/core/strings.dart';

String mapFailureToMessage(Failure failure) {
  if (failure is ServerFailure) {
    return SERVER_FAILURE_MESSAGE;
  } else if (failure is OfflineFailure) {
    return OFFLINE_FAILURE_MESSAGE;
  } else {
    return "Unexpected Error. Please try again later.";
  }
}
