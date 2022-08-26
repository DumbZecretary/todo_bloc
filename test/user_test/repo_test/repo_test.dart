import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/user_domain/repo/prefs_repo.dart';

void main() {
  group("User Repo Shared_Preferences test", () {
    late UserRepoSharedPreferences userRepoSharedPreferences;
    Map<String, Object> values = <String, Object>{
      'name': 'name',
      'desc': 'desc',
      'path': '/path'
    };
    SharedPreferences.setMockInitialValues(values);
    late SharedPreferences sharedPreferences;
    setUp(() async {
      sharedPreferences = await SharedPreferences.getInstance();
      userRepoSharedPreferences =
          UserRepoSharedPreferences(sharedPreferences: sharedPreferences);
    });

    test("repo user read", () async {
      var data = await userRepoSharedPreferences.read();
      expect(data.toString(), isNotNull);
    });
    test("repo user write", () async {
      var data = await userRepoSharedPreferences.write();
      expect(data.toString(), isNotNull);
    });
  });
}
