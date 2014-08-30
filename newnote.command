#!/bin/bash
# Based on SpiderNote by ROLFJE - http://rolfje.wordpress.com/2014/03/02/replace-evernote-with-spidernote/

BASEDIR=$(dirname $0)
cd $BASEDIR
 
notesdirectory="`pwd`/notes/Personal"
mkdir -p "${notesdirectory}"

clear
echo "Note will be stored in ${notesdirectory}."
echo -n "Type title/filename for note (without extension): "
read filename

# Default filename for blank title
if [[ X"" = X"$filename" ]]; then
  date=`date +%Y%m%d-%H%M%S`
  filename="${date}-note.odt";
fi

# Create new file only if it doesn't exist
if [ ! -f "${notesdirectory}/${filename}.odt" ]; then
  cp notes/empty.odt "${notesdirectory}/${filename}.odt"
fi

# Symbolic link to last opened note
rm -f lastnote.odt
ln -s "${notesdirectory}/${filename}.odt" lastnote.odt

open -a LibreOffice --args --writer "${notesdirectory}/${filename}.odt"
