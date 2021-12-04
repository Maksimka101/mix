import 'package:mix/mix.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/attributes/helpers/helper.utils.dart';
import 'package:mix/src/attributes/variants/variants.utils.dart';

/// Dynamic utilities
const xsmall = WrapFunction(VariantUtils.xsmall);
const small = WrapFunction(VariantUtils.small);
const medium = WrapFunction(VariantUtils.medium);
const large = WrapFunction(VariantUtils.large);

const portrait = WrapFunction(VariantUtils.portrait);
const landscape = WrapFunction(VariantUtils.landscape);

const dark = WrapFunction(VariantUtils.dark);

const disabled = WrapFunction(VariantUtils.disabled);
const focus = WrapFunction(VariantUtils.focused);
const hover = WrapFunction(VariantUtils.hover);
const press = WrapFunction(VariantUtils.pressing);