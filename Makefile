.PHONY: help lint test test-all

help: ## Afficher cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

lint: ## Lancer les linters (yamllint et ansible-lint)
	yamllint .
	ansible-lint

test: ## Lancer les tests Molecule (Debian 12 par défaut)
	molecule test

test-all: ## Lancer tous les tests Debian
	MOLECULE_DISTRO=debian11 molecule test
	MOLECULE_DISTRO=debian12 molecule test
