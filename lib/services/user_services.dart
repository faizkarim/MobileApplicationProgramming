import './rest_service.dart';
import '../modal/userModal.dart';

class UserService {
  static final UserService _instance = UserService._constructor();
  factory UserService() {
    return _instance;
  }

  UserService._constructor();
  final rest = RestService();

  Future<List<User>> getAllUsers() async {
    final listJson = await rest.get('users');

    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  Future<User> getUser({String id}) async {
    final json = await rest.get('users/$id');
    return User.fromJson(json);
  }

  Future<User> addUser({User user}) async {
    final json = await rest.post('users', data: user.toJson());
    return User.fromJson(json);
  }

  Future<User> updateUser({String id, User u}) async {
    final json = await rest.patch('users/$id', data: u);
    return User.fromJson(json);
  }
}

