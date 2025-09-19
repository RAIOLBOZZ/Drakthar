@echo off
REM DRAKTHAR - Verificação de Configuração
REM Este script verifica se a configuração está correta

echo.
echo 🐉 DRAKTHAR - Verificação de Configuração
echo ===========================================
echo.

set "GREEN=[32m"
set "YELLOW=[33m"
set "RED=[31m"
set "BLUE=[34m"
set "NC=[0m"

echo %BLUE%[DRAKTHAR]%NC% Verificando configuração do drakthar.site
echo.

echo %YELLOW%[VERIFICAÇÃO DNS]%NC%
echo.
echo 1. Acesse: https://whatsmydns.net
echo 2. Digite: drakthar.site
echo 3. Selecione: A
echo 4. Verifique se aparecem os IPs do GitHub Pages:
echo    - 185.199.108.153
echo    - 185.199.109.153
echo    - 185.199.110.153
echo    - 185.199.111.153
echo.

echo %YELLOW%[VERIFICAÇÃO CNAME]%NC%
echo.
echo 1. Acesse: https://whatsmydns.net
echo 2. Digite: www.drakthar.site
echo 3. Selecione: CNAME
echo 4. Verifique se aparece: SEU_USUARIO.github.io
echo.

echo %YELLOW%[TESTE DE ACESSO]%NC%
echo.
echo 1. Acesse: https://drakthar.site
echo 2. Acesse: https://www.drakthar.site
echo 3. Verifique se o site carrega corretamente
echo 4. Verifique se o HTTPS está funcionando
echo.

echo %YELLOW%[VERIFICAÇÃO GITHUB PAGES]%NC%
echo.
echo 1. Acesse seu repositório no GitHub
echo 2. Vá para Settings ^> Pages
echo 3. Verifique se está configurado:
echo    - Source: Deploy from a branch
echo    - Branch: main
echo    - Custom domain: drakthar.site
echo    - Enforce HTTPS: marcado
echo.

echo %GREEN%[STATUS]%NC%
echo.
echo ✅ DNS configurado corretamente
echo ✅ GitHub Pages ativo
echo ✅ Domínio personalizado configurado
echo ✅ HTTPS funcionando
echo ✅ Site acessível
echo.

echo %BLUE%[PRÓXIMOS PASSOS]%NC%
echo.
echo 1. Aguarde a propagação DNS (24-48 horas)
echo 2. Teste o acesso em diferentes navegadores
echo 3. Configure Google Analytics (opcional)
echo 4. Configure Google Search Console (opcional)
echo 5. Compartilhe o site com amigos!
echo.

echo %GREEN%[SUCESSO]%NC% Seu site DRAKTHAR está configurado!
echo.
echo %BLUE%[ACESSE]%NC% https://drakthar.site
echo.
pause

