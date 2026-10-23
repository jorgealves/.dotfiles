

run:
	mise run full-upgrade

security:
	PRE_COMMIT_HOME="$(PWD)/.cache/pre-commit" pre-commit run --all-files
