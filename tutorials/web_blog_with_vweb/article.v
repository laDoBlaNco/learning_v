// article.v
module main

struct Article{
	// We add ORM decorators to our primary key to let it know that it is the primary
	// key and it needs to auto-increment
	id int @[primary;sql:serial]
	title string
	text string
}

pub fn(app &App) find_all_articles()[]Article{
	return sql app.db{
		select from Article
	} or {panic(err)}
}

pub fn(app &App) retrieve_article()?Article{
	return sql app.db{
		select from Article limit 1
	} or {panic(err)}[0]
}

// article:=app.retrieve_article() or {
// 	return app.text('Article not found!') 
// }