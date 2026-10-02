# Jouer avec ses premières bases de données

Projet SQLite comprenant la conception et la création de plusieurs bases, ainsi que des requêtes sur la base musicale Chinook.

## Fichiers du rendu

- `blog.sqlite` : utilisateurs, articles, catégories, tags et tables de liaison
- `moocademy.sqlite` : cours et leçons
- `pinterest.sqlite` : utilisateurs, pins et commentaires
- `hacking_news.sqlite` : utilisateurs, liens et commentaires hiérarchiques
- `hacking_class.sqlite` : cours et élèves
- `chinook.db` : base musicale fournie pour les exercices
- `structures.md` : description des tables et des relations
- `chinook_queries.sql` : requêtes SQL demandées

## Vérifier une base

Ouvrir une base, par exemple :

```bash
sqlite3 blog.sqlite
```

Lister ses tables :

```sql
.tables
```

Afficher leur structure :

```sql
.schema
```

Quitter SQLite :

```sql
.quit
```

## Utiliser les requêtes Chinook

Ouvrir la base téléchargée :

```bash
sqlite3 chinook.db
```

Copier ensuite les requêtes de `chinook_queries.sql` une par une dans SQLite.

La requête numéro 4 supprime des albums et les requêtes numéro 10 ajoutent des données. Il est recommandé de conserver une copie originale de `chinook.db` avant de les exécuter.

## Relations principales

- Une clé primaire (`PRIMARY KEY`) identifie une ligne de manière unique.
- Une clé étrangère (`FOREIGN KEY`) relie une table à une autre.
- Une table de liaison représente une relation plusieurs-à-plusieurs.
- Une colonne comme `user_id` ou `course_id` représente une relation un-à-plusieurs.

## État du projet

- [x] Base du blog
- [x] Base MOOCademy
- [x] Base Pinterest
- [x] Base Hacking News
- [x] Base Hacking Class
- [x] Requêtes Chinook
- [x] Documentation des structures
