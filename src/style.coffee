base =
	colors:
		dark: '#101C3E'
		light: '#FFFCFB'
		red: '#FF8674'
		green: '#71E1C2'



module.exports =
	colors: base.colors
	defaults:
		container:
			flex: 1
			alignItems: 'center'
			justifyContent: 'center'
			backgroundColor: base.colors.dark
		text:
			color: base.colors.light
		invertedText:
			color: base.colors.dark
	baseSpacingUnit: 20
	halfSpacingUnit: 10
	transitionSpeed: 300
	transitionEasing: [0.23, 1, 0.32, 1]
	transitionEasingBounce: [0.75, -0.25, 0.25, 2]
	transitionEasingSmoothBounce: [0.525, -0.2, 0.135, 1.3]
