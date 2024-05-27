# Test #6. NASM Return.
## 1. Example. Copy files

### Copy input file to output file
The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

We need to copy all chars from input to the output file - output.txt

Functions are used for output:
writeBuf - RBX - buffer address and RCX - buffer length.

printBuf - RBX - buffer address and RCX - buffer length.
printiInt - prints the integer contained in the RAX register,
printiEndl - go to another line,

You can also use the printiHex function - prints the hexadecimal representation of the CL register.

All output functions store the values of all registers except the flag registers.

## 2. Count the characters

### Count the number of characters in the input file
The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

We need to count the number of characters in the input file, including spaces and line breaks, and output the result.

Functions are used for output:
printiInt - prints the integer contained in the RAX register,
printiEndl - go to another line,

You can also use the printiHex function - prints the hexadecimal representation of the CL register.

All output functions store the values of all registers except the flag registers.

## 3. Count the strings

### Count the number of strings in the input file
The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

We need to count the number of characters in the input file, including spaces and line breaks, and output the result.

Functions are used for output:
printiInt - prints the integer contained in the RAX register,
printiEndl - go to another line,

You can also use the printiHex function - prints the hexadecimal representation of the CL register.

All output functions store the values of all registers except the flag registers.

## 4. Letters from the alphabet

### Number of letters in file
The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

We need to count the number of characters in the input file, including spaces and line breaks, and output the result.

Functions are used for output:
printiInt - prints the integer contained in the RAX register,
printiEndl - go to another line,

You can also use the printiHex function - prints the hexadecimal representation of the CL register.

All output functions store the values of all registers except the flag registers.

A letter is a character from the Latin alphabet A..Z, case-insensitive (and a..z).

## 5. Digits

### The digits in the file
The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

We want to count the digits (0..9) in the file and output the result.

All output functions store the values of all registers except the flag registers.

## 6. Words

### The number of words in the file.
The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

We want to count the number of words in the file and output the result.

All output functions store the values of all registers except the flag registers.

A word is a group of consecutive non-whitespace characters (a whitespace character is the space and the newline {' ', '\n'}).

## 7. Words with a

### Words starting with a
The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

We need  to find words in the text that begin with "a" without regard to case and output them to the output file - output.txt

Functions are used for output:
writeBuf - RBX - buffer address and RCX - buffer length. If RCX=0, then the file will be closed.

writeBuf - RBX - buffer address and RCX - buffer length. If RCX=0, then the file will be closed.
So, to write one line to the output file, you need to call printBuf twice: the first time with RCX=line length, and the second time with RCX=0.

printBuf - RBX - buffer address and RCX - buffer length.
printiInt - prints the integer contained in the RAX register,
printiEndl - go to another line,

You can also use the printiHex function - prints the hexadecimal representation of the CL register.

All output functions store the values of all registers except the flag registers.

## 8. Line numbers

### Print line numbers

The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

It is required to put at the beginning of each line (including an empty one) its ordinal number (numbering starts from one). The converted text must be output to the output.txt file.

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

Functions are used for output:
writeBuf - RBX - buffer address and RCX - buffer length. If RCX=0, then the file will be closed.
So, to write one line to the output file, you need to call printBuf twice: the first time with RCX=line length, and the second time with RCX=0.

printBuf - RBX - buffer address and RCX - buffer length.
printiInt - prints the integer contained in the RAX register,
printiEndl - go to another line,

You can also use the printiHex function - prints the hexadecimal representation of the CL register.

All output functions store the values of all registers except the flag registers.

## 9. Words and brackets

### Words in brackets
The file input.txt contains some text, the total length of which is not known in advance (we can assume that the length does not exceed 4000 characters).

It is required to enclose each word of the text in square brackets, for example like this [word] [more] [word] [and] [etc.].

A word is a group of consecutive non-empty characters. The converted text must be output to the output.txt file.

For reading, the readBuf function is used - RBX - buffer address and RCX - maximum buffer length
return the number read in the RAX register and the Z=1 flag if the file is empty if the file is read.

Functions are used for output:
writeBuf - RBX - buffer address and RCX - buffer length. If RCX=0, then the file will be closed.
So, to write one line to the output file, you need to call printBuf twice: the first time with RCX=line length, and the second time with RCX=0.

All output functions store the values of all registers except the flag registers.