#!/bin/bash
 ps -eaf|grep -i flask|grep -iv grep|grep -i host|awk '{print $2"\n"$3}'|xargs kill -9
