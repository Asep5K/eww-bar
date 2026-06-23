#!/bin/bash

if [[ "$(eww get cal-rev)" == "true" ]]; then
    eww update cal-rev=false
    eww close calendar
else
    eww update cal-rev=true
    eww open calendar
fi
