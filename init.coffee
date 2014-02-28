# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

atom.workspaceView.command 'ctags:generate', =>
  sys = require('sys')
  exec = require('child_process').exec

  # todo - drop the -V when I'm happy
  tag_cmd = "ctags --exclude=.bundle --exclude=cache --exclude=tmp --exclude=log --exclude=jquery*.js --exclude=vendor -f TAGS -R -V ."
  path = atom.project.getPath()


  if path
    child = exec tag_cmd, {cwd: path}, (error, stdout, stderr) ->
      console.log('ctags stdout: ' + stdout);
      console.log ('ctags stderr: ' + stderr);
      if error
        console.log('ctags exec error: ' + error)
  else
    console.log("No path for project")
