# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.coffee.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#modal_nao_conformidade').on 'show.bs.modal', (event) ->
    $('#resposta_registrar_nc').html('')
    $('#nao_conformidade_descricao').val('')
    $('#nao_conformidade_origem').val('')
    $('#nao_conformidade_prazo').val('')
    $('#nao_confomidade_user_id').val('')
    $('#new_nao_conformidade').show()
    button = $(event.relatedTarget)
    item_desc = button.data('item-descricao')
    $('#item_modal_para').text(item_desc)
    item_id = button.data('item-id')
    $('#nao_conformidade_item_id').val(item_id)
