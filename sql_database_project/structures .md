# Structure des bases de données

Ce document décrit les tables, leurs colonnes et leurs relations pour les cinq applications du projet.

## 1. Blog

### Table `users`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `name` : TEXT, obligatoire

### Table `articles`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `title` : TEXT, obligatoire
- `content` : TEXT, obligatoire
- `user_id` : INTEGER, obligatoire, clé étrangère vers `users(id)`

### Table `categories`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `title` : TEXT, obligatoire

### Table `tags`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `title` : TEXT, obligatoire
- `color` : TEXT, obligatoire

### Table de liaison `article_categories`

- `article_id` : INTEGER, obligatoire, clé étrangère vers `articles(id)`
- `category_id` : INTEGER, obligatoire, clé étrangère vers `categories(id)`
- clé primaire composée : (`article_id`, `category_id`)

### Table de liaison `category_tags`

- `category_id` : INTEGER, obligatoire, clé étrangère vers `categories(id)`
- `tag_id` : INTEGER, obligatoire, clé étrangère vers `tags(id)`
- clé primaire composée : (`category_id`, `tag_id`)

### Relations

- Un utilisateur peut écrire plusieurs articles ; un article possède un seul auteur.
- Un article peut appartenir à plusieurs catégories et une catégorie peut contenir plusieurs articles.
- Une catégorie peut posséder plusieurs tags et un tag peut être associé à plusieurs catégories.

## 2. MOOCademy

### Table `courses`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `title` : TEXT, obligatoire
- `description` : TEXT, obligatoire

### Table `lessons`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `title` : TEXT, obligatoire
- `body` : TEXT, obligatoire
- `course_id` : INTEGER, obligatoire, clé étrangère vers `courses(id)`

### Relation

Un cours peut contenir plusieurs leçons ; une leçon appartient à un seul cours.

## 3. The Hacking Pinterest

### Table `users`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `name` : TEXT, obligatoire

### Table `pins`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `image_url` : TEXT, obligatoire
- `user_id` : INTEGER, obligatoire, clé étrangère vers `users(id)`

### Table `comments`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `content` : TEXT, obligatoire
- `user_id` : INTEGER, obligatoire, clé étrangère vers `users(id)`
- `pin_id` : INTEGER, obligatoire, clé étrangère vers `pins(id)`

### Relations

- Un utilisateur peut créer plusieurs pins ; un pin appartient à un seul utilisateur.
- Un utilisateur peut écrire plusieurs commentaires.
- Un pin peut recevoir plusieurs commentaires.
- Un commentaire vise uniquement un pin : il ne possède pas de `parent_comment_id`.

## 4. The Hacking News

### Table `users`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `name` : TEXT, obligatoire

### Table `links`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `url` : TEXT, obligatoire
- `user_id` : INTEGER, obligatoire, clé étrangère vers `users(id)`

### Table `comments`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `content` : TEXT, obligatoire
- `user_id` : INTEGER, obligatoire, clé étrangère vers `users(id)`
- `link_id` : INTEGER, obligatoire, clé étrangère vers `links(id)`
- `parent_comment_id` : INTEGER, facultatif, clé étrangère vers `comments(id)`

### Hiérarchie des commentaires

- Si `parent_comment_id` est vide (`NULL`), le commentaire répond directement au lien.
- Si `parent_comment_id` contient un identifiant, le commentaire répond au commentaire correspondant.
- L'application doit autoriser une réponse uniquement lorsque le commentaire parent répond directement au lien, afin de limiter la hiérarchie à deux niveaux.

## 5. The Hacking Class

### Table `courses`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `title` : TEXT, obligatoire

### Table `students`

- `id` : INTEGER, clé primaire, auto-incrémenté
- `name` : TEXT, obligatoire
- `course_id` : INTEGER, obligatoire, clé étrangère vers `courses(id)`

### Relation

Un cours peut accueillir plusieurs élèves ; chaque élève est inscrit à un seul cours grâce à son unique colonne `course_id`.
