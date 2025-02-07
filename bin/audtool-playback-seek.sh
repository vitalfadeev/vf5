#!/bin/bash
let TOTAL=`audtool current-song-length-seconds` 
let SEEK=TOTAL*$PROGRESS_POSITION/100
audtool playback-seek $SEEK
