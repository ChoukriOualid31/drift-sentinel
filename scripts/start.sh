#!/bin/bash

# Drift Sentinel - Start Script
# Quick start for all services

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}"
cat << "EOF"
🚀 Starting Drift Sentinel...
EOF
echo -e "${NC}\n"

# Start services
echo -e "${YELLOW}Starting all services...${NC}\n"
docker compose up -d

echo ""
echo -e "${YELLOW}Waiting for services to be ready...${NC}"
sleep 10

echo ""
echo -e "${GREEN}✅ Services started!${NC}\n"

# Show status
docker compose ps

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}📊 Access your services:${NC}\n"
echo -e "  ${GREEN}Keycloak:${NC}      http://localhost:8080"
echo -e "  ${GREEN}MLflow:${NC}        http://localhost:5000"
echo -e "  ${GREEN}Grafana:${NC}       http://localhost:3000"
echo -e "  ${GREEN}Prometheus:${NC}    http://localhost:9090"
echo -e "  ${GREEN}MinIO:${NC}         http://localhost:9001"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${YELLOW}📝 View logs:${NC} docker compose logs -f"
echo -e "${YELLOW}🛑 Stop all:${NC}  docker compose down"
echo ""
