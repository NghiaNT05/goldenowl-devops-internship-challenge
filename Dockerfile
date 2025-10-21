FROM node:18-alpine AS build

WORKDIR /app

COPY src/package*.json ./
RUN npm ci --omit=dev

COPY src/ .

FROM node:18-alpine

WORKDIR /app

COPY --from=build /app ./

EXPOSE 3000

CMD ["npm", "start"]
