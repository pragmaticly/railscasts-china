# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.jplayer.min

grabVideoUrl = ->
  $("meta[name=episode-url]").attr("content")

playVideo = ->
  url = grabVideoUrl()
  if url?
    $("#jquery_jplayer_1").jPlayer
      ready: ->
        $(this).jPlayer("setMedia", {
          m4v: url
        }).jPlayer('play')
      swfPath: "/assets"
      supplied: "m4v"
      size: { width: 960, height: 600 }

playControl = ->
  $("#episode .watch").one 'click', (e) ->
    $("#jp_container_1").show()
    playVideo()

$ ->
  playControl()