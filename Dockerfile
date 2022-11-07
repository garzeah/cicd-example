# Doing a multi-stage build so that we don't have
# to carry the unnecessary dependencies generated
# when we're just trying ot host our production server
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
# In prod environment, we use nginx to serve this app, whose default port is 80.
# When we expose port 80, AWS can automatically map host port to nginx port in the container.
EXPOSE 80
# Copying build files for the nginx server
# so we can host our static content
COPY --from=builder /app/build /usr/share/nginx/html