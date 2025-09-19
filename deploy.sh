#!/bin/bash

# DRAKTHAR - Script de Deploy Automático
# Este script facilita o deploy do jogo em diferentes plataformas

echo "🐉 DRAKTHAR - Deploy Automático"
echo "================================"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para exibir mensagens coloridas
print_message() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}[DRAKTHAR]${NC} $1"
}

# Verificar se o Git está configurado
check_git() {
    if ! command -v git &> /dev/null; then
        print_error "Git não está instalado. Instale o Git primeiro."
        exit 1
    fi
    
    if [ ! -d ".git" ]; then
        print_warning "Inicializando repositório Git..."
        git init
        git add .
        git commit -m "Initial commit - DRAKTHAR game"
    fi
}

# Deploy para GitHub Pages
deploy_github() {
    print_header "Deploy para GitHub Pages"
    
    # Verificar se o repositório remoto está configurado
    if ! git remote get-url origin &> /dev/null; then
        print_warning "Configure o repositório remoto primeiro:"
        echo "git remote add origin https://github.com/SEU_USUARIO/drakthar.git"
        return 1
    fi
    
    # Fazer commit das mudanças
    git add .
    git commit -m "Deploy DRAKTHAR - $(date)"
    
    # Push para o repositório
    git push origin main
    
    print_message "Deploy para GitHub Pages concluído!"
    print_message "Acesse: https://SEU_USUARIO.github.io/drakthar"
}

# Deploy para Netlify
deploy_netlify() {
    print_header "Deploy para Netlify"
    
    if ! command -v netlify &> /dev/null; then
        print_warning "Instalando Netlify CLI..."
        npm install -g netlify-cli
    fi
    
    # Fazer login no Netlify
    netlify login
    
    # Deploy
    netlify deploy --prod --dir .
    
    print_message "Deploy para Netlify concluído!"
}

# Deploy para Vercel
deploy_vercel() {
    print_header "Deploy para Vercel"
    
    if ! command -v vercel &> /dev/null; then
        print_warning "Instalando Vercel CLI..."
        npm install -g vercel
    fi
    
    # Deploy
    vercel --prod
    
    print_message "Deploy para Vercel concluído!"
}

# Deploy para servidor local
deploy_local() {
    print_header "Deploy Local"
    
    if ! command -v node &> /dev/null; then
        print_error "Node.js não está instalado. Instale o Node.js primeiro."
        return 1
    fi
    
    # Instalar dependências
    npm install
    
    # Iniciar servidor
    print_message "Iniciando servidor local..."
    print_message "Acesse: http://localhost:3000"
    
    node server.js
}

# Configurar domínio personalizado
setup_domain() {
    print_header "Configuração de Domínio Personalizado"
    
    echo "Para configurar um domínio personalizado:"
    echo "1. Compre um domínio (ex: drakthar.com)"
    echo "2. Configure o DNS conforme as instruções da plataforma"
    echo "3. Adicione o domínio nas configurações da plataforma"
    echo ""
    echo "Exemplo de configuração DNS:"
    echo "Tipo: CNAME"
    echo "Nome: www"
    echo "Valor: SEU_SITE.netlify.app (ou similar)"
    echo ""
    echo "Para mais detalhes, consulte o arquivo DOMAIN_SETUP.md"
}

# Configurar SEO
setup_seo() {
    print_header "Configuração de SEO"
    
    echo "Para configurar SEO:"
    echo "1. Adicione o conteúdo do arquivo seo-config.html no <head> do index.html"
    echo "2. Configure Google Analytics (opcional)"
    echo "3. Configure Google Search Console"
    echo "4. Submeta o sitemap.xml"
    echo ""
    echo "Arquivos de SEO incluídos:"
    echo "- sitemap.xml"
    echo "- robots.txt"
    echo "- manifest.json"
    echo "- seo-config.html"
}

# Menu principal
show_menu() {
    echo ""
    echo "Escolha uma opção:"
    echo "1) Deploy para GitHub Pages"
    echo "2) Deploy para Netlify"
    echo "3) Deploy para Vercel"
    echo "4) Deploy Local"
    echo "5) Configurar Domínio Personalizado"
    echo "6) Configurar SEO"
    echo "7) Sair"
    echo ""
    read -p "Digite sua opção (1-7): " choice
}

# Função principal
main() {
    print_header "Bem-vindo ao Deploy DRAKTHAR!"
    
    # Verificar Git
    check_git
    
    while true; do
        show_menu
        
        case $choice in
            1)
                deploy_github
                ;;
            2)
                deploy_netlify
                ;;
            3)
                deploy_vercel
                ;;
            4)
                deploy_local
                ;;
            5)
                setup_domain
                ;;
            6)
                setup_seo
                ;;
            7)
                print_message "Obrigado por usar o DRAKTHAR!"
                exit 0
                ;;
            *)
                print_error "Opção inválida. Tente novamente."
                ;;
        esac
        
        echo ""
        read -p "Pressione Enter para continuar..."
    done
}

# Executar script
main

