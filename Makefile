check_coverage:
	flutter test --coverage && genhtml coverage/lcov.info --output=coverage
open_coverage:
	open coverage/index.html
raw_fix_lint:
	dart fix --dry-run
fix_lint:
	dart fix --apply
gen:
	flutter packages pub run build_runner build --delete-conflicting-outputs