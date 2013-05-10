#!/bin/awk -f

BEGIN {
    disp = 1
}

/My script begin/ {
    disp = 0
}

{
    if (disp)
        print
}

/My script end/ {
    disp = 1
}

