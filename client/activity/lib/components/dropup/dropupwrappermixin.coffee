React          = require 'kd-react'
scrollToTarget = require 'activity/util/scrollToTarget'


module.exports =

  isActive: ->

    { items, visible } = @props
    visible ?= yes
    return items.size > 0 and visible


  hasSingleItem: -> @props.items.size is 1


  confirmSelectedItem: ->

    selectedValue = @formatSelectedValue()
    @props.onItemConfirmed? selectedValue
    @close()


  componentDidUpdate: (prevProps, prevState) ->

    { selectedItem } = @props
    return  if prevProps.selectedItem is selectedItem or not selectedItem

    containerElement = @refs.dropup.getMainElement()
    itemElement      = React.findDOMNode @refs[@getItemKey selectedItem]

    scrollToTarget containerElement, itemElement

