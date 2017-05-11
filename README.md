# README # 

This version of the recipe program uses a PostgreSQL database, rather 
than a yaml file, to store recipe data. 

Class structure:
The user interacts with the RecipeSession class, which holds an array of Recipe 
objects and interacts only with the Recipe class. The Recipe class interacts with the DBInterface class, which is responsible for all interactions with the database.

Before running the program:
1. Have PostgreSQL installed. 
   For Mac, see https://launchschool.com/blog/how-to-install-postgresql-on-a-mac
   For Cloud 9, see https://community.c9.io/t/setting-up-postgresql/1573
2. Run the command 'bundle install' from this directory file. If this doesn't 
   work, first run 'gem install bundler'
3. Create and populate the database with the following two commands:
      createdb recipes
      psql recipes < recipes.sql
4. Run the command 'chmod +x recipe'. This gives permission to execute the file.
These steps need only be done once. 

To start the program, from the command line run:
      ./recipe 
