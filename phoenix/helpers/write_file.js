// Phoenix - helpers - writeFile
function writeFile (path, content, callback = _.noop) {
  shell(`echo '${content}' > ${path}`, callback)
}
