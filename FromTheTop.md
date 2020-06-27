# From The Top
## github
* Come up with a name for the project.
* Sign into github and go to the list of my repositories.
* Give the repository a name and optionally a description.
* Leave the repo as public.
* Don't use the options to create a readme, .gitignore or liscense.
* Hit the create button.

## OmniFocus
* Create a new project in OmniFocus Computing/Projects/*project_name*.
* Start adding known task to the project.

## Initial Development
* Review the Cookie Cutter Templates document to select the approrate template for the project.
* Select then node for development work (Jobs for home or MoMac for work).
* Sign into the account used for the development work (noramally just my usual jeff or js8335 account.)
* Move to the $HOME/devl directory.

`cd $HOME/devl`

* Run Cookie Cutter with the appropriate template.

`cookiecutter` *template_name*

* Move to the top level directory for the project.
* Get the initially generated code onto github.

`git init`

`git add .`

`git commit -m 'Initial Commit'`

`git remote add origin https://github.com/jasmit35/`*project_name*`.git`

`git push -u origin master`


 

