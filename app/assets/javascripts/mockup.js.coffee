class TagFilter
  constructor: (@container_selector, @tag_container_selector, @toggle_class) ->
    console.log 'init tag filter'

    @$container = $(@container_selector)
    @$tag_container = $(@tag_container_selector)

  get_selector: () ->
    $selected_tags = @$tag_container.find("li a.#{@toggle_class}")
    selected_tags = $.map $selected_tags, (elem) -> $(elem).text()

    console.log selected_tags
    selector = $.map(selected_tags, (elem) -> ".#{elem}").join('')

  bind_event: (event_callback) ->
    @$tag_container.find('ul.tags li a').click (e) =>
      e.preventDefault()
      $this = $(e.currentTarget)
      $this.toggleClass(@toggle_class)
      event_callback()

class SearchFilter
  constructor: (@container_selector, @input_field) ->
    @$container = $(@container_selector)
    @$input = $(@input_field)

  get_selector: () ->
    if @$input.val() then ":contains('#{@$input.val()}')" else ''

  bind_event: (event_callback) ->
    object = this
    @$input.keyup (e) =>
      self = e.currentTarget
      self.timeout = setTimeout () ->
        clearTimeout(self.timeout) if self.timeout
        event_callback()
        console.log object.$input.val()
        object.$container.find('.item').each () ->
          $(this).removeHighlight()
        object.$container.find('.item').each () ->
          $(this).highlight(object.$input.val()) if object.$input.val().length
      ,
      500

$ ->

  tag_filter = new TagFilter('#container', '.tags-container', 'disabled')
  search_filter = new SearchFilter('#container', '.navbar-search :text')

  item_filter = () ->
    selector = tag_filter.get_selector() + search_filter.get_selector()
    console.log selector
    $('#container').isotope
      masonry:
        columnWidth: 120
      filter: selector

  tag_filter.bind_event(item_filter)
  search_filter.bind_event(item_filter)

  $('#container').isotope
    itemSelector : '.item'
    masonry:
      columnWidth: 120

  # setTimeout(
  #   () -> $('#container').isotope('reLayout')
  #   ,
  #   100
  # )
