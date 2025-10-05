# Instructions pour les agents IA

## Installation des dépendances Python

**IMPORTANT**: Ne jamais installer les requirements de manière globale avec `--system` ou équivalent.

Toujours utiliser un environnement virtuel pour installer les dépendances Python listées dans `requirements.txt`.

### Avec uv (recommandé)

```bash
# Créer et activer un environnement virtuel
uv venv
source .venv/bin/activate

# Installer les dépendances
uv pip install -r requirements.txt
```

### Commandes disponibles

- `make lint` : Lancer yamllint et ansible-lint
- `make test` : Lancer les tests Molecule
- `make test-all` : Lancer tous les tests Debian
