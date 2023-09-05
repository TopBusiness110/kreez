import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:kreez/core/models/register_response_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/login_error_model.dart';
import '../../../../core/remote/service.dart';
import '../../../../core/utils/dialogs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.api) : super(RegisterInitial()){

  }
  final ServiceApi api;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late CountryCode selectedCountryCode;

 late RegisterResponseModel registerResponseModel;
  late LoginErrorModel loginErrorModel ;

  register(BuildContext context) async {
    loadingDialog();
    final response = await api.postRegister(fullNameController.text, passwordController.text,phoneController.text,emailController.text);
    response.fold(
            (l) {
          Navigator.pop(context);
          emit(RegisterFailureState());

        },
            (r) {
          Navigator.pop(context);
          if(r.result==null){
            emit(RegisterFailureState());
          //  loginErrorModel = r as LoginErrorModel;

          }
          else{

            emit(RegisterSuccessState());
            Navigator.pop(context);
            registerResponseModel = r;

          }

        });
  }
}
