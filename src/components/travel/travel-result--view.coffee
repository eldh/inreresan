React = require 'react-native'
Style = require '../../style'
Reflux = require 'reflux'
TravelActions = require '../../actions/travel--actions'
SectionView = React.createFactory require './travel-section--view'
# SearchMoreView = React.createFactory require './travel-search-more--view'

styles = React.StyleSheet.create
	container:
		flex: 1
		alignItems: 'stretch'
		justifyContent: 'space-between'
		backgroundColor: Style.colors.light
	textContainer:
		flex: 1
		alignItems: 'center'
		justifyContent: 'center'
		padding: 20

View = React.createFactory React.View
Text = React.createFactory require '../text'

module.exports = React.createClass

	displayName: 'TravelResultView'

	propTypes:
		travelSearch: React.PropTypes.array.isRequired

	getInitialState:->
		openSection: null

	render: ->
		lastSearch = _.last @props.travelSearch
		return null unless lastSearch
		searchError = lastSearch?.TripList.errorCode
		if searchError?
			return @getErrorView searchError
		trip = lastSearch.TripList.Trip
		destination = _.last(trip[0].LegList.Leg).Destination.name
		console.log trip[0]
		View {style: styles.container},
			View {style: styles.textContainer},
				Text {style: fontWeight: '600'}, "Till #{destination}"
			if not @isLoading()
				_.map trip, (section, i) =>
					SectionView
						section: section
						open: @state.openSection is i + 1
						onPress: @setOpenSection i + 1
						key: section.LegList.Leg[0].Origin.time + i + destination
			# SearchMoreView loading: @props.loading


	isLoading: ->
		@props.loading.travel or @props.loading.position

	setOpenSection: (i) ->
		=>
			if @state.openSection is i then i = null
			@setState
				openSection: i

	getErrorView: (error) ->
		View {},
			Text {},
				if error is 'H895'
					'Det är snabbast att använda apostlahästarna.'
				else
					'Något gick fel. Försök igen eller åk någon annanstans.'

