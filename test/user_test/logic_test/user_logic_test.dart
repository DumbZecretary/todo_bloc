import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/user_domain/logic/user_bloc.dart';
import 'package:todo_app/user_domain/model/events.dart';
import 'package:todo_app/user_domain/model/user_state.dart';
import 'package:todo_app/user_domain/model/user_status.dart';
import 'package:todo_app/user_domain/repo/prefs_repo.dart';

class MockUserRepo extends Mock implements UserRepoSharedPreferences {}

void main() {
  // -----------------------------------------------------------------
  group("User test reading details", () {
    late MockUserRepo mockUserRepo;
    var readEvent = ReadUserEvent();
    UserBloc userBloc() {
      return UserBloc(
          initialState: UserState.initial(), prefsRepo: mockUserRepo);
    }

    setUp(() {
      mockUserRepo = MockUserRepo();
    });

    blocTest<UserBloc, UserState>("emit new state with all user details",
        setUp: () {
          when(() => mockUserRepo.read()).thenAnswer((_) async {
            return <String>["name", "decs", ""];
          });
        },
        build: userBloc,
        act: (bloc) => bloc.add(readEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
              UserState((b) => b
                ..name = "name"
                ..decs = "decs"
                ..status = UserStatus.idle),
            ],
        verify: (_) {
          verify(() => mockUserRepo.read()).called(1);
        });
    blocTest<UserBloc, UserState>(
        "emit new state with all user details but get init state",
        setUp: () {
          when(() => mockUserRepo.read()).thenAnswer((_) async {
            return null;
          });
        },
        build: userBloc,
        act: (bloc) => bloc.add(readEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
              UserState((b) => b
                ..name = ""
                ..decs = ""
                ..status = UserStatus.idle),
            ],
        verify: (_) {
          verify(() => mockUserRepo.read()).called(1);
        });
    blocTest<UserBloc, UserState>(
        "emit new state with all user details but get error",
        setUp: () {
          when(() => mockUserRepo.read()).thenThrow(Error());
        },
        build: userBloc,
        act: (bloc) => bloc.add(readEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
            ],
        verify: (_) {
          verify(() => mockUserRepo.read()).called(1);
        });
  });
  // -----------------------------------------------------------------
  group("User test setting details", () {
    late MockUserRepo mockUserRepo;
    late SetUserDetailsUserEvent setEvent;
    UserBloc userBloc() {
      return UserBloc(
          initialState: UserState.initial(), prefsRepo: mockUserRepo);
    }

    setUp(() {
      mockUserRepo = MockUserRepo();
      setEvent = SetUserDetailsUserEvent((b) => b
        ..name = "name"
        ..desc = "desc");
    });

    blocTest<UserBloc, UserState>("emit new state with all user details",
        setUp: () {
          when(() => mockUserRepo.read()).thenAnswer((_) async {
            return <String>["name", "decs", ""];
          });
        },
        build: userBloc,
        act: (bloc) => bloc.add(setEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
              UserState((b) => b
                ..name = "name"
                ..decs = "decs"
                ..status = UserStatus.idle),
            ],
        verify: (_) {
          verify(() => mockUserRepo.read()).called(1);
        });
    blocTest<UserBloc, UserState>(
        "emit new state with all user details but get init state",
        setUp: () {
          when(() => mockUserRepo.read()).thenAnswer((_) async {
            return null;
          });
        },
        build: userBloc,
        act: (bloc) => bloc.add(setEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
              UserState((b) => b
                ..name = ""
                ..decs = ""
                ..status = UserStatus.idle),
            ],
        verify: (_) {
          verify(() => mockUserRepo.read()).called(1);
        });
    blocTest<UserBloc, UserState>(
        "emit new state with all user details but get error",
        setUp: () {
          when(() => mockUserRepo.read()).thenThrow(Error());
        },
        build: userBloc,
        act: (bloc) => bloc.add(setEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
            ],
        verify: (_) {
          verify(() => mockUserRepo.read()).called(1);
        });
  });
  // -----------------------------------------------------------------
  group("User test setting image", () {
    late MockUserRepo mockUserRepo;
    late SetUserImageUserEvent setImageEvent;
    UserBloc userBloc() {
      return UserBloc(
          initialState: UserState.initial(), prefsRepo: mockUserRepo);
    }

    setUp(() {
      mockUserRepo = MockUserRepo();
      setImageEvent = SetUserImageUserEvent((b) => b..path = "/path");
    });

    blocTest<UserBloc, UserState>("emit new state with all user details",
        setUp: () {
          when(() => mockUserRepo.read()).thenAnswer((_) async {
            return <String>["name", "decs", ""];
          });
        },
        build: userBloc,
        act: (bloc) => bloc.add(setImageEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
              UserState((b) => b
                ..path = "/path"
                ..status = UserStatus.idle),
            ],
        verify: (_) {
          verify(() => mockUserRepo.write(data: ['', '', '/path'])).called(1);
        });
    blocTest<UserBloc, UserState>(
        "emit new state with all user details but get init state",
        setUp: () {
          when(() => mockUserRepo.read()).thenAnswer((_) async {
            return null;
          });
        },
        build: userBloc,
        act: (bloc) => bloc.add(setImageEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
              UserState((b) => b
                ..path = "/path"
                ..status = UserStatus.idle),
            ],
        verify: (_) {
          verify(() => mockUserRepo.write(data: ['', '', '/path'])).called(1);
        });
    blocTest<UserBloc, UserState>(
        "emit new state with all user details but get error",
        setUp: () {
          when(() => mockUserRepo.write(data: ['', '', '/path']))
              .thenThrow(Error());
        },
        build: userBloc,
        act: (bloc) => bloc.add(setImageEvent),
        expect: () => [
              UserState((b) => b..status = UserStatus.loading),
            ],
        verify: (_) {
          verify(() => mockUserRepo.write(data: ['', '', '/path'])).called(1);
        });
  });
}
