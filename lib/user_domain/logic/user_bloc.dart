import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:todo_app/config_domain/utils/logging.dart';
import 'package:todo_app/user_domain/model/events.dart';
import 'package:todo_app/user_domain/model/user_state.dart';
import 'package:todo_app/user_domain/model/user_status.dart';
import 'package:todo_app/user_domain/repo/prefs_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepoSharedPreferences _prefsRepo;
  UserBloc(
      {required UserState initialState,
      required UserRepoSharedPreferences prefsRepo})
      : _prefsRepo = prefsRepo,
        super(initialState) {
    on<ReadUserEvent>(_onReadDetail);
    on<SetUserDetailsUserEvent>(_onSetDetail);
    on<SetUserImageUserEvent>(_onSetImage);
  }

  FutureOr<void> _onReadDetail(
      ReadUserEvent event, Emitter<UserState> emit) async {
    try {
      var loadingUserState =
          state.rebuild((p0) => p0..status = UserStatus.loading);
      emit(loadingUserState);
      List<String>? currentUserData = await _prefsRepo.read();
      currentUserData ??= ["", "", ""];
      final UserState newUserState = state.rebuild((p0) => p0
        ..name = currentUserData![0]
        ..decs = currentUserData[1]
        ..status = UserStatus.idle);
      emit(newUserState);
    } catch (e) {
      addError(Exception("set user detail (name and decs) error"),
          StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onSetDetail(
      SetUserDetailsUserEvent event, Emitter<UserState> emit) async {
    try {
      var loadingUserState =
          state.rebuild((p0) => p0..status = UserStatus.loading);
      emit(loadingUserState);
      await _prefsRepo
          .write(data: [event.name ?? "", event.desc ?? "", state.path ?? ""]);
      List<String>? currentUserData = await _prefsRepo.read();
      currentUserData ??= ["", "", ""];
      final UserState newUserState = state.rebuild((p0) => p0
        ..name = currentUserData![0]
        ..decs = currentUserData[1]
        ..status = UserStatus.idle);
      emit(newUserState);
    } catch (e) {
      addError(Exception("set user detail (name and decs) error"),
          StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onSetImage(
      SetUserImageUserEvent event, Emitter<UserState> emit) async {
    try {
      var loadingUserState =
          state.rebuild((p0) => p0..status = UserStatus.loading);
      emit(loadingUserState);
      await _prefsRepo
          .write(data: [state.name ?? "", state.decs ?? "", event.path ?? ""]);
      var newUserState = state.rebuild((p0) => p0
        ..path = event.path
        ..status = UserStatus.idle);
      emit(newUserState);
    } catch (e) {
      addError(Exception("set user detail (name and decs) error"),
          StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    DebugLogger debugLogger = DebugLogger();
    debugLogger.log('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
