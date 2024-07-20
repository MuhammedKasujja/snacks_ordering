import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'blocs/blocs.dart';

final sl = GetIt.instance; // sl -> service_locator

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => ProductsBloc());
  sl.registerFactory(() => CartBloc());
}

List<BlocProvider> get blocs => [
      BlocProvider<ProductsBloc>(
        create: (context) => sl<ProductsBloc>()..add(FetchProducts()),
      ),
      BlocProvider<CartBloc>(
        create: (context) => sl<CartBloc>(),
      ),
    ];

Future logout() async {
  // sl<CartBloc>().add(Logout());
  // sl<ProductsBloc>().add(ResetWallet());
}
