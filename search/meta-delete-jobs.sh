#!/bin/bash

#707601.elixir-pbs.elixir-czech.cz
END=857394
for ((i=856884;i<=END;i++)); do
    #qdel $i.meta-pbs.metacentrum.cz
    qdel $i.elixir-pbs.elixir-czech.cz
    echo 'Deteled job '$i
done