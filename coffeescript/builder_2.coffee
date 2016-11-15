# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/builder
# --------------

class Todo
  constructor: ( default_settings = {} ) ->
    @date = new Date( default_settings.date ) or new Date
    @contexts = default_settings.contexts or []
    @projects = default_settings.projects or []
    @priority =  default_settings.priority or undefined
  addItem: ( description, settings = {} ) ->
    date = ( settings.date and new Date( settings.date ) ) or @date
    contexts = @contexts.concat( settings.contexts or [] )
    projects = @projects.concat( settings.projects or [] )
    priority = settings.priority or @priority
    created_at = [ date.getFullYear(), date.getMonth() + 1, date.getDate() ].join("-" )
    context_names = ( "@#{ context }" for context in contexts when context ).join( " " )
    project_names = ( "+#{ project }" for project in projects when project ).join( " " )
    priority = if priority then "( #{ priority } )" else ""
    parts = [ priority, created_at, description, context_names, project_names ]
    console.log ( part for part in parts when part.length > 0 ).join " "
    return 

todo = new Todo( { date: "10/13/2011" } )
todo.addItem( "Wash laundry" ) # => '2011-10-13 Wash laundry'
works = new Todo( { date: "10/13/2011", contexts: [ "work" ] } )
works.addItem( "Show the new design pattern to Lucy", { contexts: [ "desk", "xpSession" ] } ) # => '2011-10-13 Show the new design pattern to Lucy @work @desk @xpSession'
works.addItem( "Remind Sean about the failing unit tests", { contexts: [ "meeting" ], projects: [ "compilerRefactor" ], priority: 'A' } ) # => '(A) 2011-10-13 Remind Sean about the failing unit tests @work @meeting +compilerRefactor'
