angular.module('app.service.ProjectsService', [
    'ionic'
    'ionic.utils'
])

.factory('LocalStorageProjectsService', ['$localstorage', ($localstorage)->
    activeProject: null
    projects: []
    all: ->
        $localstorage.getList 'projects'
    save: (projects)->
        $localstorage.setObject 'projects', projects
    newProject: (projectTitle)->
        title: projectTitle
        tasks: []
    getLastActiveIndex: ->
        parseInt($localstorage.get 'lastActiveProject') or 0
    setLastActiveIndex: (index)->
        $localstorage.set 'lastActiveProject', index
])
.factory('SQLiteProjectsService', ['$cordovaSQLite', ($cordovaSQLite)->
    db = null
    document.addEventListener('deviceready', ->
#        db = $cordovaSQLite.openDB('projects.db')
        db = $cordovaSQLite.openDB(name: 'projects.db', bgType: 1) # opening background db
        $cordovaSQLite.execute('''
CREATE TABLE IF NOT EXISTS project(
    id INT PRIMARY KEY      NOT NULL,
    title          CHAR(50) NOT NULL
)
''')
    )

    activeProject: null
    projects: []
    all: ->
        $cordovaSQLite.execute(db, 'select * from project', []).then(
            (res)->
                console.log res
            (err)->
                console.log err
        )
    save: (projects)->
        for project in projects
            db.executeSql(
                'insert into project (title, description) values(?,?)', [project.title, project.description]
            )
    newProject: (projectTitle)->
        title: projectTitle
        description: projectTitle
        tasks: []
    getLastActiveIndex: ->
        parseInt($localstorage.get 'lastActiveProject') or 0
    setLastActiveIndex: (index)->
        $localstorage.set 'lastActiveProject', index
])

.factory('ProjectsService', ['$localstorage', ($localstorage)->
    activeProject: null
    projects: []
    all: ->
        $localstorage.getList 'projects'
    save: (projects)->
        $localstorage.setObject 'projects', projects
    newProject: (projectTitle)->
        title: projectTitle
        tasks: []
    getLastActiveIndex: ->
        parseInt($localstorage.get 'lastActiveProject') or 0
    setLastActiveIndex: (index)->
        $localstorage.set 'lastActiveProject', index
])