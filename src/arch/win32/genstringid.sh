#!/bin/sh
ids_counter=1

echo "/*"
echo " * stringid.h"
echo " *"
echo " * Autogenerated by genstringid.sh, DO NOT EDIT !!!"
echo " *"
echo " */"
echo "#ifndef VICE_STRINGID_H"
echo "#define VICE_STRINGID_H"
echo "static struct { char *str; int cmd; } idslist[] = {"

while read data
do
  ok="no"
  case ${data%%_*} in
    "IDS") echo "  { \"$data\", $ids_counter },"
           ids_counter=`expr $ids_counter + 1`
           ok="yes"
    ;;
  esac
done

echo " { NULL, 0 }"
echo "};"
echo ""
echo "#define LAST_IDS" $ids_counter
echo ""
echo "#endif"
