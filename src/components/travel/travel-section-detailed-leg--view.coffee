React = require 'react-native'
Reflux = require 'reflux'
StringUtil = require '../../utils/string-util'
TravelActions = require '../../actions/travel--actions'
TravelIcon = React.createFactory require './travel-icon'
QuietText = React.createFactory require '../quiet-text'
Text = React.createFactory require '../text'
_ = require 'lodash'

Style = require '../../style'
styles = React.StyleSheet.create
	container:
		flex: 1
		flexDirection: 'row'
		alignItems: 'flex-start'
		justifyContent: 'flex-start'
		# padding: 10
		borderTopWidth: 0.5
		borderBottomWidth: 0.5
		borderColor: '#eee'

View = React.createFactory React.View

module.exports = React.createClass

	displayName: 'SectionDetailedLegView'

	propTypes:
		section: React.PropTypes.object.isRequired
		first: React.PropTypes.bool
		last: React.PropTypes.bool
		className: React.PropTypes.string

	getDefaultProps: ->
		details: false

	render: ->
		section = @props.section
		View {style: styles.container},
			TravelIcon section: section
			View {key: 'text'},
				View {key: 'origin'},
					# Text { @props.lastSection?.Destination.time
					Text {key: 'place', style: fontWeight: '600'}, section.Origin.name
					QuietText {key: 'time'},
						section.Origin.time
					if section.line
						QuietText {}, "#{section.line} mot #{section.dir}"

					View {key: 'between'}, Text {}, ' '
					QuietText {key: 'desttime'}, section.Destination.time
					if @props.last
							Text {key: 'destplace', style: fontWeight: '600'}, section.Destination.name
