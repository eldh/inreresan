React = require 'react-native'
Reflux = require 'reflux'
TravelActions = require '../../actions/travel--actions'

Style = require '../../style'
styles = React.StyleSheet.create Style.defaults

View = React.createFactory React.View
Text = React.createFactory require '../text'

module.exports = React.createClass

	displayName: 'TravelSearchMoreView'

	propTypes:
		loading: React.PropTypes.object.isRequired

	render: ->
		View
			className: 'travel-sections__more'
			onPress: @onPress
		,
			if @props.loading.more
				View {className: 'loading-page__spinner'}
			else
				'Hämta fler resor'

	onPress: ->
		unless @props.loading.more
			TravelActions.searchMore()
