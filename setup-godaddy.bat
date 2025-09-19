@echo off
REM DRAKTHAR - Configuração GoDaddy
REM Este script ajuda a configurar o domínio comprado na GoDaddy

echo.
echo 🐉 DRAKTHAR - Configuração GoDaddy
echo ===================================
echo.

REM Cores para output
set "GREEN=[32m"
set "YELLOW=[33m"
set "RED=[31m"
set "BLUE=[34m"
set "NC=[0m"

echo %BLUE%[DRAKTHAR]%NC% Configuração do Domínio GoDaddy
echo.

echo %YELLOW%[INFO]%NC% Vamos configurar seu domínio da GoDaddy!
echo.

REM Solicitar informações do usuário
set /p DOMAIN="Digite seu domínio (ex: drakthar.com): "
set /p PLATFORM="Escolha a plataforma (1=GitHub Pages, 2=Netlify, 3=Vercel): "

echo.
echo %GREEN%[INFO]%NC% Configurando domínio: %DOMAIN%
echo.

if "%PLATFORM%"=="1" goto github
if "%PLATFORM%"=="2" goto netlify
if "%PLATFORM%"=="3" goto vercel
echo %RED%[ERROR]%NC% Opção inválida. Tente novamente.
goto end

:github
echo %BLUE%[GITHUB PAGES]%NC% Configuração para GitHub Pages
echo.
echo %YELLOW%[INSTRUÇÕES]%NC% Configure os seguintes registros DNS na GoDaddy:
echo.
echo Tipo: CNAME
echo Nome: www
echo Valor: SEU_USUARIO.github.io
echo TTL: 1 hora
echo.
echo Tipo: A
echo Nome: @
echo Valor: 185.199.108.153
echo TTL: 1 hora
echo.
echo Tipo: A
echo Nome: @
echo Valor: 185.199.109.153
echo TTL: 1 hora
echo.
echo Tipo: A
echo Nome: @
echo Valor: 185.199.110.153
echo TTL: 1 hora
echo.
echo Tipo: A
echo Nome: @
echo Valor: 185.199.111.153
echo TTL: 1 hora
echo.
echo %GREEN%[PRÓXIMOS PASSOS]%NC%
echo 1. Acesse o painel da GoDaddy
echo 2. Vá para "Meus Produtos" ^> "DNS" ^> "Gerenciar"
echo 3. Configure os registros acima
echo 4. Aguarde a propagação (24-48 horas)
echo 5. Configure o domínio no GitHub Pages
echo.
goto end

:netlify
echo %BLUE%[NETLIFY]%NC% Configuração para Netlify
echo.
echo %YELLOW%[INSTRUÇÕES]%NC% Configure os seguintes registros DNS na GoDaddy:
echo.
echo Tipo: A
echo Nome: @
echo Valor: 75.2.60.5
echo TTL: 1 hora
echo.
echo Tipo: CNAME
echo Nome: www
echo Valor: SEU_SITE.netlify.app
echo TTL: 1 hora
echo.
echo %GREEN%[PRÓXIMOS PASSOS]%NC%
echo 1. Acesse o painel da GoDaddy
echo 2. Vá para "Meus Produtos" ^> "DNS" ^> "Gerenciar"
echo 3. Configure os registros acima
echo 4. Aguarde a propagação (24-48 horas)
echo 5. Configure o domínio no Netlify
echo.
goto end

:vercel
echo %BLUE%[VERCEL]%NC% Configuração para Vercel
echo.
echo %YELLOW%[INSTRUÇÕES]%NC% Configure os seguintes registros DNS na GoDaddy:
echo.
echo Tipo: A
echo Nome: @
echo Valor: 76.76.19.61
echo TTL: 1 hora
echo.
echo Tipo: CNAME
echo Nome: www
echo Valor: SEU_SITE.vercel.app
echo TTL: 1 hora
echo.
echo %GREEN%[PRÓXIMOS PASSOS]%NC%
echo 1. Acesse o painel da GoDaddy
echo 2. Vá para "Meus Produtos" ^> "DNS" ^> "Gerenciar"
echo 3. Configure os registros acima
echo 4. Aguarde a propagação (24-48 horas)
echo 5. Configure o domínio no Vercel
echo.
goto end

:end
echo %GREEN%[INFO]%NC% Configuração concluída!
echo.
echo %YELLOW%[DICAS]%NC%
echo - Use whatsmydns.net para verificar a propagação
echo - Aguarde até 48 horas para propagação completa
echo - Teste em modo incógnito após configuração
echo - Configure HTTPS após propagação
echo.
echo %BLUE%[SUPORTE]%NC%
echo - GoDaddy: 0800 123 4567
echo - Chat: Disponível 24/7
echo - Central de Ajuda: help.godaddy.com
echo.
echo %GREEN%[SUCESSO]%NC% Seu domínio %DOMAIN% está sendo configurado!
echo.
pause

