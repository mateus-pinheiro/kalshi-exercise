///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsFinancialWellnessTestPageEn financialWellnessTestPage = TranslationsFinancialWellnessTestPageEn._(_root);
	late final TranslationsFinancialWellnessResultPageEn financialWellnessResultPage = TranslationsFinancialWellnessResultPageEn._(_root);
	String get securityInfo => 'Your financial information is encrypted and secure. We\'ll never share or sell any of your personal data.';
	late final TranslationsFinancialWellnessEnumEn financialWellnessEnum = TranslationsFinancialWellnessEnumEn._(_root);
}

// Path: financialWellnessTestPage
class TranslationsFinancialWellnessTestPageEn {
	TranslationsFinancialWellnessTestPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	TextSpan title({required InlineSpanBuilder bold}) => TextSpan(children: [
		const TextSpan(text: 'Let\'s find out your '),
		bold('financial wellness score.'),
	]);
	late final TranslationsFinancialWellnessTestPageFormEn form = TranslationsFinancialWellnessTestPageFormEn._(_root);
}

// Path: financialWellnessResultPage
class TranslationsFinancialWellnessResultPageEn {
	TranslationsFinancialWellnessResultPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	TextSpan title({required InlineSpanBuilder bold}) => TextSpan(children: [
		const TextSpan(text: 'Here\'s your '),
		bold('financial wellness score.'),
	]);
	late final TranslationsFinancialWellnessResultPageFormEn form = TranslationsFinancialWellnessResultPageFormEn._(_root);
}

// Path: financialWellnessEnum
class TranslationsFinancialWellnessEnumEn {
	TranslationsFinancialWellnessEnumEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String text({required FinancialWellnessStatus financialWellnessStatus}) {
		switch (financialWellnessStatus) {
			case FinancialWellnessStatus.healthy:
				return 'Healthy';
			case FinancialWellnessStatus.medium:
				return 'Average';
			case FinancialWellnessStatus.low:
				return 'Unhealthy';
		}
	}
	String description({required FinancialWellnessStatus financialWellnessStatus}) {
		switch (financialWellnessStatus) {
			case FinancialWellnessStatus.healthy:
				return 'Congratulations!';
			case FinancialWellnessStatus.medium:
				return 'There is room for improvement.';
			case FinancialWellnessStatus.low:
				return 'Caution!';
		}
	}
}

// Path: financialWellnessTestPage.form
class TranslationsFinancialWellnessTestPageFormEn {
	TranslationsFinancialWellnessTestPageFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Financial wellness test';
	String get description => 'Enter your financial information below';
	String get annualIncomeField => 'Annual Income';
	String get monthlyCostsField => 'Monthly Costs';
	String get button => 'Continue';
}

// Path: financialWellnessResultPage.form
class TranslationsFinancialWellnessResultPageFormEn {
	TranslationsFinancialWellnessResultPageFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Congratulations!';
	TextSpan description({required InlineSpanBuilder bold}) => TextSpan(children: [
		const TextSpan(text: 'Your financial wellness score is '),
		bold('Healthy'),
	]);
	String get button => 'Return';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'financialWellnessTestPage.title': return ({required InlineSpanBuilder bold}) => TextSpan(children: [
				const TextSpan(text: 'Let\'s find out your '),
				bold('financial wellness score.'),
			]);
			case 'financialWellnessTestPage.form.title': return 'Financial wellness test';
			case 'financialWellnessTestPage.form.description': return 'Enter your financial information below';
			case 'financialWellnessTestPage.form.annualIncomeField': return 'Annual Income';
			case 'financialWellnessTestPage.form.monthlyCostsField': return 'Monthly Costs';
			case 'financialWellnessTestPage.form.button': return 'Continue';
			case 'financialWellnessResultPage.title': return ({required InlineSpanBuilder bold}) => TextSpan(children: [
				const TextSpan(text: 'Here\'s your '),
				bold('financial wellness score.'),
			]);
			case 'financialWellnessResultPage.form.title': return 'Congratulations!';
			case 'financialWellnessResultPage.form.description': return ({required InlineSpanBuilder bold}) => TextSpan(children: [
				const TextSpan(text: 'Your financial wellness score is '),
				bold('Healthy'),
			]);
			case 'financialWellnessResultPage.form.button': return 'Return';
			case 'securityInfo': return 'Your financial information is encrypted and secure. We\'ll never share or sell any of your personal data.';
			case 'financialWellnessEnum.text': return ({required FinancialWellnessStatus financialWellnessStatus}) {
				switch (financialWellnessStatus) {
					case FinancialWellnessStatus.healthy:
						return 'Healthy';
					case FinancialWellnessStatus.medium:
						return 'Average';
					case FinancialWellnessStatus.low:
						return 'Unhealthy';
				}
			};
			case 'financialWellnessEnum.description': return ({required FinancialWellnessStatus financialWellnessStatus}) {
				switch (financialWellnessStatus) {
					case FinancialWellnessStatus.healthy:
						return 'Congratulations!';
					case FinancialWellnessStatus.medium:
						return 'There is room for improvement.';
					case FinancialWellnessStatus.low:
						return 'Caution!';
				}
			};
			default: return null;
		}
	}
}

