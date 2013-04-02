#!/bin/sh

echo ""
echo "###"
echo "### Admin only - you will need the server password to deploy the code ###"
echo "### This will deploy code for automatic Wikipedia checking ###"
echo "### as seen on http://community.languagetool.org/corpusMatch/list?lang=en ###"
echo "### but it will not deploy the web-app ###"
echo "###"
echo ""
sleep 1

cd ../.. &&
  mvn --projects languagetool-wikipedia --also-make clean package -DskipTests &&
  scp languagetool-wikipedia/target/LanguageTool-wikipedia-[1-9].[0-9]*.zip languagetool@languagetool.org:/home/languagetool/ltcommunity/corpus/ &&
  cd - &&
  echo "###" &&
  echo "### NOTE: You still need to unpack the ZIP and call update-all.sh manually on the server ###" &&
  echo "###" &&
  echo ""
