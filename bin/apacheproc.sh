#!/bin/bash
links --dump 1 http://localhost/server-status|grep ^[0-9]|awk 'BEGIN {print "Seconds, PID, State, IP, Domain, TYPE, URL\n--"} $4 !~ /[GCRK_.]/ {print $6, $2, $4, $11, $12, $13 " " $14|"sort -n"}'
