Build https://github.com/kribor/api
Build https://github.com/kribor/web/
Build the docker-robot provided in this repo
Bring everything up using docker-compose

TEST_FILE=node-web.robot docker-compose up --abort-on-container-exit
