# asterisk-docker

Converts IVRs to PCMA, PCMU and G729

1. Place files you want to convert into the /in directory
2. Build docker file with

docker build -t asdocker

3. Run it to convert with 

docker run  -v {path-to-repo}/in:/home/in -v {path-to-repo}/out:/home/out -it asdocker