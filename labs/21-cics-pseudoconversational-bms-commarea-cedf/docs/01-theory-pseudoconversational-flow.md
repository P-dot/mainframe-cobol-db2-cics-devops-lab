# 01 - Theory: CICS pseudoconversational flow

A conversational CICS program keeps a task alive while waiting for the user. That is inefficient because the task occupies CICS resources while the terminal user thinks, types, or does nothing.

A pseudoconversational program avoids that pattern:

```text
1. Program starts.
2. It sends a map.
3. It returns to CICS with TRANSID and COMMAREA.
4. The task ends.
5. When the user presses Enter, CICS starts a new task.
6. The program starts again and uses EIBCALEN/COMMAREA to know it is a later invocation.
7. It receives the map and processes the input.
```

In this lab:

```text
EIBCALEN = 0  -> first entry, send initial map
EIBCALEN = 8  -> later entry, receive map
```

The COMMAREA value is simple by design:

```text
ALL2CTX
```

It is not used for business data here. It exists to make the control mechanism visible in CEDF.
