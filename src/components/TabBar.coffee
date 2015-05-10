React = require 'react-native'
Style = require '../style'
_ = require 'lodash'

{StyleSheet} = React
View = React.createFactory React.View
TabIcon = React.createFactory require './TabIcon'


module.exports = React.createClass

	render: ->
		{selected} = @props
		View
			style: styles.tabBar
		,
			_.map @props.places, (place) ->
				TabIcon
					name: place.station.Name
					selected: (+selected is +place.spot)
					icon: place.icon
					key: +place.spot
					id: +place.spot

styles = StyleSheet.create
	tabBar:
		# flex: 1
		height: 49
		flexDirection: 'row'
		alignSelf: 'stretch'
		alignItems: 'center'
		justifyContent: 'space-around'
		backgroundColor: Style.colors.dark

