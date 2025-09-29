import 'package:flutter/foundation.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/example_usecase.dart';

class ExampleProvider extends ChangeNotifier {
  final GetExample getExample;

  ExampleProvider(this.getExample);

  String? message;
  bool isLoading = false;
  String? error;

  Future<void> fetchExample() async {
    isLoading = true;
    notifyListeners();

    final result = await getExample(const NoParams());
    result.fold(
      (failure) => error = 'Something went wrong',
      (data) => message = data.message,
    );

    isLoading = false;
    notifyListeners();
  }
}
