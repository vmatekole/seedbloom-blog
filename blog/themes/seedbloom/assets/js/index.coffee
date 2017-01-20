GF = {}
@mobileWidth = 768

GF.toggleMobileNav = ->
  return if $(window).width() > 768 # HACK don't toggle nav if not mobile
  $header = $('#header')
  $header.toggleClass('toggle')
#  $header.find('.navbar-toggle i').toggleClass('fa-bars').toggleClass('fa-times')


GF.resizeDiv = ->
# Header spacer
  headerHeight = $('#header').height()
  $('#spacer').css('margin-top',headerHeight)

  if $(window).width() >= mobileWidth
    $('.navbar-collapse').removeClass('animated')
  else
    $('.navbar-collapse').addClass('animated')

GF.initPage = ->
  $('[data-toggle=modal]').on 'click', (e)->
    e.preventDefault()
    id  = $(this).attr('data-target')
    $(id).modal('show')

  $('body').css('background-image',"")

  # Smooth-scroll
  #  unless _.isEmpty(window.location.hash)
  #    window.setTimeout ->
  #      $('html, body').stop().animate {scrollTop: $(window.location.hash).offset().top}, 1500, 'easeInOutExpo'
  #      $('html, body').stop().animate {scrollTop: $(window.location.hash).offset().top}, 1500, 'easeInOutExpo'
  #      ,1500

  $('.nav ul li a').click (e) ->
    $(this).parent().toggleClass 'active'
    $(this).parent().siblings().removeClass 'active'
    e.stopPropagation()

  #  $('body').click (e) ->
  #    return if $(e.target).hasClass('body-click')
  #    $('.nav ul li a').removeClass 'active'
  #    e.stopPropagation()
  window.onresize =  ->
    GF.resizeDiv()

  GF.resizeDiv()

GF.selectAnchor = ->
  hash = window.location.hash
  return unless $(hash).length > 0
  $('html,body').stop().animate {scrollTop: $(hash).offset().top - 100}, 1500, 'easeInOutExpo'


$(document).ready ->
  GF.initPage()
  $('.navbar-toggle').on 'click', ()->
    GF.toggleMobileNav()

  # Nav hides/displays on HP
  $window = $(window)
  $window.scroll ->
    collapseNav = ->
      $('#header').removeClass('toggle')
    window.setTimeout(collapseNav,250)

    if $window.scrollTop() > 0
      $('#header').addClass('sticky')
    else
      $('#header').removeClass('sticky')
