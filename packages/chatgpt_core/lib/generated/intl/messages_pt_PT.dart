// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_PT locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt_PT';

  static String m0(limit) =>
      "Há apenas ${limit}x pesquisa de imagens na versão gratuita.";

  static String m1(limit) =>
      "Até ${limit} mensagens só podem ser exibidas na versão gratuita.";

  static String m2(date) => "Data de expiração da assinatura ${date}";

  static String m3(number) =>
      "Gerar (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Sobre"),
        "apply": MessageLookupByLibrary.simpleMessage("Aplique"),
        "artist": MessageLookupByLibrary.simpleMessage("Artista"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "chat": MessageLookupByLibrary.simpleMessage("Bate-papo"),
        "chatDetail":
            MessageLookupByLibrary.simpleMessage("Detalhes do bate-papo"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Bate-papo GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Bate-papo com bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Escolha o artista para sua imagem"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Escolha os detalhes da sua imagem"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Escolha o meio para sua imagem"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Escolha o humor para sua imagem"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Escolha o caso de uso"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Escolha o estilo para sua imagem"),
        "clear": MessageLookupByLibrary.simpleMessage("Claro"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de que deseja limpar o conteúdo?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Limpar conteúdo"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Limpar conversa"),
        "confirm": MessageLookupByLibrary.simpleMessage("confirme"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Confirme se deseja prosseguir com a exclusão deste item. Você não pode desfazer esta ação."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de que deseja excluir este item?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Tem certeza de remover a chave?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Conteúdo copiado para a área de transferência"),
        "copy": MessageLookupByLibrary.simpleMessage("cópia de"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Falha ao criar bate-papo"),
        "delete": MessageLookupByLibrary.simpleMessage("Excluir"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Falha na exclusão"),
        "detail": MessageLookupByLibrary.simpleMessage("Detalhe"),
        "download": MessageLookupByLibrary.simpleMessage("Baixar"),
        "edit": MessageLookupByLibrary.simpleMessage("Editar"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Falha ao gerar"),
        "generate": MessageLookupByLibrary.simpleMessage("Gerar"),
        "grid": MessageLookupByLibrary.simpleMessage("Grade"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Geração de imagem"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Tamanho da imagem"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Chave de entrada"),
        "interest": MessageLookupByLibrary.simpleMessage("Interesse"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Sua chave de API é armazenada localmente em seu celular e nunca é enviada para nenhum outro lugar. Você pode salvar sua chave para usá-la mais tarde. Você também pode remover sua chave se não quiser mais usá-la."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Chave Inválida"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Cargo de Trabalho"),
        "jobSkills":
            MessageLookupByLibrary.simpleMessage("Habilidades de trabalho"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Estilo de Layout"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Audição..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Falha ao Carregar Chave"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Carregar chave com sucesso"),
        "manage": MessageLookupByLibrary.simpleMessage("gerir"),
        "medium": MessageLookupByLibrary.simpleMessage("Médio"),
        "mood": MessageLookupByLibrary.simpleMessage("Humor"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Mais opções"),
        "newChat": MessageLookupByLibrary.simpleMessage("Novo chat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Nenhuma imagem gerada"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Número de Imagens"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "O número de imagens a serem geradas. Deve estar entre 1 e 10."),
        "options": MessageLookupByLibrary.simpleMessage("Opções"),
        "page": MessageLookupByLibrary.simpleMessage("Página"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Por favor verifique sua conexão e tente novamente!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Por favor preencha todos os campos"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Insira a chave"),
        "prompt": MessageLookupByLibrary.simpleMessage("Pronto"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Coloque sua chave aqui"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regenerar resposta"),
        "remaining": MessageLookupByLibrary.simpleMessage("Restante"),
        "remove": MessageLookupByLibrary.simpleMessage("Remover"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Falha na remoção da chave"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Chave removida com sucesso"),
        "reset": MessageLookupByLibrary.simpleMessage("Restabelecer"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Redefinir configurações"),
        "save": MessageLookupByLibrary.simpleMessage("Salve "),
        "saveKey": MessageLookupByLibrary.simpleMessage("Salvar chave"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Falha ao salvar chave"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Chave salva com sucesso"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Pesquise por indicação..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Palavras-chave da seção"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Tópico da Seção"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Falha ao selecionar bate-papo"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Selecionar prompt"),
        "settings": MessageLookupByLibrary.simpleMessage("Definições"),
        "share": MessageLookupByLibrary.simpleMessage("Compartilhar"),
        "skills": MessageLookupByLibrary.simpleMessage("habilidades"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Algo deu errado!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Algo deu errado! Por favor, tente novamente mais tarde. Muito obrigado!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Discurso não disponível"),
        "style": MessageLookupByLibrary.simpleMessage("Estilo"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Toque no microfone para falar"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Gerar texto"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Gerador de texto"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Digite uma mensagem..."),
        "view": MessageLookupByLibrary.simpleMessage("Visão"),
        "viewType":
            MessageLookupByLibrary.simpleMessage("Tipo de visualização"),
        "write": MessageLookupByLibrary.simpleMessage("Escrever")
      };
}
