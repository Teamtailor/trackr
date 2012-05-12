# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.start-tracking').click (evt)->
    domain = $('#domain').val().trim()
    if domain.length == 0
      evt.preventDefault()
      $('#domain').val('').focus()
