# Problèmes rencontrés & solutions apportées

### 1er problème

Le premier problème que nous avons rencontré c'était au niveau de l'affichage des table json. En effet, après avoir créé la table avec une colonne de type variant, on a essayé de l'afficher par l'intermédiaire d'une vue et allant chercher cahque colonne du fichers json comme ceci :

- data:company_name

Mais on avait pas les valeurs. La solution que l'on trouvé pour résoudre ce problème est "LATERAL
FLATTEN", c'est pour cela que nous avons la syntaxe suivante :
<img width="1022" height="437" alt="Image" src="https://github.com/user-attachments/assets/bdaa6ee3-98c4-42df-875e-8848b824fa6f" />

### 2e problème

Les données de la table "jobs_postings" n'étaient pas dans les bonnes colonnes. On a créé une vue pour nettoyer les donées mais quand on affichait les données, elles n'étaient pas clean. Pour résoudre ce problème, on réagorniser les colonnes pour avoir les bonnes infos dans les bonnes colonnes.
