## 1. Example. Copy the sequence
### Copy the sequence from input to output
A sequence of integers in the input stream.

For reading, the inputInt function is used - returning the read number in the EAX register and the Z=1 flag, in case of reading the end of the file.

We need to copy the sequence from the input stream to the output stream.

Functions are used for output.

printiInt - prints the integer contained in the EAX register,
printiEndl - go to another line,

You can also use the printiHex function - prints the hexadecimal representation of the CL register.

All output functions store the values of all registers except the flag registers.

In the case of an empty sequence, the program exit code is -1.


## 2. Maximum of the sequence
### Find the maximum of the sequence

A sequence of integers in the input stream.

For reading, the inputInt function is used - returning the read number in the EAX register and the Z=1 flag, in case of reading the end of the file.

We need to find the maximum of the sequence and print the answer to the output stream.

Functions are used for output.

printiInt - prints the integer contained in the EAX register,
printiEndl - go to another line,

You can also use the printiHex function - prints the hexadecimal representation of the CL register.

All output functions store the values of all registers except the flag registers.

In the case of an empty sequence, the program exit code is -1.

## 3. Padovan problem
### Is the sequence a recursive relation of the Padovan sequence?
A sequence of integers in the input stream.

Answer (0-no, 1-yes) to the output stream, is it a Padovan sequence?

In the case of an empty sequence, the program exit code is -1.

Padovan sequence is the sequence of the form:
$$a_0=1, a_1=1, a_2=1, a_n=a_{n-2}+a_{n-3}$$ 

## 4. Missing number

### Find missing number

The sequence contains integers from 1 to N in arbitrary order, but one of the numbers is missing (the rest occur exactly once). N is not known in advance. Find the missing number.

A sequence of integers in the input stream.

Answer to the output stream.

IIn the case of an empty sequence, the program exit code is -1.

## 5. Number - loner
### Find a number that occurs only once

The sequence contains integers from 1 to N. All numbers except one are written twice in random order, one of the numbers is written once. N is not known in advance. Find a number that occurs once.

A sequence of integers in the input stream.

Answer to the output stream.

In the case of an empty sequence, the program exit code is -1.

## 6. Find the number

### Find the number X equal to more than half of the terms of the sequence

The sequence contains integers, more than half of which are equal to the same number X.

It is necessary to find this number X. It is guaranteed that such a number exists.

A sequence of integers in the input stream.

Answer to the output stream.

In the case of an empty sequence, the program exit code is -1.

## 7. Second highest (silver)

### Find the second largest element of a sequence of integers.
The second largest element is the one that becomes the largest element in the sequence after all elements with the highest value have been removed from it.

A sequence of integers in the input stream.

Answer to the output stream.

In the case of an empty sequence, the program exit code is -1.

## 8. The sum of pairwise products

### Find the sum of all pairwise products of a sequence
Find the sum of all pairwise products of a sequence

A sequence of integers in the input stream.

Answer to the output stream.

In the case of an empty sequence, the program exit code is -1.