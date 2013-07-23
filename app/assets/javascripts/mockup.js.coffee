class TagFilter
  constructor: (@container_selector, @tag_container_selector, @toggle_class) ->
    click_tag_event = (e) =>
      e.preventDefault()
      $this = $(e.currentTarget)

      $this.toggleClass(@toggle_class)
      $selected_tags = @$tag_container.find("li a.#{@toggle_class}")
      selected_tags = $.map $selected_tags, (elem) -> $(elem).text()

      console.log selected_tags
      selector = $.map(selected_tags, (elem) -> ".#{elem}").join(', ')

      @$container.isotope
        masonry:
          columnWidth: 120
        filter: selector

    console.log 'init tag filter'

    @$container = $(@container_selector)
    @$tag_container = $(@tag_container_selector)

    @$tag_container.find('ul.tags li a').click(click_tag_event)



$ ->
  $('#container').isotope
    masonry:
      columnWidth: 120

  tag_filter = new TagFilter('#container', '.tags-container', 'disabled')
