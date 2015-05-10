React = require 'react-native'
Style = require '../style'
Reflux = require 'reflux'
_ = require 'lodash'

PlaceStore = require '../stores/place--store'
TravelStore = require '../stores/travel--store'
{StyleSheet} = React
View = React.createFactory React.View
TabBar = React.createFactory require './TabBar'
TabBarItem = React.createFactory React.TabBarIOS.Item
TravelStateView = React.createFactory require './travel/travel-state--view'
Text = React.createFactory require './text'
TabIcon = React.createFactory require './TabIcon'


module.exports = React.createClass

	mixins: [Reflux.ListenerMixin]

	getInitialState: ->
		selectedSpot: TravelStore.getDefaultData().selectedSpot
		places: PlaceStore.getDefaultData()

	componentDidMount: ->
		@listenTo TravelStore, @onTravelDataChange, @onTravelDataChange
		@listenTo PlaceStore, @onPlaceDataChange, @onPlaceDataChange

	onPlaceDataChange: (data) ->
		console.log 'places', data
		@setState places: data

	onTravelDataChange: (data) ->
		@setState selectedSpot: data.selectedSpot

	render: ->
		View
			style: styles.container
		,
			TravelStateView
				places: @state.places
				selectedSpot: @state.selectedSpot
			TabBar places: @state.places, selected: @state.selectedSpot

styles = StyleSheet.create
	container:
		flex: 1
		flexDirection: 'column'
		alignItems: 'stretch'
		justifyContent: 'center'
			# backgroundColor: base.colors.light

