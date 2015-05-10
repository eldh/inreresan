React = require 'react-native'
Style = require '../style'
Reflux = require 'reflux'
_ = require 'lodash'
color = require 'tinycolor2'

PlaceStore = require '../stores/place--store'
TravelActions = require '../actions/travel--actions'
{StyleSheet} = React
View = React.createFactory React.View
TabBar = React.createFactory React.TabBarIOS
TabBarItem = React.createFactory React.TabBarIOS.Item
TravelStateView = React.createFactory require './travel/travel-state--view'
Icon = React.createFactory require 'react-native-icons'
InvertedText = React.createFactory require './inverted-text'
TouchableHighlight = React.createFactory React.TouchableHighlight

iconsize = 30


module.exports = React.createClass

	render: ->
		styles = React.StyleSheet.create
			icon:
				width: iconsize
				height: iconsize
				margin: 2
			container:
				flex: 1
				flexDirection: 'column'
				justifyContent: 'center'
				alignItems: 'center'
				height: 49
				backgroundColor: (if @props.selected then color(Style.colors.dark).lighten().toString() else null)
		TouchableHighlight
			onPress: @onPress
			activeOpactiy: 0
			style: styles.container
			underlayColor: 'transparent'
		,
			View {style: styles.container},
				Icon
					name: @props.icon
					size: iconsize
					color: Style.colors.light
					style: styles.icon
				InvertedText {style: {fontSize: 10 }}, @props.name

	onPress: ->
		console.log 'onPress', @props.name, @props.id
		TravelActions.setSelectedSpot @props.id
