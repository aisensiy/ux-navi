map_size = (map) ->
  s = 0
  for p in map
    if map[p] == true
      s += 1
  s

class @Graph
  constructor: (@data) ->

  get_children = (map, name, results) ->
    results = results || {}
    init_size = map_size(results)

    if map[name] && map[name].length
      for node in map[name]
        continue if results[node] == true
        results[node] = true
        get_children(map, node, results)

    return results

  descendants: (ancestor, results) ->
    return (k for k, v of get_children(@data, ancestor))

