import 'package:bloc/bloc.dart';

class AppBarCubit extends Cubit<double> {
  AppBarCubit() : super(0);
  void setOffset(double offset) => emit(offset);
}

//event --> bloc --> state

// in cubit we skip the events and we talk directly with the block.

// by hitting functions that we write in the block
//we only have one event that is when our scrollOffset changes
