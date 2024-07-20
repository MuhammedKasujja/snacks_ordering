enum ProductCategory {
  chips,
  choco,
  list,
  nono,
}

extension ProductCategoryX on ProductCategory {
  String get name {
    if (this == ProductCategory.chips) {
      return "Chips";
    }
    if (this == ProductCategory.choco) {
      return "Choco";
    }
    if (this == ProductCategory.list) {
      return "All";
    }
    if (this == ProductCategory.nono) {
      return "Data";
    }
    return "Chips";
  }
}


enum AppState {
  initial,
  loading,
  success,
  failure,
}

extension AppStateEX on AppState {
  bool get isInitial => this == AppState.initial;

  bool get isLoading => this == AppState.loading;

  bool get isSuccess => this == AppState.success;

  bool get isFailure => this == AppState.failure;
}