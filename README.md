# google-ddns
Update your google ddns ip address periodically from a docker

Steps of usage:
1. Buy a domain from google domains (https://domains.google.com/)
2. Configura a ddns:
     - Synthetic records -> Choose dymanic DNS, and find a name for your DDNS url
     - click on the little arrow near your new address and see the credentials (username password)
  
3. build image using docker:
    <code>
        docker build -t google-ddns .
    </code>
4. run using docker command:  
    <code>
     docker run --name=google-ddns -e USERNAME="username" -e PASSWORD="password" -e HOST="x.yourdomain.net" --restart unless-stopped -d google-ddns
    </code>
    
docker-compose.yml:
  --- 
    version: '3'
    services:
      google-ddns:
        build: ./google-ddns
        volumes:
          - ./ddns-logs:/logs
        environment:
          - USERNAME=username
          - PASSWORD=password
          - HOST=x.yourdomain.net
        restart: unless-stopped
   ---
    
  - /logs folder inside the container keeps the last ddns update status, please mount it in order to see the last status from outside
