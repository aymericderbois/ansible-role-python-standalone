# Ansible Role: Python Standalone

[![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/aymericderbois/ansible-role-python-standalone/blob/master/LICENSE)

Installe Python via [python-build-standalone][pbs] pour des installations
Python optimisées et portables.

[pbs]: https://github.com/astral-sh/python-build-standalone

## Présentation

Ce rôle Ansible permet d'installer Python en utilisant les builds
standalone maintenus par Astral. Ces builds sont optimisés avec PGO
(Profile-Guided Optimization) et LTO (Link-Time Optimization) pour de
meilleures performances.

L'installation se fait dans
`/opt/python/{{ python_standalone_version }}/`.

## Plateformes supportées

- Debian 11 (Bullseye)
- Debian 12 (Bookworm)

## Utilisation

### Installation basique

```yaml
- hosts: servers
  become: true
  roles:
    - aymericderbois.python_standalone
```

### Avec variables personnalisées

```yaml
- hosts: servers
  become: true
  roles:
    - role: aymericderbois.python_standalone
      vars:
        python_standalone_version: "3.12.7"
        python_standalone_release: "20250918"
        python_standalone_owner: "root"
        python_standalone_group: "root"
```

## Variables principales

| Variable                       | Défaut                     | Description    |
|--------------------------------|----------------------------|----------------|
| `python_standalone_version`    | `3.13.7`                   | Version Python |
| `python_standalone_release`    | `20250918`                 | Release PBS    |
| `python_standalone_arch`       | `x86_64-unknown-linux-gnu` | Architecture   |
| `python_standalone_build_type` | `pgo+lto-full`             | Type de build  |
| `python_standalone_owner`      | `debian`                   | Utilisateur    |
| `python_standalone_group`      | `debian`                   | Groupe         |
| `python_standalone_dir_mode`   | `0755`                     | Permissions    |

Voir `defaults/main.yml` pour toutes les variables disponibles.

## Emplacement d'installation

Python est installé dans
`/opt/python/{{ python_standalone_version }}/`

Pour utiliser le Python installé :

```bash
/opt/python/3.13.7/bin/python3 --version
```

## Tests

### Prérequis

```bash
# Créer un environnement virtuel (recommandé)
python3 -m venv venv && source venv/bin/activate

# Installer les dépendances
pip install -r requirements.txt
```

### Lancer les tests

```bash
make lint        # Linters (yamllint + ansible-lint)
make test        # Tests Molecule (Debian 12)
make test-all    # Tests complets (Debian 11 + 12)
```

## Versions de Python disponibles

Consultez les [releases python-build-standalone][pbs-releases] pour
connaître les versions disponibles.

[pbs-releases]: https://github.com/astral-sh/python-build-standalone/releases

## Licence

MIT - [aymericderbois](https://github.com/aymericderbois)

## Liens utiles

- [Repository GitHub][pbs]
- [Documentation][pbs-docs]

[pbs-docs]: https://python-build-standalone.readthedocs.io/
