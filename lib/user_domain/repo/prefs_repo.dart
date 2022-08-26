import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/user_domain/repo/abs_repo.dart';

class UserRepoSharedPreferences extends AbsUserRepo {
  UserRepoSharedPreferences({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  read() async {
    List<String>? data = sharedPreferences.getStringList('user');
    await Future.delayed(const Duration(seconds: 0));
    return data;
  }

  @override
  write({List<String> data = const ["", "", ""]}) async {
    await sharedPreferences.setStringList('user', data);
  }
}
