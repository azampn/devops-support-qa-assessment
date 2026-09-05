.PHONY: test coverage ui lint security check

test:
	APPNAME_ENV=test python -m pytest tests/ -q --junitxml=reports/unit-junit.xml

coverage:
	APPNAME_ENV=test python -m pytest tests/ --cov=appname --cov-report=term-missing --cov-report=xml:reports/coverage.xml --cov-report=html:reports/coverage-html

ui:
	python -m pytest tests/ui/ -q --junitxml=reports/ui-junit.xml --tracing=retain-on-failure --screenshot=only-on-failure

lint:
	python -m ruff check appname tests

security:
	python -m bandit -r appname -f json -o reports/bandit.json

check: test coverage lint security
