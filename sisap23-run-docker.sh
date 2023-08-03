#docker build --no-cache -t sisap23/lmi .
#docker run -v /home/sisap23evaluation/data:/data:ro -v ./result:/result -it sisap23/lmi 300K
docker run -v /home/sisap23evaluation/data:/data:ro -v ./result:/result -it sisap23/lmi 10M
docker run -v /home/sisap23evaluation/data:/data:ro -v ./result:/result -it sisap23/lmi 30M
#docker run -v /home/sisap23evaluation/data:/data:ro -v ./result:/result -it sisap23/lmi 100M 
