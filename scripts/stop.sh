#!/bin/bash

# Drift Sentinel - Stop Script

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}🛑 Stopping Drift Sentinel services...${NC}\n"

docker compose down

echo ""
echo -e "${RED}✅ All services stopped!${NC}\n"
