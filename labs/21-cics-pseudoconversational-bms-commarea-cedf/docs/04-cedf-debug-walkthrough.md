# 04 - CEDF debug walkthrough

## First call

CEDF shows:

```text
TRANSACTION: ALL2
PROGRAM: ALL2
STATUS: PROGRAM INITIATION
EIBCALEN = 0
```

That proves the program has no previous COMMAREA.

## SEND MAP

CEDF then shows:

```text
EXEC CICS SEND MAP
MAP('ALL2MP')
MAPSET('ALL2MP')
FROM(...)
ERASE
```

That is the initial screen output.

## RETURN

CEDF then shows:

```text
EXEC CICS RETURN
TRANSID('ALL2')
COMMAREA('ALL2CTX')
LENGTH(8)
```

This ends the current task and tells CICS to re-enter `ALL2` when the user presses Enter.

## Second call

CEDF later shows:

```text
COMMAREA = 'ALL2CTX'
EIBCALEN = 8
```

That proves the pseudoconversational context was passed back.

## RECEIVE MAP

The second call reaches:

```text
EXEC CICS RECEIVE MAP
MAP('ALL2MP')
INTO(...)
MAPSET('ALL2MP')
```

From there, two important test paths were captured:

```text
MAPFAIL -> NO ME HAGAS TRABAJAR EN BALDE
NORMAL  -> OK / HOLA / ESTOY PSEUDOCONVERSANDO DESDE CICS
```
