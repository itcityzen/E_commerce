import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/address repository.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressRepository addressRepository;
  AddressCubit(this.addressRepository) : super(AddressInitial());
  Future getCurrentLocationData() async {
    emit(AddressLoading());
    try {
      var Result = await addressRepository.getCurrentLocation();
      emit(AddressSuccess(Result));
    } catch (e) {
      emit(AddressError('Error in Get Address $e'));
    }
  }
}
