import './rest_service.dart';
import '../modal/userModal.dart';

class UserService {
  static final UserService _instance = UserService._constructor();
  factory UserService() {
    return _instance;
  }

  UserService._constructor();
  final rest = RestService();

  Future<User> getUser({String id}) async {
    final json = await rest.patch('users/$id');

    return User.fromJson(json);
  }

  Future<User> addUser({User n}) async {
    final json = await rest.post('users', data: n.toJson());
    return User.fromJson(json);
  }

  Future<User> updateUser({String id, User u}) async {
    final json = await rest.patch('users/$id', data: u.toJson());
    return User.fromJson(json);
  }
}
