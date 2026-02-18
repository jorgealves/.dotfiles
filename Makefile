

run:
	bash ./bootstrap.sh

check:
	bash -n bootstrap.sh install/*.sh lib/*.sh
	stow -n -v -d config -t "$(HOME)" zsh starship git opencode zed

security:
	PRE_COMMIT_HOME="$(PWD)/.cache/pre-commit" pre-commit run --all-files
