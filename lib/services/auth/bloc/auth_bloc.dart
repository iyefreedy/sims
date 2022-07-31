import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sims/models/auth_user.dart';
import 'package:sims/services/auth/auth_provider.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(const AuthStateUninitialized(isLoading: true)) {
    // Initialize app
    on<AuthEventInitialize>((event, emit) async {
      await provider.initialize();

      final user = provider.currentUser;
      if (user == null) {
        emit(AuthStateLoggedOut(
          exception: null,
          isLoading: false,
        ));
      } else if (!user.isEmailVerified) {
        emit(AuthStateNeedsVerification(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      }
    });

    // Login event
    on<AuthEventLogin>((event, emit) async {
      emit(
        AuthStateLoggedOut(
          exception: null,
          isLoading: true,
          loadingText: 'Mohon tunggu sebentar',
        ),
      );

      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.logIn(email: email, password: password);

        if (!user.isEmailVerified) {
          emit(
            AuthStateLoggedOut(
              exception: null,
              isLoading: false,
            ),
          );
          emit(AuthStateNeedsVerification(isLoading: false));
        } else {
          emit(
            AuthStateLoggedOut(
              exception: null,
              isLoading: false,
            ),
          );
          emit(AuthStateLoggedIn(
            user: user,
            isLoading: false,
          ));
        }
      } on Exception catch (e) {
        emit(
          AuthStateLoggedOut(
            exception: e,
            isLoading: false,
          ),
        );
      }
    });

    // Logout event
    on<AuthEventLogOut>((event, emit) async {
      try {
        await provider.logOut();
        emit(
          AuthStateLoggedOut(
            exception: null,
            isLoading: false,
          ),
        );
      } on Exception catch (e) {
        emit(
          AuthStateLoggedOut(
            exception: e,
            isLoading: false,
          ),
        );
      }
    });

    // Should register event
    on<AuthEventShouldRegister>((event, emit) {
      final role = event.role;
      emit(AuthStateRegistering(
        role: role,
        isLoading: false,
        exception: null,
      ));
    });

    // Register event
    on<AuthEventRegister>((event, emit) async {
      final role = event.role;
      final uniqueNumber = event.uniqueNumber;
      final email = event.email;
      final password = event.password;

      try {
        await provider.createUser(
          role: role,
          uniqueNumber: uniqueNumber,
          email: email,
          password: password,
        );

        await provider.sendEmailVerification();
        emit(AuthStateNeedsVerification(isLoading: false));
      } on Exception catch (e) {
        emit(AuthStateRegistering(
          role: role,
          exception: e,
          isLoading: false,
        ));
      }
    });

    // Send email verification event
    on<AuthEventSendEmailVerification>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    });
  }
}
