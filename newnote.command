#!/bin/bash
date=`date +%Y%m%d-%H%M%S`
BASEDIR=$(dirname $0)
cd $BASEDIR
 
notesdirectory="notes/${date}"
 
clear
echo "Note will be stored in ${BASEDIR}/${notesdirectory}."
echo "Type title/filename for note (without extension):"
read filename
 
if [[ X"" = X"$filename" ]]; then
filename="note.rtf";
fi
 
mkdir "${notesdirectory}"
cp notes/empty.rtf "${notesdirectory}/${filename}.rtf"
rm -f lastnote.rtf
ln -s "${notesdirectory}/${filename}.rtf" latestnote.rtf
open -a TextEdit "${notesdirectory}/${filename}.rtf"
