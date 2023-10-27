GPGScript

GPGScript is a simple shell script that encrypts or decrypts files with GPG without using the terminal. To use the app, simply click on the script, and the GUI will launch, allowing you to select the file. The app automatically decides whether it needs to encrypt or decrypt the file. You will need to enter the password for encryption/decryption, and the app will encrypt or decrypt the file and show a notification if the action was successful or not. The GUI is based on Zenity, and the app depends on Zenity and GPG and runs on Ubuntu.

Installation

To install GPGScript, follow these steps:

    Install Zenity and GPG by running the following command in the terminal:

     sudo apt-get install zenity gpg

Download the gpgscript.sh script from this repository.
Make the script executable by running the following command in the terminal:

chmod +x gpgscript.sh

Usage

To use GPGScript, follow these steps:

    Click on the script icon or navigate to the directory where the gpgscript.sh script is located in terminal.
    Run the script by typing the following command in the terminal:

    ./gpgscript.sh

    The Zenity GUI will appear with a file selection prompt. Select the file that you want to encrypt or decrypt and hit OK.
    The script automatically decides if it has to encrypt or decrypt the file.
    Enter the password for encryption/decryption in the password field (use strong passwords!)
    Click the "OK" button to encrypt or decrypt the file.
    The app will encrypt or decrypt the file (AES256 algorithm) and will show a notification if the action was successful or not.

The app automatically decides whether to encrypt or decrypt the file based on the output of the "file" command. If the output of the "file" command contains the string "GPG", the app will decrypt the file. Otherwise, the app will encrypt the file.

Note that the app will not overwrite the files, so when encrypting/decrypting make sure there are no file with a similar filename in a destination directory.

License

This app is licensed under the MIT License.

Acknowledgments

Thank you to the following resources for their help in creating this app:

    Zenity Documentation
    GPG Documentation
    Bash Guide for Beginners

Feel free to contribute to this project by submitting pull requests or issues.
