/// Base class for failures returned from repositories or use cases
abstract class Failure {
  final String message;
  const Failure({required this.message});
}

/// Server-side failures (API error responses, status code != 200)
class ServerFailure extends Failure {
  const ServerFailure({super.message = 'Server error'});
}

/// Network-related failures (no internet, connectivity issues)
class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection'});
}

/// Generic unknown failure
class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Something went wrong'});
}
