import 'package:local_auth/local_auth.dart';

class AuthService {
  Future<bool> login() async {
    final LocalAuthentication auth = LocalAuthentication();

    final bool didAuthenticate = await auth.authenticate(
      localizedReason: 'Please authenticate to enter',
    );

    if (didAuthenticate) {
      return true;
    }

    return false;
  }
}
