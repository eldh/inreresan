React = require 'react-native'
Style = require '../style'
Reflux = require 'reflux'
_ = require 'lodash'

PlaceStore = require '../stores/place--store'
{StyleSheet} = React
View = React.createFactory React.View
TabBar = React.createFactory React.TabBarIOS
TabBarItem = React.createFactory React.TabBarIOS.Item
TravelStateView = React.createFactory require './travel/travel-state--view'
Text = React.createFactory React.Text


module.exports = React.createClass

	mixins: [Reflux.ListenerMixin]

	getInitialState: ->
		selectedTab: 'history'
		places: PlaceStore.getDefaultData()

	componentDidMount: ->
		@listenTo PlaceStore, @onPlaceDataChange, @onPlaceDataChange

	onPlaceDataChange: (data) ->
		@setState
			places: data

	render: ->
		console.log @state
		TabBar {},
			_.map ['history', 'more'], (name, i) =>
				@getTabBarItem name, _.capitalize(name), name, i


	getTabBarItem: (name, title, icon, i) ->
		style =
			flex: 1
			# width: 200
			# height: 100
			justifyContent: 'center'
			alignItems: 'center'
			backgroundColor: (if name is 'history' then Style.colors.red else Style.colors.green)
		TabBarItem
			title: title
			systemIcon: icon
			key: name
			selected: @state.selectedTab is name
			onPress: => @setState selectedTab: name
		,
			TravelStateView
				places: @state.places
				params:
					spot: '' + i

			# View {style},
			# 	Text {style: styles.invertedText}, title



styles = StyleSheet.create Style.defaults
# textStyles = StyleSheet.create Style.defaults.text

