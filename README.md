This is my starting point when I develop Sinatra Apps. It's all ready to go to use sass, haml, activerecord, sqlite3 in development mode on my local machine and postgres when deploying to heroku. I've actually started to use slim, to switch from haml, just replace haml with slim everywhere you see it.

Instructions

I'm assuming you're all set up with Heroku, if not, it's not too hard. Go to http://heroku.com

Place the folder wherever you want, rename it and cd to it. Go into the config folder and change the name of your database in both of these files (where it says untitled),
```
database.yml
environments.rb
``` 
and **note that you will have to input your heroku credentials in the database.yml file.** That's it for configuration.

Now just input these commands

```
bundle install
shotgun
```

and go to localhost:9393. Your app is up and running.


To deploy, just type

```
git init
git add .
git commit -m "Message"
heroku create
git push heroku master
```

And your app will work, no questions asked.

The rest is completely OPTIONAL !!!

To specify your own name on heroku, instead of typing heroku create, type in

```
heroku create app_name_here
```

After you have gotten your app up and running, you will have to start creating migrations. sinatra/activerecord doesn't have the full command-line functionality of rails, but you can create a migration by typing

```
rake db:create_migration NAME=create_foos
```

in a terminal, where foos is the pluralized name of the table. So for a Post model, you would have NAME=create_posts. Then fill out the migration file it creates. It works the old way of migrating up and down. To migrate up type

```
rake db:migrate
```


To migrate down, type

```
rake db:rollback
```

I assume you know a little bit about Rails, as ActiveRecord comes included in the Rails bundle. To refresh your memory (if needed), you now need a model. In Sinatra this is simple as pie (eating pie, not baking pie). Open app.rb and right under the require statement (that is, after the 'end' keyword), type in

```
class Post < ActiveRecord::Base
end
```
And you will magically have access to your database. 

(Optional)
There is a model folder included because I usually put that class declaration and any model logic into a posts.rb file and put it in that folder. Then I just require it in app.rb, which is just a matter of typing in './models/posts' in my spacebar separated list of requirements.
The great thing about using ActiveRecord in Sinatra, is you can follow pretty much any Rails tutorial or use your existing Rails knowledge and apply it to your Sinatra app. There is tons of community support.

Then, when you're ready, deploy to Heroku and punch in

```
heroku run rake db:migrate
```
and your app will be up and running on Heroku's servers using their postgres databases!


For more info, visit https://github.com/janko-m/sinatra-activerecord



If you use sass, put ur codez in the .sass file in the sass directory and sinatra will automatically generate the minified css. Use sass... it's the same as scss, just drop the curly braces and the semi-colons on the end of lines. So much nicer!
If you're used to scss, just rename the sass file to whatever.scss or create a new scss file, and the sass/rack/plugin will automatically generate the css. Just remember to edit or add a new link in the layout.haml file so that it can find the new css file. (Same name as the sass or scss file, just put .css for the extension. This template comes setup to find style.css)
To write plain css, it is recommended to create a new css file in the public/stylesheets directory, so as not to interfere with the compilation of the sass files.
If you want to include a normalizing or reset css file, you'll have to put that straight into the stylesheets folder as well. The best way to remember all this IMO is that your app doesn't know about your sass files, it only knows about your css; rack looks in your sass folder and converts everything to css on the fly putting the resulting output in your stylesheets folder, while your app only looks in your stylesheets folder for regular css.
In other words, the link in the head of your markup should always point to css.

When I followed the instructions, this is what I got: http://secure-thicket-4056.herokuapp.com/

Let me know if it doesn't work.
