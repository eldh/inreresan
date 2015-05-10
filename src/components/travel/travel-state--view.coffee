React = require 'react-native'
Style = require '../../style'
Reflux = require 'reflux'
TravelStore = require '../../stores/travel--store'
TravelActions = require '../../actions/travel--actions'
TravelResultView = React.createFactory require './travel-result--view'
# TravelStartView = React.createFactory require './travel-start--view'
TravelLoadingView = React.createFactory require './travel-loading--view'
# PlaceButtonsView = React.createFactory require '../place/place-buttons--view'
Header = React.createFactory require '../header--view'
# Skyline =  React.createFactory require '../../icons/skyline'

ScrollView = React.createFactory React.ScrollView
View = React.createFactory React.View
Text = React.createFactory React.Text

styles = React.StyleSheet.create
	container:
		flex: 1
		alignItems: 'stretch'
		justifyContent: 'space-between'
	flex:
		flex: 1

module.exports = React.createClass

	displayName: 'TravelStateView'

	mixins: [Reflux.ListenerMixin]

	componentWillMount: ->
		if station = @props.places[0]?.station
			TravelActions.searchTrip station

	componentDidMount: ->
		@listenTo TravelStore, @onTravelDataChange, @onTravelDataChange

	onTravelDataChange: (data) ->
		@setState data

	getInitialState: ->
		TravelStore.getDefaultData()

	getSelected: (props) ->
		props = props or @props
		props.selectedSpot or null

	render: ->
		selected = @getSelected()
		if @state.loading.travel or @state.loading.position or not @state.travelSearch
			TravelLoadingView
				query: @state.query
		else
			ScrollView {style: styles.flex},
				Header()
				TravelResultView
					travelSearch: @state.travelSearch
					query: @state.query
					loading: @state.loading
						# else if @state.travelSearch.length is 0
						# 	TravelStartView
						# 		selected: +selected
						# 		places: @props.places
						# 		performSearch: @performSearch
						# 		loading: @state.loading.travel
						# else
						# 	TravelResultView
						# 		travelSearch: @state.travelSearch
						# 		query: @state.query
						# 		loading: @state.loading
			# if @props.places
			# 	PlaceButtonsView
			# 		selected: +selected
			# 		loading: @state.loading.travel
			# 		places: @props.places
			# 		position: @props.position
			# 		performSearch: @performSearch

