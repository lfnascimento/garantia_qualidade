filling_select_itens_options = ->
  aplicacao = $("#nao_conformidade_aplicacao_id").val()
  url_itens = "/get_checklist_itens"
  url_responsaveis = "/get_responsaveis"

  $.ajax(url: url_itens, data: {aplicacao_id: aplicacao}).done (html) ->
    $("#nao_conformidade_item_id").html html
  $.ajax(url: url_responsaveis, data: {aplicacao_id: aplicacao}).done (html) ->
    $("#nao_conformidade_user_id").html html
$ ->
  $(document).on 'change', "#nao_conformidade_aplicacao_id", filling_select_itens_options
