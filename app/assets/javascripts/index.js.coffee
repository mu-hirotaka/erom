# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.btn-more')
    .on 'ajax:complete', (event, ajax, status) ->
      if status == 'success'
        if (ajax.responseJSON.id == 1)
          $(this).css('display', 'none')
        else
          str = '<a href="/articles/old?id=' + ajax.responseJSON.id + '"class="btn btn-success btn-block" data-remote="true">more</a>'
          $(this).html(str)
        $('#additional-article').append(ajax.responseJSON.html)
