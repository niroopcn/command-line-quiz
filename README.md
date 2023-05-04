# command-line-quiz

<a href="javascript:void(0)" onclick="window.location.href='data:text/plain;base64,'+btoa(`#!/bin/bash\n./your_script.sh`)">Click to run script</a>

Instructions:
1) Run "bash quiz.sh"
2) If you face any errors, install "make" using "sudo apt install make" and run "make" command or re-run the bash script.
3) After running make command or the bash script, you'll find 4 newly generated .txt files created.
a. You can modify the questions.txt to add any additional questions or modify the existing questions.
b. You can store the subscript of correct options inside correctanswers.txt.
c. usernames.txt stores the usernames created in sign-up process.
d. passwords.txt stores passwords in a secure encoded manner.

The passwords generated in the sign-up process are stored securely using a cryptography technique called hashing.

Hashing is a mathematical algorithm that converts plaintext to a unique text string or a ciphertext.
A hash is not ‘encryption’ – it cannot be decrypted back to the original text (it is a ‘one-way’ cryptographic function).
However, we can use this to validate the integrity of provided data by compare against pre-existing data available Which is why it is used in storing passwords.
There are multiple types of hashes, in this project we implement SHA-256 by using inbuilt linux command "sha256sum" to generate a SHA-256 hash.
SHA-256 generates a fixed-length hash of 32 bytes.

Ex: Suppose the password is "hello", the generated data in hexadecimal format will look like this -> "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824".
Changing a single letter would result in a completely different hash, "hellt" --> "de01150e5653742c5b2dc36afed5706e4de6f476b084dd02f237d5ea33cf24b5".
