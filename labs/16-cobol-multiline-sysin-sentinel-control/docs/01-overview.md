# Overview

This lab implements a COBOL batch program that reads multiple lines from `SYSIN`.

A sentinel character controls the loop. The program continues to process input until the first character of the current input record is `%`.

This is a data-driven loop: the number of iterations is controlled by the input stream rather than by a hardcoded counter.
