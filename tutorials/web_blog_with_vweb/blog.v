// first creating a simple hello world  website in v
// blog.v
module main

import vweb
// import time
import db.sqlite

// The App struct is an entry point of our application. If you have expierence with
// an MVC web framework, probably like Rails or something, you can think of it as a
// controller. (NOTE: vweb is not an MVC framework however) It embeds the vweb Context
// object, that's why we get access to methods like .text()

struct App {
		vweb.Context
	pub mut:
		db sqlite.DB
}

fn main() {
	// app := App{}
	// vweb.run(app, 8081)
	mut app := App{
		db:sqlite.connect(':memory:')!
	}
	sql app.db{
		create table Article
	}!

	first_article:=Article{
		title:'Hello, world!'
		text:'V is great.'
	}

	second_article:=Article{
		title:'Second post.'
		text:'Hm... what should I write about now?'
	}

	sql app.db{
		insert first_article into Article
		insert second_article into Article
	}!

	vweb.run(app,8080)
}

// As we can see there aren't any routing rules. The 'index()' action handles the /
// request by default. vweb often uses convention over configuration and adding a
// new action requires no routing rules either:

@['/index']
pub fn (app &App) index() vweb.Result {
	// return app.text('Hello world from vweb!')
  // the .text(string) method returns a plain text document with the provided
	// return app.text(time.now().format())
 	// text, which isn't frequently used in websites.
	// so let's return an HTML view mejor -- that was pretty sweet
	// message:='Hello, world from Vweb'
	// return $vweb.html()

	// Now with the update of the ORM let's fetch the articles
	articles:=app.find_all_articles()
	return $vweb.html()
}

/*
The v template language is similar to C#'s Razor: @message prints the value of 
message. 

You may notice something unusual: teh message variable create in the index()
action is automatically available in the view. 

Its another feature of vweb to reduce the boilerplate in your web apps. No need
to create view models just to pass data, or use an unsafe and untyped alternative
like C#'s ViewBag["message"]

Making all action variables in the view may seem crazy, but V is a language with
pure functions by default, and you won't be able to modify any data from a view.
This means that <b>@foo.bar()</b> will only work if the bar() method doesn't 
modify foo.

The HTML template is compiled to V during the compilation of the website, that's
done by the $vweb.html() line. ($ always means compile time actions in v), 
offering the following benefits:
	1. Great performance, since the templates don't need to be compiled on every
		 request, like in almost every major web framework

	2. Easier deployment, since all your HTML templates are compiled into a single
		 binary file together with the web app itself

	3. All errors in the templates are guaranteed to be caught during compilation

Fetching data  with V Orm - now let's display some articles, shall we?
will be using v's built-in ORM and sqlite database. (V ORM also supports mysql,
Postgre, and sql server coming soon, if not already here)

First we add a sqlite handle to our App struct
Then in fn main() let's connect to a database. Code in the main() function
is run ony once during the app's startup, so we are going to have one DB connection
for all requests. This improves performance of the applications, since DB 
connection doesn't have to be set up for each request.

 After the changes in both blog.v and article.v, we need to update the view
 since the templates are looking for the wrong stuff.

 Pretty simple. The built-in V ORM uses a syntax very similar to sql. Queries
 are built with v. For example if we only wanted to find articlees with
 ids between 100 to 200, we'd do:
	select from Article where id >= 100 && id <= 200

or to retrive a single article, we add a limit and use ?Article which I believes
allows us to either get or not an array

v ORM uses v's optionals (I'll learn about them later) since bad queries will
always be handled by the developer

I DIDN'T FINISH THE TUTORIAL, BUT VERY IMPRESSED WITH WHAT I'M SEEING SO FAR
I NEED TO GET MORE OF THE SPECIALIZED SYNTAX DOWN BEFORE I CONTINUE
*/
