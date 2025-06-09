FROM node:18-alpine

# Installiere Git und andere Abhängigkeiten
RUN apk add --no-cache git python3 make g++

WORKDIR /app

# Klone das Firecrawl-Repository
RUN git clone --recurse-submodules https://github.com/mendableai/firecrawl.git .

# Installiere und baue die Crawler-App
WORKDIR /app/apps/crawler

# Verwende npm install statt npm ci
RUN npm install
RUN npm run build

# Setze Umgebungsvariablen
ENV PORT=3000
ENV NODE_ENV=production

# Port freigeben
EXPOSE 3000

# App starten
CMD ["npm", "start"]
