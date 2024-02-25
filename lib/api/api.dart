import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static final hostConnect =
      dotenv.env['HOST_CONNECT'] ?? "http://localhost:8080";

  static final login = "$hostConnect/auth/login";
  static final register = "$hostConnect/auth/register";
  // todo : profile
}
