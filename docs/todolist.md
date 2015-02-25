Portability tested for ToDoList ZIP-app
=======================================

Return to [details](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/summary.md "Summary") 

Description
-----------

ToDoList(6.9.1) English/French by AbstractSpoon is a task manager tool to 
manage To-do lists and also import mind mapping files as Freeplane or 
GanntProject files.

### Assigned alias ###
- :computer: `todolist`

Particularity
-------------

Open source Software similar to Task Coach cross platform running on Linux, but 
with a lot of integrated tools.

### Main tools specialities ###
- Rich text edition and categories.
- Dynamic filters and sort.
- Display tasks tree, calendar, statistics and Gantt charts.
- Encrypt tasks or subtasks.
- Spell check.
- Import/Export.
- Source control link.

Silver state Features
---------------------

Seem to be really functional useful to manipulate tasks. This represents 
main activity for this software.

### Main working tests ###
- Create and move tasks with date picker selection,
- Text edition,
- Dynamic filters and sort,
- Display tasks tree, calendar, statistics and Gantt charts,
- Import CSV and Export to web page,
- Set icon and Reminder display (without sound in the Docker container),
- Apply categories, tags, status (but impossible to use filter),
- Use Spell check:
  Click to download through Firefox.
  Unzip by command line. 
  Import DIC file and use it.

### Troubles detect ###
- :new_moon_with_face: Filter action occurs crash of Wine with internal errors. 
  Restart container necessary !
- :sun_with_face: Sometimes abnormal terminal crash when exiting...
- :full_moon_with_face: Some icons not available in columns header due to 
Windows font missing.
- :full_moon_with_face: Comments font colour change do nothing in rich edit.

### Features not tested ###
- Encrypt tasks or subtasks.
- Print and email actions.
- Sounds in Reminder.
- Source control.
- Remote web access.
- Some Import/Export.
