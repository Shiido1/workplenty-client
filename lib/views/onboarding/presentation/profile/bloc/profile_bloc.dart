import 'package:bloc/bloc.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/views/onboarding/domain/entity/profile/profile_entity.dart';
import 'package:client/views/onboarding/domain/usecases/profile_usecases.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCases _useCase;

  ProfileBloc(this._useCase) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      /// Bio event
      if (event is BioProfileUpdate) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateProfileBio(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Location event
      if (event is LocationProfileUpdate) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateLocationBio(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }

      /// Avatar event
      if (event is AvatarProfileUpdate) {
        try {
          emit(ProfileLoading());
          final _response =
              await _useCase.updateAvatarBio(Params(entity: event.entity));
          _response!.fold(
              (l) => emit(ProfileFailed(message: l.errorMessage(l)!)),
              (r) => emit(ProfileSuccess(response: r)));
        } catch (e) {
          emit(ProfileFailed(message: e.toString()));
        }
      }
    });
  }
}
