#!/bin/bash
set -e

BIND_DIR=$1

line=$(grep -rin "Check if the node now contains CNAME and other data." ${BIND_DIR}/lib/dns/rbtdb.c | awk -F':' '{print $1}')
start=$[line+2]
end=$[line+4]

cmd="sed -i '${start},${end}c //解决bind9空主机头不能解析问题' ${BIND_DIR}/lib/dns/rbtdb.c"
eval $cmd
