React = require 'react-native'
Reflux = require 'reflux'
TravelActions = require '../../actions/travel--actions'
# Button = React.createFactory require '../../viewcomponents/button'
# Icon = React.createFactory require '../../icons/icon'
_ = require 'lodash'

module.exports = React.createClass

	displayName: 'TravelStartView'

	propTypes:
		query: React.PropTypes.object
		performSearch: React.PropTypes.func.isRequired

	render: ->
		realPlaces = _.find @props.places, (place) -> place.station?
		View {style: styles.container},
			if realPlaces
				[
					Text {key: 'header'}, 'Vart vill du åka idag?'
					View {style: styles.container, key: 'places'},
						_.map @props.places, (place, i) =>
							Text {}, place.station.Name
							# if place.icon
							# 	Button
							# 		onClick: @onClick
							# 		selected: @props.selected is i
							# 		key: '' + i + place.icon + place.spot
							# 		className: 'start-page__button'
							# 		dataset:
							# 			station: i
							# 	,
							# 		Icon {name: place.icon}
							# 		place.station.Name
				]
			else
					View {style: styles.container, key: 'no-places'},
						'Resan börjar här.'
						# Icon name: 'arrow-down', className: 'icon--l'

	onClick: (e) ->
		index = e.currentTarget.dataset.station
		if @props.places[index]?.station

			# We need to force the search if we are already on the route. But don't search if we're already searching.
			if +index is +@props.selected and not @props.loading
				@props.performSearch @props
			# Else the route mechanism will handle the search
			else
				@transitionTo 'travel', {spot: index}
		else
			@transitionTo 'place/search', {spot: index}, {create: true}
