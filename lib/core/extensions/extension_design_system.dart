import 'package:flutter/material.dart';
import 'package:mvvm_example/core/themes/design_system.dart';

extension DesignSystemExtension on BuildContext {  
	DesignSystemExample? get designSystem => Theme.of(this).extension<DesignSystemExample>();  
}