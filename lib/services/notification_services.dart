import './rest_service.dart';
import '../modal/notificationModal.dart';

class NotificationService {
  static final NotificationService _instance =
      NotificationService._constructor();
  factory NotificationService() {
    return _instance;
  }

  NotificationService._constructor();
  final rest = RestService();

  Future<List<Notifications>> getAllNotifications() async {
    final listJson = await rest.get('notifications');

    return (listJson as List)
        .map((itemJson) => Notifications.fromJson(itemJson))
        .toList();
  }

  Future<Notifications> addNotifications({Notifications n}) async {
    final json = await rest.post('notifications', data: n.toJson());
    return Notifications.fromJson(json);
  }

  Future<Notifications> updateNotifications({String id, bool read}) async {
    final json = await rest.patch('notifications/$id', data: {'read': !read});
    return Notifications.fromJson(json);
  }

  Future<Notifications> deleteNotifications({String id}) async {
    final json = await rest.delete('notifications/$id');
    return Notifications.fromJson(json);
  }
}
