React = require 'react-native'
Reflux = require 'reflux'
LegView = React.createFactory require './travel-section-leg--view'
_ = require 'lodash'

Style = require '../../style'

View = React.createFactory React.View
Text = React.createFactory React.Text
styles = React.StyleSheet.create
	container:
		flex: 1
		padding: 10
		alignItems: 'stretch'
		justifyContent: 'space-between'
		backgroundColor: '#f7f7f7'
		borderTopWidth: 0.5
		borderBottomWidth: 0.5
		borderColor: '#eee'
	section:
		flex: 1
		alignItems: 'stretch'
		justifyContent: 'space-between'
		flexDirection: 'row'

module.exports = React.createClass

	displayName: 'SectionClosedView'

	propTypes:
		section: React.PropTypes.object.isRequired

	render: ->
		section = _.find @props.section.LegList.Leg, (seg) ->
			seg.line?
		View {style: styles.container},
			LegView
				section: _.assign {}, section, dur: @props.section.dur


