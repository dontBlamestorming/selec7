import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<dynamic> getInfo() async {
    final response = await get('https://selec7.com/publish/loadJson');

    print("Response");
    print(response.body);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
