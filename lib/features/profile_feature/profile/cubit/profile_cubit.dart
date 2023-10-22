import 'package:bloc/bloc.dart';
import 'package:kreez/core/preferences/preferences.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/auth_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()){
    fetchUserData();
  }
  AuthModel? authModel;
  fetchUserData()async {
     authModel = await Preferences.instance.getUserModel2();
     emit(GettingAuthModelState());


  }




}
