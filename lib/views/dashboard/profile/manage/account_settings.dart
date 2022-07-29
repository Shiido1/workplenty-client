import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/utils/workplenty_dialog.dart';
import '../../../../core/database/session_manager.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/entity/user/user.dart';
import '../../../../core/helper/utils/pallets.dart';
import '../../../../core/helper/utils/validators.dart';
import '../../../onboarding/domain/entity/profile/profile_entity.dart';
import '../../../onboarding/presentation/profile/bloc/profile_bloc.dart';
import '../../../widgets/body_widget.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/edit_form_widget.dart';

class AccountSettings extends StatefulWidget {
  AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _usernameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  TextEditingController? _userTypeController;

  final _bloc = ProfileBloc(inject());
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _initializeController();
    super.initState();
  }

  void _initializeController() {
    final _user = User.fromJson(SessionManager.instance.usersData);
    _firstNameController = TextEditingController(text: _user.firstName ?? '');
    _lastNameController = TextEditingController(text: _user.lastName ?? '');
    _usernameController = TextEditingController(text: _user.username ?? '');
    _emailController = TextEditingController(text: _user.email ?? '');
    _phoneController = TextEditingController(text: _user.phone ?? '');
    _userTypeController = TextEditingController(text: _user.role ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: defaultAppBar2(context,
            title: 'Account Settings',
            centerTitle: true,
            textColor: Pallets.white),
        body: BlocListener<ProfileBloc, ProfileState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is ProfileLoading) {
              WorkPlenty.showLoading(context, _loadingKey, '');
            }
            if (state is ProfileSuccess) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.success(
                  state.response?.msg ?? 'Bio Updated Successfully');
            }
            if (state is ProfileFailed) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.error(state.message);
            }
          },
          child: Form(
            key: _formKey,
            child: BodyWidget(
                child: Stack(
              children: [
                ListView(
                  children: [
                    EditFormField(
                      controller: _firstNameController,
                      validator: Validators.validateString(),
                      decoration: _getDecoration('First Name', dropDown: false),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _lastNameController,
                      validator: Validators.validateString(),
                      decoration: _getDecoration('Last Name', dropDown: false),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _usernameController,
                      validator: Validators.validateString(),
                      decoration: _getDecoration('Username', dropDown: false),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _emailController,
                      validator: Validators.validateEmail(),
                      readOnly: false,
                      decoration:
                          _getDecoration('Email Address', dropDown: false),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _phoneController,
                      validator: Validators.validatePhone(),
                      keyboardType: TextInputType.number,
                      decoration:
                          _getDecoration('Phone Number', dropDown: false),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _userTypeController,
                      readOnly: true,
                      validator: Validators.validateString(),
                      decoration: _getDecoration('User Type', dropDown: true),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonWidget(
                        buttonText: 'Save Details',
                        onPressed: () => _saveDetails())),
              ],
            )),
          ),
        ));
  }

  _getDecoration(String hint, {bool? dropDown}) {
    return InputDecoration(
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        disabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Pallets.grey)),
        labelText: hint,
        suffixIcon: dropDown! ? Icon(Icons.keyboard_arrow_down) : null);
  }

  void _saveDetails() {
    _bloc.add(UpdateAccount(ProfileEntity(
      firstName: _firstNameController!.text,
      lastName: _lastNameController!.text,
      username: _usernameController!.text,
      role: _userTypeController!.text.toLowerCase(),
      email: _emailController!.text,
    )));
  }
}
