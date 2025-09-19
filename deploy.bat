@echo off
REM DRAKTHAR - Script de Deploy Automático para Windows
REM Este script facilita o deploy do jogo em diferentes plataformas

echo.
echo 🐉 DRAKTHAR - Deploy Automático
echo ================================
echo.

REM Verificar se o Git está instalado
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git não está instalado. Instale o Git primeiro.
    pause
    exit /b 1
)

REM Verificar se o Node.js está instalado
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js não está instalado. Instale o Node.js primeiro.
    pause
    exit /b 1
)

:menu
echo.
echo Escolha uma opção:
echo 1) Deploy para GitHub Pages
echo 2) Deploy para Netlify
echo 3) Deploy para Vercel
echo 4) Deploy Local
echo 5) Configurar Domínio Personalizado
echo 6) Configurar Domínio GoDaddy
echo 7) Configurar SEO
echo 8) Sair
echo.
set /p choice="Digite sua opção (1-8): "

if "%choice%"=="1" goto github
if "%choice%"=="2" goto netlify
if "%choice%"=="3" goto vercel
if "%choice%"=="4" goto local
if "%choice%"=="5" goto domain
if "%choice%"=="6" goto godaddy
if "%choice%"=="7" goto seo
if "%choice%"=="8" goto exit
echo [ERROR] Opção inválida. Tente novamente.
goto menu

:github
echo.
echo [DRAKTHAR] Deploy para GitHub Pages
echo.
echo Verificando repositório Git...
if not exist ".git" (
    echo [WARNING] Inicializando repositório Git...
    git init
    git add .
    git commit -m "Initial commit - DRAKTHAR game"
)

echo.
echo [INFO] Fazendo commit das mudanças...
git add .
git commit -m "Deploy DRAKTHAR - %date% %time%"

echo.
echo [INFO] Enviando para o repositório...
git push origin main

echo.
echo [INFO] Deploy para GitHub Pages concluído!
echo [INFO] Acesse: https://SEU_USUARIO.github.io/drakthar
echo.
pause
goto menu

:netlify
echo.
echo [DRAKTHAR] Deploy para Netlify
echo.
echo [INFO] Instalando Netlify CLI...
npm install -g netlify-cli

echo.
echo [INFO] Fazendo login no Netlify...
netlify login

echo.
echo [INFO] Fazendo deploy...
netlify deploy --prod --dir .

echo.
echo [INFO] Deploy para Netlify concluído!
echo.
pause
goto menu

:vercel
echo.
echo [DRAKTHAR] Deploy para Vercel
echo.
echo [INFO] Instalando Vercel CLI...
npm install -g vercel

echo.
echo [INFO] Fazendo deploy...
vercel --prod

echo.
echo [INFO] Deploy para Vercel concluído!
echo.
pause
goto menu

:local
echo.
echo [DRAKTHAR] Deploy Local
echo.
echo [INFO] Instalando dependências...
npm install

echo.
echo [INFO] Iniciando servidor local...
echo [INFO] Acesse: http://localhost:3000
echo.
echo Pressione Ctrl+C para parar o servidor
echo.
node server.js
goto menu

:domain
echo.
echo [DRAKTHAR] Configuração de Domínio Personalizado
echo.
echo Para configurar um domínio personalizado:
echo 1. Compre um domínio (ex: drakthar.com)
echo 2. Configure o DNS conforme as instruções da plataforma
echo 3. Adicione o domínio nas configurações da plataforma
echo.
echo Exemplo de configuração DNS:
echo Tipo: CNAME
echo Nome: www
echo Valor: SEU_SITE.netlify.app (ou similar)
echo.
echo Para mais detalhes, consulte o arquivo DOMAIN_SETUP.md
echo.
pause
goto menu

:godaddy
echo.
echo [DRAKTHAR] Configuração de Domínio GoDaddy
echo.
echo Para configurar seu domínio da GoDaddy:
echo 1. Acesse o painel da GoDaddy
echo 2. Vá para "Meus Produtos" ^> "DNS" ^> "Gerenciar"
echo 3. Configure os registros DNS conforme a plataforma escolhida
echo 4. Aguarde a propagação (24-48 horas)
echo 5. Configure o domínio na plataforma de hospedagem
echo.
echo Para instruções detalhadas, consulte:
echo - GODADDY_SETUP.md
echo - Execute setup-godaddy.bat para configuração interativa
echo.
echo Suporte GoDaddy:
echo - Telefone: 0800 123 4567
echo - Chat: Disponível 24/7
echo - Central de Ajuda: help.godaddy.com
echo.
pause
goto menu

:seo
echo.
echo [DRAKTHAR] Configuração de SEO
echo.
echo Para configurar SEO:
echo 1. Adicione o conteúdo do arquivo seo-config.html no ^<head^> do index.html
echo 2. Configure Google Analytics (opcional)
echo 3. Configure Google Search Console
echo 4. Submeta o sitemap.xml
echo.
echo Arquivos de SEO incluídos:
echo - sitemap.xml
echo - robots.txt
echo - manifest.json
echo - seo-config.html
echo.
pause
goto menu

:exit
echo.
echo [INFO] Obrigado por usar o DRAKTHAR!
echo.
pause
exit /b 0
