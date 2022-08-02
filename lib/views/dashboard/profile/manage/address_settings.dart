import 'package:client/core/database/session_manager.dart';
import 'package:client/core/helper/routes/navigation.dart';
import 'package:client/views/onboarding/data/model/address_model.dart';
import 'package:client/views/onboarding/data/model/location_response/datum.dart';
import 'package:client/views/widgets/cities.dart';
import 'package:client/views/widgets/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/utils/workplenty_dialog.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/helper/utils/pallets.dart';
import '../../../onboarding/domain/entity/address/address_entity.dart';
import '../../../onboarding/presentation/profile/bloc/profile_bloc.dart';
import '../../../widgets/body_widget.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/edit_form_widget.dart';
import '../../../widgets/state.dart';

class AddressSettings extends StatefulWidget {
  AddressSettings({Key? key}) : super(key: key);

  @override
  _AddressSettingsState createState() => _AddressSettingsState();
}

class _AddressSettingsState extends State<AddressSettings> {
  final _bloc = ProfileBloc(inject());
  final _loadingKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _countryController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _suitController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();

  Datum? _country, _state;

  @override
  void initState() {
    _address();
    super.initState();
  }

  void _address() {
    final _user = Data.fromJson(SessionManager.instance.addressData);
    _countryController = TextEditingController(text: _user.country ?? '');
    _stateController = TextEditingController(text: _user.state ?? '');
    _streetController = TextEditingController(text: _user.address ?? '');
    _suitController = TextEditingController(text: _user.apartmentNo ?? '');
    _cityController = TextEditingController(text: _user.city ?? '');
    _postalCodeController = TextEditingController(text: _user.zipCode ?? '');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: defaultAppBar2(context,
            title: 'Address Settings',
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
                  state.response?.msg ?? 'Address Updated Successfully');
            }
            if (state is ProfileFailed) {
              WorkPlenty.hideLoading(_loadingKey);
              WorkPlenty.error(state.message);
            }
          },
          child: BodyWidget(
              child: Form(
            key: _formKey,
            child: Stack(
              children: [
                ListView(
                  children: [
                    // SizedBox(height: 55.h),
                    EditFormField(
                      decoration: _getDecoration('Country', dropDown: true),
                      controller: _countryController,
                      readOnly: true,
                      onTapped: () => PageRouter.gotoWidget(Country(onTap: (v) {
                        _country = v;
                        _countryController.text = _country?.name ?? '';
                        setState(() {});
                      }), context),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      decoration: _getDecoration('State', dropDown: true),
                      readOnly: true,
                      controller: _stateController,
                      onTapped: () =>
                          PageRouter.gotoWidget(StatesLocation(onTap: (v) {
                        _state = v;
                        _stateController.text = _state?.name ?? '';
                        setState(() {});
                      }), context),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _streetController,
                      decoration:
                          _getDecoration('Street Address', dropDown: false),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _suitController,
                      decoration:
                          _getDecoration('Apt./ Suite', dropDown: false),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _cityController,
                      decoration: _getDecoration('City', dropDown: false),
                    ),
                    SizedBox(height: 20.h),
                    EditFormField(
                      controller: _postalCodeController,
                      decoration:
                          _getDecoration('ZIP/Postal Code', dropDown: true),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonWidget(
                        buttonText: 'Save Details',
                        onPressed: () => _update())),
              ],
            ),
          )),
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

  void _update() {
    _bloc.add(UpdateAddress(AddressEntity(
        countryID: _country?.id,
        stateID: _state?.id,
        address: _streetController.text,
        apartmentNo: _suitController.text,
        zipCode: _postalCodeController.text,
        city: _cityController.text)));
  }
}
