
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global/bloc/global_bloc.dart';

///定义全局的BlocProvider
final provider = [
  BlocProvider<GlobalBloc>(
    create: (context) => GlobalBloc(),
  ),
];
