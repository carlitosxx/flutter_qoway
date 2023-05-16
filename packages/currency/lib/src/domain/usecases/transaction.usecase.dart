import 'package:core/core.dart';
import 'package:currency/src/domain/repositories/currency.repository.dart';
import 'package:database/database.dart';

/// caso de uso de transaction
class TransactionUC {
  /// constructor
  TransactionUC(this.currencyRepository);

  /// propiedad
  final CurrencyRepository currencyRepository;

  /// metodo para utilizar en el bloc con el mismo nombre del caso de uso
  Future<Either<HttpRequestFailure, int>> call(Movimiento transaction) async {
    return currencyRepository.addTransaction(transaction);
  }
}
