Array.prototype.uniq = () ->
  map = {}
  map[elem] = true for elem in this

  return (k for k, v of map)

class_sanitize = (classname) ->
  classname.replace(/[\ \/]/g, '-').toLowerCase()

load_graph = (url) ->
  $.getJSON(url, (data) ->
    window.graph = new Graph(data)
  )

load_graph('/navi/graph')

class TopWordController
  constructor: (@container_selector, @sub_container_selector, @toggle_class) ->
    console.log 'init word ctrl'
    @$container = $(@container_selector)
    @$subcontainer = $(@sub_container_selector)

  show_sub_words = (word, $subcontainer) ->
    descendants = window.graph.descendants(word)
    lis = ("<li><a href=\"#\">#{word}</a></li>" for word in descendants when word.constructor != Function)
    $subcontainer.find('ul').html(lis.join('\n'))


  bind_event: (event_callback) ->
    @$container.find('li a').click (e) =>
      e.preventDefault()
      $this = $(e.currentTarget)
      @$container.find('li a').removeClass(@toggle_class)
      $this.addClass @toggle_class
      show_sub_words($this.text(), @$subcontainer)
      event_callback && event_callback()


class TagFilter
  constructor: (@container_selector, @tag_container_selector, @toggle_class) ->
    console.log 'init tag filter'

    @$container = $(@container_selector)
    @$tag_container = $(@tag_container_selector)

  get_selector: (stratergy) ->
    $selected_tags = @$tag_container.find("li a.#{@toggle_class}")
    selected_tags = $.map $selected_tags, (elem) -> class_sanitize($(elem).text())
    console.log 'selected tags: ' + selected_tags
    return stratergy(selected_tags)

  bind_event: (event_callback) ->
    _event = (e) =>
      e.preventDefault()
      $this = $(e.currentTarget)
      event_callback($this)

    @$tag_container.on('click', '.tags li a', _event)

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


  topword_controller = new TopWordController('.topwords', '.subwords', 'disabled')
  topword_controller.bind_event(() ->)

  subword_filter = new TagFilter('#container', '.subwords', 'disabled')
  topword_filter = new TagFilter('#container', '.topwords', 'disabled')
  search_filter = new SearchFilter('#container', '.navbar-search :text')

  item_filter = () ->
    top_selectors = topword_filter.get_selector((selected_tags) ->
      results = []
      for selector in selected_tags
        results = results.concat(window.graph.descendants(selector))
        results.push(selector)

      console.log 'descendants: ' + results

      selector = $.map(results, (elem) -> ".#{class_sanitize(elem)}")
    )

    sub_selectors = subword_filter.get_selector((selected_tags) ->
      selector = $.map(selected_tags, (elem) -> ".#{elem}")
    )

    if sub_selectors.length
      selector = sub_selectors.join(' ')
    else
      selector = top_selectors.join(', ')

    console.log selector
    $('#container').isotope
      masonry:
        columnWidth: 260
      filter: selector

  topword_filter.bind_event(item_filter)
  subword_filter.bind_event(($elem) ->
    $elem.toggleClass('disabled')
    item_filter()
  )
  search_filter.bind_event(item_filter)

  $('#container').isotope
    itemSelector : '.item'
    masonry:
      columnWidth: 260

  # setTimeout(
  #   () -> $('#container').isotope('reLayout')
  #   ,
  #   100
  # )
