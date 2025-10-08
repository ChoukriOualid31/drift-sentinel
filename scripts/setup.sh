#!/bin/bash

# Drift Sentinel - Setup Script
# Author: Oualid Choukri
# This script sets up the complete MLOps platform

set -e

# Colors for beautiful output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Beautiful banner
echo -e "${PURPLE}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║           🚀 DRIFT SENTINEL SETUP                        ║
║                                                           ║
║     Enterprise MLOps Platform by Oualid Choukri          ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}\n"

# Function to print step header
print_step() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}📌 $1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

# Function to print success
print_success() {
    echo -e "${GREEN}✅ $1${NC}\n"
}

# Function to print error
print_error() {
    echo -e "${RED}❌ $1${NC}\n"
}

# Function to print info
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}\n"
}

# Check prerequisites
print_step "STEP 1: Checking Prerequisites"

command -v docker >/dev/null 2>&1 || { 
    print_error "Docker is not installed. Please install Docker first."
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
}
print_success "Docker is installed ✓"

command -v docker compose >/dev/null 2>&1 || {
    print_error "Docker Compose is not installed. Please install Docker Compose first."
    echo "Visit: https://docs.docker.com/compose/install/"
    exit 1
}
print_success "Docker Compose is installed ✓"

command -v git >/dev/null 2>&1 || {
    print_error "Git is not installed. Please install Git first."
    exit 1
}
print_success "Git is installed ✓"

# Check Docker is running
if ! docker info >/dev/null 2>&1; then
    print_error "Docker is not running. Please start Docker first."
    exit 1
fi
print_success "Docker is running ✓"

# Create environment file
print_step "STEP 2: Setting Up Environment"

if [ ! -f ".env" ]; then
    cp .env.example .env
    print_success ".env file created from template"
    print_info "You can edit .env to customize your configuration"
else
    print_info ".env file already exists (skipping)"
fi

# Create required directories
print_step "STEP 3: Creating Directory Structure"

mkdir -p logs
mkdir -p data/{raw,processed}
mkdir -p models
mkdir -p reports

print_success "Directories created!"

# Pull Docker images
print_step "STEP 4: Pulling Docker Images"
echo -e "${YELLOW}This may take a few minutes...${NC}\n"

docker compose pull 2>&1 | while IFS= read -r line; do
    echo "  $line"
done

print_success "Docker images downloaded!"

# Check for submodules (if they exist)
print_step "STEP 5: Checking Submodules"

if [ -f ".gitmodules" ]; then
    print_info "Initializing submodules..."
    git submodule update --init --recursive
    print_success "Submodules initialized!"
else
    print_info "No submodules found (this is normal if repos aren't created yet)"
fi

# Summary
echo -e "${GREEN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║           ✅ SETUP COMPLETE!                             ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}\n"

print_info "🎉 Your Drift Sentinel environment is ready!"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}📚 NEXT STEPS:${NC}\n"

echo -e "  ${GREEN}1.${NC} Start all services:"
echo -e "     ${PURPLE}docker compose up -d${NC}\n"

echo -e "  ${GREEN}2.${NC} Check service status:"
echo -e "     ${PURPLE}docker compose ps${NC}\n"

echo -e "  ${GREEN}3.${NC} View logs:"
echo -e "     ${PURPLE}docker compose logs -f${NC}\n"

echo -e "  ${GREEN}4.${NC} Stop all services:"
echo -e "     ${PURPLE}docker compose down${NC}\n"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}🌐 SERVICE URLs (after starting):${NC}\n"

echo -e "  ${BLUE}•${NC} Keycloak:       ${GREEN}http://localhost:8080${NC} (admin/admin)"
echo -e "  ${BLUE}•${NC} MLflow:         ${GREEN}http://localhost:5000${NC}"
echo -e "  ${BLUE}•${NC} Grafana:        ${GREEN}http://localhost:3000${NC} (admin/admin)"
echo -e "  ${BLUE}•${NC} Prometheus:     ${GREEN}http://localhost:9090${NC}"
echo -e "  ${BLUE}•${NC} MinIO Console:  ${GREEN}http://localhost:9001${NC} (minioadmin/minioadmin)"
echo -e "  ${BLUE}•${NC} Jaeger:         ${GREEN}http://localhost:16686${NC}"
echo -e "  ${BLUE}•${NC} OPA:            ${GREEN}http://localhost:8181${NC}\n"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}👥 KEYCLOAK USERS:${NC}\n"

echo -e "  ${BLUE}•${NC} testuser     / test123    ${PURPLE}(role: user)${NC}"
echo -e "  ${BLUE}•${NC} analyst      / analyst123 ${PURPLE}(role: analyst)${NC}"
echo -e "  ${BLUE}•${NC} mlops_user   / mlops123   ${PURPLE}(role: mlops)${NC}"
echo -e "  ${BLUE}•${NC} admin        / admin123   ${PURPLE}(role: admin)${NC}\n"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}⚠️  NOTES:${NC}\n"

echo -e "  ${BLUE}•${NC} First startup takes 2-3 minutes"
echo -e "  ${BLUE}•${NC} Wait for all health checks to pass"
echo -e "  ${BLUE}•${NC} Check logs if services fail to start\n"

echo -e "${GREEN}🚀 Ready to start your MLOps journey!${NC}\n"
echo -e "${PURPLE}Made with ❤️  by Oualid Choukri${NC}\n"
