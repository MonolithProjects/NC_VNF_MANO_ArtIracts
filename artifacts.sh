#!/bin/bash

#just place this script in the top folder of the vnfd package(so it will be in the same level as folders like "implementation" or "definitions" ...

COUNT=1
x=0
for i in $(find ./implementation/configuration/Ansible/roles/ -follow -type f)
 do
   artifact_name=$(echo $i | cut -f 6 -d '/')
   if [ "$artifact_name" != "$x" ]; then COUNT=1; fi
   echo "role_"$artifact_name"_file"$COUNT":"
   echo "   type: tosca.artifacts.Implementation.Ansible"
   echo "   file: "$(echo $i | cut -c 3-)
   echo "   deploy_path: "$(echo $i | cut -c 40-)
   x=$artifact_name
   COUNT=$(($COUNT + 1))
 done

