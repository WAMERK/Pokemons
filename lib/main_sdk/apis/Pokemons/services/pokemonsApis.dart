import 'package:pokemon/main_sdk/apis/core/models/common/message_model.dart';
import 'package:pokemon/main_sdk/apis/core/models/common/result_class.dart';
import 'package:pokemon/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:pokemon/main_sdk/enum/http_enum.dart';

class PokemonsApi extends ApiModelIdentity {
  Future<ResponseState<MessageModel>> getPokemons() async {
    return apiMethod(
      'pokemon?limit=1000&offset=0',
      httpEnum: HttpEnum.get,
      parseJson: (json) => MessageModel.fromJson(json),
    );
  }
}
