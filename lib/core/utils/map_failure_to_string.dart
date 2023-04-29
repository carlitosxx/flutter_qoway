// import 'package:vgp_cliente/app/core/errors/http_request_failure.dart';

import 'package:security/security.dart';

String mapFailureToString(HttpRequestFailure failure) {
  return failure.when(
    network: () => 'Hubo un problema de red',
    notFound: () => 'El recurso no fue encontrado',
    server: () => 'Hubo un problema en el servidor',
    unauthorized: () => 'No estas autorizado',
    // badRequest: (error) {
    //   if (error.message is String) {
    //     return error.message;
    //   }
    //   if (error.message is List) {
    //     String errorMessage = error.message.join("\n");
    //     return errorMessage;
    //   }
    //   return 'no se encontro el mensaje de error';
    // },
    local: () => 'Hubo un problema local o desconocido',
  );
}
