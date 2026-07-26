# Overview

This lab verifies the existence and readability of a z/OS PDS member using standard batch utilities.

The goal is not only to receive a `CC 0000`, but to produce a clear operator-facing message when the input member is available and readable.

The job follows a three-stage flow:

```text
Catalog check -> member read check -> confirmation message
```
