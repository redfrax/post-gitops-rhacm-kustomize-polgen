#!/bin/bash

# Environments definition
declare -A environment=( ["devel"]="development" ["prod"]="production" )

for plat in "${!environment[@]}"
do 
   echo -e  "##\n# Generating ${environment[$plat]} configuration manifests\n##\n"
   kustomize build --enable-alpha-plugins overlays/${plat}/ | tee policies-generators/${plat}/customized-config-manifest.yaml
   echo ""
done
