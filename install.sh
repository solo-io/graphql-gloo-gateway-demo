#! /bin/bash 
export GLOO_VERSION=2.3.0-beta4
#license=eyJhZGRPbnMiOltdLCJleHAiOjE2ODMxNTU0NTMsImlhdCI6MTY4MDU2MzQ1MywiayI6IjA1ZnpTQSIsImx0IjoiZW50IiwicHJvZHVjdCI6Imdsb28tZ2F0ZXdheSJ9.HE68j9NgTtPJlQFzgMAq_rl4b_xCHoZ7tozeBZ7ZP9s
license=eyJhZGRPbnMiOlt7IkFkZG9uIjowLCJFeHBpcmVzQXQiOjE2ODg0Mjg5MDYsIkxpY2Vuc2VUeXBlIjoiZW50In1dLCJleHAiOjE2ODg0Mjg5MDYsImlhdCI6MTY2MjUwODkwNiwiayI6InJ1ZDExZyIsImx0IjoiZW50IiwicHJvZHVjdCI6Imdsb28tdHJpYWwifQ.by7jozgqnuvVDigCfnO5cZMsY3pklnIpXIt8wDPejgM

helm repo add gloo-platform https://storage.googleapis.com/gloo-platform/helm-charts
helm repo update

helm install gloo-platform-crds gloo-platform/gloo-platform-crds \
   --namespace=gloo-mesh \
   --create-namespace \
   --version $GLOO_VERSION

helm install gloo-platform gloo-platform/gloo-platform \
   --namespace gloo-mesh \
   --version $GLOO_VERSION \
   --values ./install/gloo-gateway.yaml \
   --set licensing.glooGatewayLicenseKey=$license
   #--set licensing.glooTrialLicenseKey=$license
   
   #glooGatewayLicenseKey