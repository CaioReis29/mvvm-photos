import 'package:flutter/material.dart';

class DesignSystemExample extends ThemeExtension<DesignSystemExample> {  
	Color? textColor;  
	BoxDecoration? defaultBoxShadow;  
	List<Color>? defaultGradients;  
	TextStyle? defaultTextStyle;  
  
DesignSystemExample({  
	this.textColor,  
	this.defaultBoxShadow,  
	this.defaultGradients,  
	this.defaultTextStyle,  
});  
  
@override  
ThemeExtension<DesignSystemExample> copyWith({  
	Color? textColor,  
	BoxDecoration? defaultBoxShadow,  
	List<Color>? defaultGradients,  
	TextStyle? defaultTextStyle,  
}) {  
return DesignSystemExample()  
	..textColor = textColor ?? this.textColor  
	..defaultBoxShadow = defaultBoxShadow ?? this.defaultBoxShadow  
	..defaultGradients = defaultGradients ?? this.defaultGradients  
	..defaultTextStyle = defaultTextStyle ?? this.defaultTextStyle;  
}  
  
@override  
ThemeExtension<DesignSystemExample> lerp(  
covariant ThemeExtension<DesignSystemExample>? other, double t) {  
	if (other is DesignSystemExample){  
	return DesignSystemExample()  
		..textColor = Color.lerp(textColor, other.textColor, t)  
		..defaultBoxShadow = BoxDecoration.lerp(defaultBoxShadow, other.defaultBoxShadow, t)  
	..defaultGradients = defaultGradients  
	..defaultTextStyle = TextStyle.lerp(defaultTextStyle, other.defaultTextStyle, t);  
}  
	return DesignSystemExample()  
		..textColor = textColor  
		..defaultBoxShadow = defaultBoxShadow  
		..defaultGradients = defaultGradients  
		..defaultTextStyle = defaultTextStyle;  
	}  
}