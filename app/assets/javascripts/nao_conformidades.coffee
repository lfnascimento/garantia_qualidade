filling_select_itens_options = ->
  checklist = $("#nao_conformidade_checklist").val()
  url = "/get_checklist_itens"
  $.ajax(url: url, data: {checklist_id: checklist}).done (html) ->
    $("#item_id").html html

$ ->
  $(document).on 'change', "#nao_conformidade_checklist", filling_select_itens_options
