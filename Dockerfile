# 1. Fixed casing: Changed 'As' to 'AS'
FROM node:20-alpine AS build

# 2. Fixed space: Added space after WORKDIR
WORKDIR /app

# Change this:
COPY my-app/package*.json ./
# ...
COPY my-app/ .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

# 3. Fixed flag: Changed '--from-build' to '--from=build'
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
