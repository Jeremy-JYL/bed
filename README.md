# BED - BASIC Editor
A small portable editor inspire by the BASIC interpreter

Only 71 lines of V code and 56 lines of Python code.
But 19202 lines of C code :( (Because of V compiler)

# Run
For V port

`v ports/v/main.v -prod -autofree -o bed`

For C port

`cc ports/c/main.c -o bed`

For Python port

`python3 ports/python/main.py`

# Usage
Just like BASIC interpreter, when you open it up it display a console, you can use some file I/O command on BASIC interpreter such as LOAD and SAVE.

Command List:
  1. LOAD - Load File, LOAD [FILE]
  2. SAVE - Save File, SAVE [FILE]
  3. LIST - List Buffer, LIST [LINE NUMBER?]
  4. NEW - New Buffer, NEW
  5. EXIT - Exit And Delete Buffer, EXIT

# Finnal
Everyone are wellcome to use my code!

And I very want to see someone make a real BASIC interpreter based on this!
