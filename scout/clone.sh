#!/usr/bin/env bash
# Clone all scouting repos (full history) into repos/, in parallel, no model tokens spent.
cd "$(dirname "$0")/.."; mkdir -p repos
while read -r name url; do
  [ -d "repos/$name/.git" ] && { echo "have $name"; continue; }
  rm -rf "repos/$name"
  ( git clone -q "$url" "repos/$name" > "repos/$name.clone.log" 2>&1 && echo "done $name" || echo "FAIL $name" ) &
done < scout/repos.txt
wait; du -sh repos/* | grep -v log
