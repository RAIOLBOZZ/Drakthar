@echo off
REM DRAKTHAR - Configuração específica para drakthar.site
REM Este script ajuda a configurar o domínio drakthar.site na GoDaddy

echo.
echo 🐉 DRAKTHAR - Configuração drakthar.site
echo ==========================================
echo.

set "GREEN=[32m"
set "YELLOW=[33m"
set "RED=[31m"
set "BLUE=[34m"
set "NC=[0m"

echo %BLUE%[DRAKTHAR]%NC% Configuração do domínio drakthar.site
echo.

echo %YELLOW%[INFO]%NC% Vamos configurar seu domínio drakthar.site!
echo.

echo %GREEN%[ATUAL]%NC% Seus registros DNS atuais:
echo.
echo Tipo    Nome    Dados
echo a       @       WebsiteBuilder Site
echo ns      @       ns35.domaincontrol.com.
echo ns      @       ns36.domaincontrol.com.
echo cname   www     drakthar.site.
echo cname   _domainconnect _domainconnect.gd.domaincontrol.com.
echo soa     @       Servidor de nome principal: ns35.domaincontrol.com.
echo txt     _dmarc  v=DMARC1; p=quarantine; adkim=r; aspf=r; rua=mailto:dmarc_rua@onsecureserver.net;
echo.

set /p PLATFORM="Escolha a plataforma (1=GitHub Pages, 2=Netlify, 3=Vercel): "

echo.
echo %GREEN%[INFO]%NC% Configurando drakthar.site para a plataforma escolhida
echo.

if "%PLATFORM%"=="1" goto github
if "%PLATFORM%"=="2" goto netlify
if "%PLATFORM%"=="3" goto vercel
echo %RED%[ERROR]%NC% Opção inválida. Tente novamente.
goto end

:github
echo %BLUE%[GITHUB PAGES]%NC% Configuração para drakthar.site
echo.
echo %YELLOW%[AÇÕES NECESSÁRIAS]%NC%
echo.
echo 1. EXCLUIR este registro:
echo    Tipo: a
echo    Nome: @
echo    Dados: WebsiteBuilder Site
echo.
echo 2. ADICIONAR estes registros A:
echo    Tipo: A, Nome: @, Dados: 185.199.108.153
echo    Tipo: A, Nome: @, Dados: 185.199.109.153
echo    Tipo: A, Nome: @, Dados: 185.199.110.153
echo    Tipo: A, Nome: @, Dados: 185.199.111.153
echo.
echo 3. EDITAR este registro CNAME:
echo    Tipo: CNAME, Nome: www, Dados: SEU_USUARIO.github.io
echo.
echo %GREEN%[RESULTADO FINAL]%NC%
echo Tipo    Nome    Dados
echo A       @       185.199.108.153
echo A       @       185.199.109.153
echo A       @       185.199.110.153
echo A       @       185.199.111.153
echo CNAME   www     SEU_USUARIO.github.io
echo NS      @       ns35.domaincontrol.com.
echo NS      @       ns36.domaincontrol.com.
echo CNAME   _domainconnect _domainconnect.gd.domaincontrol.com.
echo SOA     @       Servidor de nome principal: ns35.domaincontrol.com.
echo TXT     _dmarc  v=DMARC1; p=quarantine; adkim=r; aspf=r; rua=mailto:dmarc_rua@onsecureserver.net;
echo.
goto end

:netlify
echo %BLUE%[NETLIFY]%NC% Configuração para drakthar.site
echo.
echo %YELLOW%[AÇÕES NECESSÁRIAS]%NC%
echo.
echo 1. EXCLUIR este registro:
echo    Tipo: a
echo    Nome: @
echo    Dados: WebsiteBuilder Site
echo.
echo 2. ADICIONAR este registro A:
echo    Tipo: A, Nome: @, Dados: 75.2.60.5
echo.
echo 3. EDITAR este registro CNAME:
echo    Tipo: CNAME, Nome: www, Dados: SEU_SITE.netlify.app
echo.
echo %GREEN%[RESULTADO FINAL]%NC%
echo Tipo    Nome    Dados
echo A       @       75.2.60.5
echo CNAME   www     SEU_SITE.netlify.app
echo NS      @       ns35.domaincontrol.com.
echo NS      @       ns36.domaincontrol.com.
echo CNAME   _domainconnect _domainconnect.gd.domaincontrol.com.
echo SOA     @       Servidor de nome principal: ns35.domaincontrol.com.
echo TXT     _dmarc  v=DMARC1; p=quarantine; adkim=r; aspf=r; rua=mailto:dmarc_rua@onsecureserver.net;
echo.
goto end

:vercel
echo %BLUE%[VERCEL]%NC% Configuração para drakthar.site
echo.
echo %YELLOW%[AÇÕES NECESSÁRIAS]%NC%
echo.
echo 1. EXCLUIR este registro:
echo    Tipo: a
echo    Nome: @
echo    Dados: WebsiteBuilder Site
echo.
echo 2. ADICIONAR este registro A:
echo    Tipo: A, Nome: @, Dados: 76.76.19.61
echo.
echo 3. EDITAR este registro CNAME:
echo    Tipo: CNAME, Nome: www, Dados: SEU_SITE.vercel.app
echo.
echo %GREEN%[RESULTADO FINAL]%NC%
echo Tipo    Nome    Dados
echo A       @       76.76.19.61
echo CNAME   www     SEU_SITE.vercel.app
echo NS      @       ns35.domaincontrol.com.
echo NS      @       ns36.domaincontrol.com.
echo CNAME   _domainconnect _domainconnect.gd.domaincontrol.com.
echo SOA     @       Servidor de nome principal: ns35.domaincontrol.com.
echo TXT     _dmarc  v=DMARC1; p=quarantine; adkim=r; aspf=r; rua=mailto:dmarc_rua@onsecureserver.net;
echo.
goto end

:end
echo %GREEN%[INFO]%NC% Configuração concluída!
echo.
echo %YELLOW%[PRÓXIMOS PASSOS]%NC%
echo 1. Acesse o painel da GoDaddy
echo 2. Vá para "Meus Produtos" ^> "DNS" ^> "Gerenciar"
echo 3. Execute as ações listadas acima
echo 4. Aguarde a propagação (24-48 horas)
echo 5. Configure o domínio na plataforma escolhida
echo.
echo %BLUE%[VERIFICAÇÃO]%NC%
echo - Use whatsmydns.net para verificar a propagação
echo - Teste em https://drakthar.site após propagação
echo - Configure HTTPS na plataforma escolhida
echo.
echo %GREEN%[SUCESSO]%NC% Seu domínio drakthar.site está sendo configurado!
echo.
pause

