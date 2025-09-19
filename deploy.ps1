# DRAKTHAR - Script de Deploy Automático para PowerShell
# Este script facilita o deploy do jogo em diferentes plataformas

Write-Host "🐉 DRAKTHAR - Deploy Automático" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""

# Função para exibir mensagens coloridas
function Write-Info {
  param([string]$Message)
  Write-Host "[INFO] $Message" -ForegroundColor Green
}

function Write-Warning {
  param([string]$Message)
  Write-Host "[WARNING] $Message" -ForegroundColor Yellow
}

function Write-Error {
  param([string]$Message)
  Write-Host "[ERROR] $Message" -ForegroundColor Red
}

function Write-Header {
  param([string]$Message)
  Write-Host "[DRAKTHAR] $Message" -ForegroundColor Blue
}

# Verificar se o Git está instalado
function Test-Git {
  try {
    git --version | Out-Null
    return $true
  }
  catch {
    Write-Error "Git não está instalado. Instale o Git primeiro."
    return $false
  }
}

# Verificar se o Node.js está instalado
function Test-Node {
  try {
    node --version | Out-Null
    return $true
  }
  catch {
    Write-Error "Node.js não está instalado. Instale o Node.js primeiro."
    return $false
  }
}

# Deploy para GitHub Pages
function Deploy-GitHub {
  Write-Header "Deploy para GitHub Pages"
    
  # Verificar se o repositório remoto está configurado
  try {
    git remote get-url origin | Out-Null
  }
  catch {
    Write-Warning "Configure o repositório remoto primeiro:"
    Write-Host "git remote add origin https://github.com/SEU_USUARIO/drakthar.git"
    return
  }
    
  # Fazer commit das mudanças
  Write-Info "Fazendo commit das mudanças..."
  git add .
  git commit -m "Deploy DRAKTHAR - $(Get-Date)"
    
  # Push para o repositório
  Write-Info "Enviando para o repositório..."
  git push origin main
    
  Write-Info "Deploy para GitHub Pages concluído!"
  Write-Info "Acesse: https://SEU_USUARIO.github.io/drakthar"
}

# Deploy para Netlify
function Deploy-Netlify {
  Write-Header "Deploy para Netlify"
    
  # Verificar se o Netlify CLI está instalado
  try {
    netlify --version | Out-Null
  }
  catch {
    Write-Info "Instalando Netlify CLI..."
    npm install -g netlify-cli
  }
    
  # Fazer login no Netlify
  Write-Info "Fazendo login no Netlify..."
  netlify login
    
  # Deploy
  Write-Info "Fazendo deploy..."
  netlify deploy --prod --dir .
    
  Write-Info "Deploy para Netlify concluído!"
}

# Deploy para Vercel
function Deploy-Vercel {
  Write-Header "Deploy para Vercel"
    
  # Verificar se o Vercel CLI está instalado
  try {
    vercel --version | Out-Null
  }
  catch {
    Write-Info "Instalando Vercel CLI..."
    npm install -g vercel
  }
    
  # Deploy
  Write-Info "Fazendo deploy..."
  vercel --prod
    
  Write-Info "Deploy para Vercel concluído!"
}

# Deploy local
function Deploy-Local {
  Write-Header "Deploy Local"
    
  # Instalar dependências
  Write-Info "Instalando dependências..."
  npm install
    
  # Iniciar servidor
  Write-Info "Iniciando servidor local..."
  Write-Info "Acesse: http://localhost:3000"
  Write-Host "Pressione Ctrl+C para parar o servidor" -ForegroundColor Yellow
  Write-Host ""
    
  node server.js
}

# Configurar domínio personalizado
function Setup-Domain {
  Write-Header "Configuração de Domínio Personalizado"
    
  Write-Host "Para configurar um domínio personalizado:"
  Write-Host "1. Compre um domínio (ex: drakthar.com)"
  Write-Host "2. Configure o DNS conforme as instruções da plataforma"
  Write-Host "3. Adicione o domínio nas configurações da plataforma"
  Write-Host ""
  Write-Host "Exemplo de configuração DNS:"
  Write-Host "Tipo: CNAME"
  Write-Host "Nome: www"
  Write-Host "Valor: SEU_SITE.netlify.app (ou similar)"
  Write-Host ""
  Write-Host "Para mais detalhes, consulte o arquivo DOMAIN_SETUP.md"
}

# Configurar SEO
function Setup-SEO {
  Write-Header "Configuração de SEO"
    
  Write-Host "Para configurar SEO:"
  Write-Host "1. Adicione o conteúdo do arquivo seo-config.html no <head> do index.html"
  Write-Host "2. Configure Google Analytics (opcional)"
  Write-Host "3. Configure Google Search Console"
  Write-Host "4. Submeta o sitemap.xml"
  Write-Host ""
  Write-Host "Arquivos de SEO incluídos:"
  Write-Host "- sitemap.xml"
  Write-Host "- robots.txt"
  Write-Host "- manifest.json"
  Write-Host "- seo-config.html"
}

# Menu principal
function Show-Menu {
  Write-Host ""
  Write-Host "Escolha uma opção:"
  Write-Host "1) Deploy para GitHub Pages"
  Write-Host "2) Deploy para Netlify"
  Write-Host "3) Deploy para Vercel"
  Write-Host "4) Deploy Local"
  Write-Host "5) Configurar Domínio Personalizado"
  Write-Host "6) Configurar SEO"
  Write-Host "7) Sair"
  Write-Host ""
}

# Função principal
function Main {
  Write-Header "Bem-vindo ao Deploy DRAKTHAR!"
    
  # Verificar dependências
  if (-not (Test-Git)) { return }
  if (-not (Test-Node)) { return }
    
  # Verificar se o repositório Git está inicializado
  if (-not (Test-Path ".git")) {
    Write-Warning "Inicializando repositório Git..."
    git init
    git add .
    git commit -m "Initial commit - DRAKTHAR game"
  }
    
  while ($true) {
    Show-Menu
    $choice = Read-Host "Digite sua opção (1-7)"
        
    switch ($choice) {
      "1" { Deploy-GitHub; break }
      "2" { Deploy-Netlify; break }
      "3" { Deploy-Vercel; break }
      "4" { Deploy-Local; break }
      "5" { Setup-Domain; break }
      "6" { Setup-SEO; break }
      "7" { 
        Write-Info "Obrigado por usar o DRAKTHAR!"
        return 
      }
      default { 
        Write-Error "Opção inválida. Tente novamente."
      }
    }
        
    Write-Host ""
    Read-Host "Pressione Enter para continuar"
  }
}

# Executar script
Main
