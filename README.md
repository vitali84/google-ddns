# DEPRECATED
#google domains no longer exists
# google-ddns
Update your google ddns ip address periodically from a docker

Steps of usage:
1. Buy a domain from google domains (https://domains.google.com/)
2. Configure a ddns:
     - Synthetic records -> Choose dynamic DNS, and find a name for your DDNS url
     - click on the little arrow near your new address and see the credentials (username password)
3. run using docker command:  
    <code>
        docker run -e USERNAME="username" -e PASSWORD="password" -e HOST="x.yourdomain.net" --restart unless-stopped -d vitali84/google-ddns
    </code>
    
docker-compose.yml:
  --- 
    version: '3'
    services:
      google-ddns:
        image: vitali84/google-ddns:latest
        volumes:
          - ./ddns-logs:/logs
        environment:
          - USERNAME=username
          - PASSWORD=password
          - HOST=x.yourdomain.net
        restart: unless-stopped
   ---
    
  - /logs folder inside the container keeps the last ddns update status, please mount it in order to see the last status from outside
