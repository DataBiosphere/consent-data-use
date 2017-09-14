#!/bin/bash

ONTOLOGY_FILE=$1

response=$(curl 'http://mowl-power.cs.man.ac.uk:8080/validator/validate' \
                -H 'Content-Type: application/x-www-form-urlencoded' \
                --data-urlencode "ontology@${ONTOLOGY_FILE}" \
                --data "reportsyntax=Manchester" \
                --data "profile=OWL2")

if (echo $response | grep "The ontology and all of its imports are in the OWL 2 profile");
then
   echo "Validation service responded successfully."
else
   echo "Something went wrong with the online validator service. Please manually validate against http://mowl-power.cs.man.ac.uk:8080/validator/validate."
   exit 1
fi
