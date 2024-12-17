#!/usr/bin/env bash

set -e

ruby parse.rb
cd gtfs-out
zip ../gtfs.zip *.txt
cd ..
pfaedle --inplace -x osm/routes.osm.bz2 -i gtfs.zip
gtfsclean --minimize-services --min-shapes --remove-red-trips --red-trips-fuzzy --remove-red-routes gtfs.zip
