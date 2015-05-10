React = require 'react-native'
Reflux = require 'reflux'
TravelActions = require '../../actions/travel--actions'
SectionOpenView = React.createFactory require './travel-section-open--view'
SectionClosedView = React.createFactory require './travel-section-closed--view'
Text = React.createFactory require '../text'
_ = require 'lodash'

Style = require '../../style'
styles = React.StyleSheet.create
	container:
		flex: 1
		alignItems: 'stretch'
		justifyContent: 'space-between'


View = React.createFactory React.View
TouchableHighlight = React.createFactory React.TouchableHighlight
LayoutAnimation = React.LayoutAnimation

module.exports = React.createClass

	displayName: 'TravelSectionView'

	propTypes:
		section: React.PropTypes.object.isRequired
		setSomethingOpen: React.PropTypes.func

	getInitialState: ->
		open: false

	componentWillReceiveProps: (newProps) ->
		@setState(@getInitialState()) unless _.isEqual newProps.section, @props.section

	render: ->
		TouchableHighlight
			onPress: @onPress
			activeOpactiy: 0
			underlayColor: 'transparent'
		,
			View
				style: styles.container
			,
				if @props.open
					SectionOpenView
						section: @props.section
						key: 'open'
				else
					SectionClosedView
						section: @props.section
						key: 'closed'
	onPress: ->
		@props.onPress?()
		LayoutAnimation.configureNext animations.layout.spring

animations = layout:
	spring:
		duration: 400
		create:
			duration: 400
			type: LayoutAnimation.Types.linear
			property: LayoutAnimation.Properties.opacity
		update:
			type: LayoutAnimation.Types.spring
			springDamping: 0.8
	easeInEaseOut:
		duration: 300
		create:
			duration: 300
			type: LayoutAnimation.Types.easeInEaseOut
			property: LayoutAnimation.Properties.opacity
		update:
			# delay: 100
			duration: 300
			type: LayoutAnimation.Types.easeInEaseOut
