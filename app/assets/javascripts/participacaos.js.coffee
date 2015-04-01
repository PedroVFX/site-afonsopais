# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# MENU
scrollIntervalID = undefined
stickIt = undefined


# DOCUMENT READY (onload/change) - No final deste doc existe a chamada a var func ready
ready = ->
  # Stiki Menu - Necessario adicionar o clone no carregamento da pag, para a existir na DOM
  $('.menu').addClass('original').clone().insertAfter('.menu').addClass('cloned').css('position', 'fixed').css('top', '0').css('margin-top', '0').css('z-index', '500').removeClass('original').hide()

  # MENU: Chama a funcao que ja tem os elementos carregados na DOM
  scrollIntervalID = setInterval(stickIt, 10)

# FUNCAO PARA O MENU
stickIt = ->
  coordsOrgElement = undefined
  leftOrgElement = undefined
  orgElement = undefined
  orgElementPos = undefined
  orgElementTop = undefined
  widthOrgElement = undefined
  orgElementPos = $('.original').offset()
  orgElementTop = orgElementPos.top



  if $(window).scrollTop() >= orgElementTop
    orgElement = $('.original')
    coordsOrgElement = orgElement.offset()
    leftOrgElement = coordsOrgElement.left
    widthOrgElement = orgElement.css('width')
    $('.cloned').css('left', leftOrgElement + 'px').css('top', 0).css('width', widthOrgElement).show()
    $('.original').css 'visibility', 'hidden'
  else
    $('.cloned').hide()
    $('.original').css 'visibility', 'visible'

# Maneira de garantir a funcionalidade $(document).ready() do js, exemplo codepen. Depois
# eh so passar de js para coffee com o js2coffee
# ---------------------------------------------------------------------------------------
$(document).ready(ready)
$(document).on('page:change', ready)
