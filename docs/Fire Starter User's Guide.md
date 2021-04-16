# Fire Starter User's Guide
## Starting a new project
### github
* Come up with a name for the project.
* Sign into github and go to the list of my repositories.
* Give the repository a name and optionally a description.
* Leave the repo as public.
* Don't use the options to create a readme, .gitignore or liscense.
* Hit the create button.

### OmniFocus
* Create a new project in OmniFocus Computing/Projects/*project_name*.
* Add the "Next set of enhancements" task.

### Initial Setup
* Review the Cookie Cutter Templates document to select the approrate template for the project.
* Sign into my account on Jobs.
* Move to the $HOME/devl directory.

`cd $HOME/devl`

* Run Cookie Cutter with the appropriate template.

`cookiecutter` *template_name*

### Python setup
Install pyenv and the desired version of Python for the project.

`cd $HOME/devl/`*project_name*

`pyenv virtualenv 3.8.2 `*project_name*

`pyenv local `*project_name*


### Get the initial commit to Git completed
* Install the requirements.

`python -m pip install --requirement=requirements.txt`

* Move to the top level directory for the project.
* Get the initially generated code onto github.

`git init`

`git add .`

`git commit -m 'Initial Commit'`

`git remote add origin https://github.com/jasmit35/`*project_name*`.git`

`git push -u origin master`



## Enhancing an existing project
Make sure the code in the devl directories  is up to date with the master branch in the repository.

`git status`

`git pull github master`

Create the new feature branch.

`git branch v0.2.0`

Check commits, tags and where HEAD is pointing.

`git log --oneline --decorate`

Switch to the new branch.

`git checkout v0.2.0`


### Finalizing the version in development

Check the System Guide for the project to see if their are any non-standard step that won't be covered by Fire Starter. Perform only any that are necessary at this time. The rest will be reviewed again and performed latter.

#### If you have been working on a Git branch, merge it with the master branch.

`git branch`

`git checkout master`

`git pull github master`

`git pull woz master`

`git merge`*branch*

`git push github master`

`git push woz master`

#### Update the defects and enhacemnts document to reflect what has been completed in this version.

#### Assign the new version number as a tag in Git.

Check the defects and enhancements document to make sure of the new application version number.

`git tag `*new application version*

`git push --tags github`

`git push --tags woz`

####  Save any new docker images

Male sure the version number is set correctly in the Makefile.

Rebuild the image to make sure the version is tages correctly.

`make dbc-build`

Then push the image to Docker Hub for distribution.

`make push-image`
  
## Test and Prod installation

Signon to the appropriate target server using my normal ID.

Use auto_update to install the code.

`auto_update -a `*project name*` -e ` *environment*

If there are non-standard migration steps, handle them.

## Apendix A - Adding a WOZ git repository to a project

`git remote -v`

`git remote rename origin github`

`git remote add woz git@woz.local:/opt/app/git/`*project_name`.git`
