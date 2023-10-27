#!/bin/bash
# Simple gpg file encryption / decryption app
# This script depends on gpg and zenity
# Written by trustno1techie

#Check if gpg and zenity is available:

if ! command -v gpg &> /dev/null
then
    echo "gpg is required for this aplication to run. Please install gpg and try again."
    exit 1
fi

if ! command -v zenity &> /dev/null
then
    echo "zenity is required for this aplication to run. Please install zenity and try again."
    exit 1
fi

#Select file

file_path=`zenity --file-selection --title="Select a File"`

case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac

# Check if the file is a GPG encrypted file

if file "$file_path" | grep -q "GPG";
then
        
#decrypt
password=`zenity --entry \
--title="Decrypt file" \
--text="Enter password for file decryption:" \
--hide-text
--entry-text ""
`
   
echo "$password" | gpg --batch --passphrase-fd 0 --output "${file_path%.gpg}" --decrypt "$file_path"
   
if [ "$?" = "0" ]; then
zenity --info \
--text="File successfully decrypted."
exit
else
zenity --error \
--text="An error occured."
exit
fi

unset password
   
else
#encrypt
password=`zenity --entry \
--title="Encrypt file" \
--text="Enter password for file encryption:" \
--hide-text
--entry-text ""
`

echo "$password" | gpg -c --batch --passphrase-fd 0 --cipher-algo AES256 "$file_path"

if [ "$?" = "0" ]; then
zenity --info \
--text="File successfully encrypted."
exit
else
zenity --error \
--text="An error occured."
exit
fi

unset password


fi
