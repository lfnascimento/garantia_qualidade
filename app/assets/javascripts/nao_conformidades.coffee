# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#nao_conformidade_checklist").change (e) ->
    e.preventDefault()
    checklist = $("#nao_conformidade_checklist").val()
    console.log(checklist)
    url = "/checklists/#{checklist}/get_checklist_items"
    console.log(url)
    #$.get url, (data) ->
      #console.log(data)
      #$("#item_id").html data
    $.ajax(url: url).done (html) ->
      $("#item_id").html html

#(function(){
#var city_id = $(this).val();
#url = '/cities/'+city_id+'/get_neighbor_checkboxes';
#$.get(url, function(data){$('#checkbox_div').html(data)});
#});