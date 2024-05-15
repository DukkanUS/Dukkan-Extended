// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(limit) =>
      "Solo hay ${limit}x búsqueda de imágenes en la versión gratuita.";

  static String m1(limit) =>
      "Solo se pueden mostrar hasta ${limit} mensajes en la versión gratuita.";

  static String m2(date) => "Fecha de caducidad de la suscripción ${date}";

  static String m3(number) =>
      "Generar (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Acerca de"),
        "apply": MessageLookupByLibrary.simpleMessage("Aplicar"),
        "artist": MessageLookupByLibrary.simpleMessage("Artista"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "chat": MessageLookupByLibrary.simpleMessage("Charla"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Detalle de chat"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Chatear con Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Elige artista para tu imagen"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Elige detalle para tu imagen"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Elija el medio para su imagen"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Elija el estado de ánimo para su imagen"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Elegir caso de uso"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Elige el estilo para tu imagen"),
        "clear": MessageLookupByLibrary.simpleMessage("Claro"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "¿Estás seguro de borrar el contenido?"),
        "clearContent":
            MessageLookupByLibrary.simpleMessage("Borrar contenido"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Conversación clara"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Confirme si desea continuar con la eliminación de este elemento. No puede deshacer esta acción."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "¿Estás seguro de que deseas eliminar este artículo?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "¿Estás seguro de quitar la llave?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Contenido copiado al portapapeles"),
        "copy": MessageLookupByLibrary.simpleMessage("Dupdo"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("No se pudo crear el chat"),
        "delete": MessageLookupByLibrary.simpleMessage("Borrar"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Eliminar fallido"),
        "detail": MessageLookupByLibrary.simpleMessage("Detalle"),
        "download": MessageLookupByLibrary.simpleMessage("Descargar"),
        "edit": MessageLookupByLibrary.simpleMessage("Editar"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Error al generar"),
        "generate": MessageLookupByLibrary.simpleMessage("Generar"),
        "grid": MessageLookupByLibrary.simpleMessage("Cuadrícula"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("Generar imagen"),
        "imageSize":
            MessageLookupByLibrary.simpleMessage("Tamaño de la imagen"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Clave de entrada"),
        "interest": MessageLookupByLibrary.simpleMessage("Interesar"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Su clave API se almacena localmente en su dispositivo móvil y nunca se envía a ningún otro lugar. Puede guardar su clave para usarla más tarde. También puede quitar su llave si ya no quiere usarla."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Tecla inválida"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Puesto de trabajo"),
        "jobSkills":
            MessageLookupByLibrary.simpleMessage("Habilidades de trabajo"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Estilo de Diseño"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Escuchando..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Error al cargar la clave"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Cargar clave correcta"),
        "manage": MessageLookupByLibrary.simpleMessage("Gestionar"),
        "medium": MessageLookupByLibrary.simpleMessage("Medio"),
        "mood": MessageLookupByLibrary.simpleMessage("Estado animico"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Mas opciones"),
        "newChat": MessageLookupByLibrary.simpleMessage("Nueva conversacion"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("No se genera imagen"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Número de imágenes"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "El número de imágenes a generar. Debe estar entre 1 y 10."),
        "options": MessageLookupByLibrary.simpleMessage("Opciones"),
        "page": MessageLookupByLibrary.simpleMessage("Página"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "¡Por favor, compruebe la conexión y vuelva a intentarlo!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Por favor rellena todos los campos"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Por favor ingrese la clave"),
        "prompt": MessageLookupByLibrary.simpleMessage("Rápido"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("Pon tu llave aquí"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regenerar respuesta"),
        "remaining": MessageLookupByLibrary.simpleMessage("Restante"),
        "remove": MessageLookupByLibrary.simpleMessage("retirar"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("No se pudo quitar la clave"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Clave eliminada con éxito"),
        "reset": MessageLookupByLibrary.simpleMessage("Reiniciar"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Reiniciar ajustes"),
        "save": MessageLookupByLibrary.simpleMessage("Salvar"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Guardar clave"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Guardar clave fallida"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Clave guardada con éxito"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Buscar por solicitud..."),
        "sectionKeywords": MessageLookupByLibrary.simpleMessage(
            "Palabras clave de la sección"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Sección Tema"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Seleccionar chat fallido"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Seleccionar mensaje"),
        "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
        "share": MessageLookupByLibrary.simpleMessage("Compartir"),
        "skills": MessageLookupByLibrary.simpleMessage("Habilidades"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("¡¡¡Algo salió mal!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "¡Algo salió mal! Por favor, inténtelo de nuevo más tarde. ¡Muchas gracias!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Voz no disponible"),
        "style": MessageLookupByLibrary.simpleMessage("estilo"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Toca el micrófono para hablar"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Generar texto"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Generador de texto"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Escribe un mensaje ..."),
        "view": MessageLookupByLibrary.simpleMessage("Ver"),
        "viewType": MessageLookupByLibrary.simpleMessage("Tipo de vista"),
        "write": MessageLookupByLibrary.simpleMessage("escribir")
      };
}
