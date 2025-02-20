#!/bin/bash
let TOTAL=`audtool current-song-length-seconds` 
let CURRENT=`audtool current-song-output-length-seconds` 
let PERCENT=100*$CURRENT/TOTAL
echo $PERCENT