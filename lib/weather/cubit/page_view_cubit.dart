import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class PageViewCubit extends Cubit<int> {
  int currentIndex = 0;
  PageViewCubit() : super(0);


  //

  void changePageIndex(){
    if (state <2 ){
      emit(state + 1);
    }else if(state == 2){
      emit(state - 1);
    }
  }
  void setCurrentPageIndex(int index){
    emit(index);
  }
}
