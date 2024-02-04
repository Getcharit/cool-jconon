
jconon:
  image: docker.si.cnr.it/##{CONTAINER_ID}##
  mem_limit: 1024m
  read_only: false
  env_file:
      - ./jconon.env
  environment:
  - LANG=it_IT.UTF-8
  - REPOSITORY_BASE_URL=http://as1dock.si.cnr.it:8080/alfresco/
  - SIPER_URL=http://siper.test.si.cnr.it/siper
  - SPID_ENABLE=true
  - SSO_CNR_LOGOUT_SUCCESS_URL=/
  - KEYCLOAK_AUTH_SERVER_URL=https://traefik.test.si.cnr.it/auth
  volumes:
  - ./cert.p12:/opt/cert.p12
  - ./webapp_logs:/logs
  - /tmp
  command: java -Xmx256m -Xss512k -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8787 -Dcommission.gender=true -Dcommission.url=https://video.cnr.it/videos/embed/tDaLtHJBE786ebBwY1D67h?api=1&controls=0&autoplay=1 -Dpage.call.detail=true -Dfile.encoding=UTF8 -Dspring.profiles.active=prod,keycloak -Dserver.servlet.context-path= -Djava.security.egd=file:/prod/./urandom -Dace.contesto=SEL -jar /opt/jconon.war
  labels:
  - SERVICE_NAME=##{SERVICE_NAME}##
  - PUBLIC_NAME=cool-jconon.si.cnr.it
