React = require 'react-native'
Style = require '../../style'
Reflux = require 'reflux'
TravelActions = require '../../actions/travel--actions'
DetailedLegView = React.createFactory require './travel-section-detailed-leg--view'

styles = React.StyleSheet.create
	container:
		flex: 1
		padding: 10
		alignItems: 'stretch'
		justifyContent: 'space-between'
		backgroundColor: '#f1f1f1'
		borderTopWidth: 0.5
		borderBottomWidth: 0.5
		borderColor: '#eee'
	section:
		flex: 1
		alignItems: 'stretch'
		justifyContent: 'space-between'
		flexDirection: 'row'
		backgroundColor: '#aaa'


View = React.createFactory React.View

module.exports = React.createClass

	displayName: 'SectionOpenView'

	propTypes:
		section: React.PropTypes.object.isRequired

	render: ->
		legList = @props.section.LegList
		View {style: styles.container},
			_.map legList, (segmentArr) ->
				segmentArr = _.filter segmentArr, (segment, i) ->
					(segment.Origin.name isnt segment.Destination.name) and not (i is 0 and segment.type is 'WALK')
				_.map segmentArr, (segment, i) ->
					DetailedLegView
						section: segment
						nextSection: segmentArr[i + 1]
						lastSection: segmentArr[i - 1]
						first: i is 0
						last: i is segmentArr.length - 1
