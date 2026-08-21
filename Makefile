

run:
	bash ./bootstrap.sh

security:
	PRE_COMMIT_HOME="$(PWD)/.cache/pre-commit" pre-commit run --all-files
