# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
  $(".finish_step").click((e)->
    todo_id = $(@).attr("data-todo_id")
    step_id = $(@).attr("data-step_id")
    $.ajax(
      url: "/todos/#{todo_id}/steps/#{step_id}"
      type: "put"
      data: {"step[completed]": true}
      accept: "json"
      success: (data, textStatus, xhr)->
        debugger
      error: (data) ->
        debugger
    )
  )
)