base =
	colors:
		dark: '#101C3E'
		light: '#FFFCFB'
		quiet: '#777'
		red: '#FF8674'
		green: '#71E1C2'



module.exports =
	colors: base.colors
	defaults:
		flex:
			flex: 1
		container:
			flex: 1
			alignItems: 'flex-start'
			justifyContent: 'space-between'
			# backgroundColor: base.colors.light
		text:
			color: base.colors.dark
		invertedText:
			color: base.colors.dark
	baseSpacingUnit: 20
	halfSpacingUnit: 10
	transitionSpeed: 300
	transitionEasing: [0.23, 1, 0.32, 1]
	transitionEasingBounce: [0.75, -0.25, 0.25, 2]
	transitionEasingSmoothBounce: [0.525, -0.2, 0.135, 1.3]
