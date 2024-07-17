import 'package:flutter/material.dart';

class DesignSystemExample extends ThemeExtension<DesignSystemExample> {  
	Color? primary;  
	Color? backgroundColor;  
	Color? textColor;  
	BoxDecoration? defaultBoxShadow;  
	List<Color>? defaultGradients;  
	TextStyle? defaultTextStyle;  
	AppBarTheme? defaultAppBarTheme;  
  
DesignSystemExample({  
	this.primary,  
	this.backgroundColor,  
	this.textColor,  
	this.defaultBoxShadow,  
	this.defaultGradients,  
	this.defaultTextStyle,  
	this.defaultAppBarTheme,  
});  
  
@override  
ThemeExtension<DesignSystemExample> copyWith({  
	Color? primary,  
	Color? backgroundColor,  
	Color? textColor,  
	BoxDecoration? defaultBoxShadow,  
	List<Color>? defaultGradients,  
	TextStyle? defaultTextStyle,  
	AppBarTheme? defaultAppBarTheme,  
}) {  
return DesignSystemExample()  
	..primary = primary ?? this.primary  
	..backgroundColor = backgroundColor ?? this.backgroundColor  
	..textColor = textColor ?? this.textColor  
	..defaultBoxShadow = defaultBoxShadow ?? this.defaultBoxShadow  
	..defaultGradients = defaultGradients ?? this.defaultGradients  
	..defaultTextStyle = defaultTextStyle ?? this.defaultTextStyle  
	..defaultAppBarTheme = defaultAppBarTheme ?? this.defaultAppBarTheme;  
}  
  
@override  
ThemeExtension<DesignSystemExample> lerp(  
covariant ThemeExtension<DesignSystemExample>? other, double t) {  
	if (other is DesignSystemExample){  
	return DesignSystemExample()  
		..primary = Color.lerp(primary, other.primary, t)  
		..backgroundColor = Color.lerp(backgroundColor, other.backgroundColor, t)  
		..textColor = Color.lerp(textColor, other.textColor, t)  
		..defaultBoxShadow = BoxDecoration.lerp(defaultBoxShadow, other.defaultBoxShadow, t)  
	..defaultGradients = defaultGradients  
	..defaultTextStyle = TextStyle.lerp(defaultTextStyle, other.defaultTextStyle, t)  
	..defaultAppBarTheme = AppBarTheme.lerp(defaultAppBarTheme, other.defaultAppBarTheme, t);  
}  
	return DesignSystemExample()  
		..primary = primary  
		..backgroundColor = backgroundColor  
		..textColor = textColor  
		..defaultBoxShadow = defaultBoxShadow  
		..defaultGradients = defaultGradients  
		..defaultTextStyle = defaultTextStyle  
		..defaultAppBarTheme = defaultAppBarTheme;  
	}  
}