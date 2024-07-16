::base-fix::
        ToDo::> search for base-fix to resolve any flux bugs and-or common issues.
::force update feature::
ToDo::>
        set appName and iosAppId in CustomConstants.dart.
        search for force update feature usages regions.
-----------------------------------------------------------------
::auto apply coupons feature::
ToDo::>
        set useFirstAutoAppliedCoupon in CustomConstants.dart.
        search for auto apply coupons feature usages regions.
-----------------------------------------------------------------
::firebase analytics feature::
ToDo::>
        search for firebase analytics feature usages regions.
-----------------------------------------------------------------
::custom checkout v2::
the default flux handling is to get the saved country and state but if there is
no value the default value for each in env.dart will be used (defaultCountryISOCode and defaultStateISOCode)
after that a loadStates is called to load the states.

when change the country  the states List will reset with new loadStates and setState is called.
then the build will called and renderState will called in this function they will check
if the saved State value exists in new States List or not
but they does not reset the State value to null thus when you select country and state
then change the country and tap on next no validation will appear and the state value
is the old one.
SO::>
            the first thing to do is to reset the address.state to null in the render state function
            if there is no matching value.
            or simply make the state drop down a FormDropDown with validation
            iff the state is required
            else reset the value.

            then we need to overwrite the country with value from our custom source
                note that if you overwrite the country
                and the user can change it you need to change the country source value(in UserModel in this APP.)
                so the new value will be shown when save the address or go next and back
                as the name says "overwrite".
                ex: if the user change the country to 'newCountry' then save the address
                or go next then back the 'newCountry' will not shown the SourceValue(in this APP the source is user model.country)
                will be shown



            then we need make the states support arabic language by adding custom field 'nameAr' and read it
            ( search for (added to support arabic language) and do not forget to add config->states->state_iso2code.json).

            then we need to hide the city field and make the city same as state by set the value in (on next) before the validation.
            ( search for (to make the city same as state same)).

            note if you want to support arabic language in country you need to make a json with
            all supported countries in english arabic and mapping the iso code in countryPicker to
            the suitable name.




            note that the load state is take time as if the there is no local states it will request api
            you can disable the api request to escape any QA notes for handling the delay(throw Exception('no need to re request states if not found in local');).




            important note:
            the custom fields values will be fetched and save to address when
            the form is saved (_formKey.currentState!.save()).
            thus you may notice a previous value before this line
            it looks strange but there is no issue as if the previous value invalid
            the validation will not continue.

            in  lib\screens\checkout\widgets\shipping_address_extension.dart
                    print(address?.toJson());
                    _formKey.currentState!.save();
                    print(address?.toJson());
            ex: country ->oldCountry go next (first print will return old and the second print also).
            then go back change the country to 'newCountry' go next-> (first print('old') second print('new'))

            but as i said no issue (if the old value is invalid a validation is required) thats why the first time both will return same value
            because the old value is invalid and the user is forced to change it.

ToDo::>
      simply
                copy-past lib\screens\checkout\widgets\shipping_address_extension.dart
                copy-past lib/screens/checkout/widgets/shipping_address.dart
      change these keys-values in env.dart
                "DefaultCountryISOCode": "ISO2Code".
                "DefaultStateISOCodeADDED-TO-BE-NULL": "no need as the key change so flux will read it as null not empty string".

      then support arabic language by
                adding 'nameAr' in each state json for each country
                ex:for jordan: add new json in config->states->state_iso2code(jo).json.
                search for -> added to support arabic language.

      don't forget addressFields in DefaultConfig-> lib/common/config/default_env.dart.
      and not that you may need to clean for the json state.


      NOTE:


-----------------------------------------------------------------
::custom price feature::
ToDo::>
    1.save your product.dart fro later usages.
    2.rename price to customPrice,regularPrice to customRegularPrice and sale price to in product.dart.
    3.copy(the original product.dart)-paste it in product.dart.
    4.search for custom price feature usages regions, you will find two usages:
        a.settings screen for logout.(to rebuild the home screen).
        b.login screen for login.(to rebuild the home screen).



