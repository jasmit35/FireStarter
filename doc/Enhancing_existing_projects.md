
## Enhancements
Make sure the branch is up to date with the master branch in the repository.

`git pull github master`

Create the new feature branch.

`git branch v0.2.0`

Check commits, tags and where HEAD is pointing.

`git log --oneline --decorate`

Switch to the new branch.

`git checkout v0.2.0`


## Add WOZ
`git remote -v`

`git remote rename origin github`

`remote add woz git@woz.local:/opt/app/git/Synctify.git`
