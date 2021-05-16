FROM kong:2.0.4-alpine

LABEL description="Alpine + Kong 2.0.4 + kong-oidc plugin"

USER root
RUN apk update && apk add git unzip luarocks
RUN luarocks install --pin lua-resty-jwt 0.2.2-0
RUN luarocks install kong-oidc
# ADDED for Authorization based on token claims:   scope | realm_access | resource_access
RUN luarocks install kong-plugin-jwt-keycloak

USER kong
