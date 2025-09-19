# 🌐 DRAKTHAR - Configuração de Domínio

## 🚀 Opções de Hospedagem e Domínio

### 1. GitHub Pages (Gratuito e Recomendado)

#### Pré-requisitos

- Conta no GitHub
- Repositório do DRAKTHAR no GitHub
- Domínio personalizado (opcional)

#### Configuração Básica

1. **Faça upload do projeto para o GitHub**

   ```bash
   git init
   git add .
   git commit -m "Initial commit - DRAKTHAR game"
   git branch -M main
   git remote add origin https://github.com/SEU_USUARIO/drakthar.git
   git push -u origin main
   ```

2. **Ative o GitHub Pages**

   - Vá para Settings > Pages
   - Selecione "Deploy from a branch"
   - Escolha "main" branch
   - Clique em "Save"

3. **Acesse seu site**
   - URL: `https://SEU_USUARIO.github.io/drakthar`
   - Exemplo: `https://joao.github.io/drakthar`

#### Configuração com Domínio Personalizado

1. **Configure o domínio no GitHub**

   - Vá para Settings > Pages
   - Adicione seu domínio em "Custom domain"
   - Exemplo: `drakthar.com` ou `www.drakthar.com`

2. **Configure DNS no seu provedor**

   ```
   Tipo: CNAME
   Nome: www (ou @)
   Valor: SEU_USUARIO.github.io
   ```

3. **Crie arquivo CNAME**
   ```bash
   echo "drakthar.com" > CNAME
   git add CNAME
   git commit -m "Add custom domain"
   git push
   ```

### 2. Netlify (Gratuito e Fácil)

#### Configuração Rápida

1. **Acesse [netlify.com](https://netlify.com)**
2. **Conecte com GitHub**
3. **Selecione o repositório DRAKTHAR**
4. **Configure o build**
   - Build command: (deixe vazio)
   - Publish directory: `.`
5. **Deploy automático**

#### Domínio Personalizado no Netlify

1. **Vá para Site settings > Domain management**
2. **Adicione seu domínio**
3. **Configure DNS**

   ```
   Tipo: A
   Nome: @
   Valor: 75.2.60.5

   Tipo: CNAME
   Nome: www
   Valor: SEU_SITE.netlify.app
   ```

### 3. Vercel (Gratuito e Rápido)

#### Configuração

1. **Acesse [vercel.com](https://vercel.com)**
2. **Conecte com GitHub**
3. **Importe o projeto DRAKTHAR**
4. **Deploy automático**

#### Domínio Personalizado

1. **Vá para Project Settings > Domains**
2. **Adicione seu domínio**
3. **Configure DNS conforme instruções**

### 4. Hospedagem Tradicional (cPanel, etc.)

#### Upload de Arquivos

1. **Acesse seu painel de controle**
2. **Vá para File Manager**
3. **Navegue para public_html**
4. **Faça upload de todos os arquivos**
5. **Acesse seu domínio**

#### Configuração de DNS

```
Tipo: A
Nome: @
Valor: IP_DO_SERVIDOR

Tipo: CNAME
Nome: www
Valor: SEU_DOMINIO.com
```

## 🔧 Configurações Específicas do DRAKTHAR

### 1. Configuração de HTTPS

```html
<!-- Adicione no <head> do index.html -->
<meta
  http-equiv="Content-Security-Policy"
  content="upgrade-insecure-requests"
/>
```

### 2. Configuração de Cache

```html
<!-- Adicione no <head> do index.html -->
<meta http-equiv="Cache-Control" content="public, max-age=31536000" />
```

### 3. Configuração de SEO

```html
<!-- Adicione no <head> do index.html -->
<meta
  name="description"
  content="DRAKTHAR - Jogo NFT de Dragões. Incube ovos, crie dragões únicos, explore mundos e negocie no marketplace mais dinâmico do universo blockchain."
/>
<meta
  name="keywords"
  content="nft, jogo, dragões, blockchain, breeding, marketplace, cripto"
/>
<meta name="author" content="DRAKTHAR Team" />
<meta property="og:title" content="DRAKTHAR - Jogo NFT de Dragões" />
<meta
  property="og:description"
  content="O universo dos dragões NFT está aqui! Incube, crie e negocie dragões únicos."
/>
<meta property="og:image" content="https://SEU_DOMINIO.com/logo.svg" />
<meta property="og:url" content="https://SEU_DOMINIO.com" />
<meta name="twitter:card" content="summary_large_image" />
```

### 4. Configuração de Analytics

```html
<!-- Adicione antes do </head> -->
<!-- Google Analytics -->
<script
  async
  src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"
></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag() {
    dataLayer.push(arguments);
  }
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## 📱 Configuração de PWA (Progressive Web App)

### 1. Crie o arquivo manifest.json

```json
{
  "name": "DRAKTHAR - Jogo NFT de Dragões",
  "short_name": "DRAKTHAR",
  "description": "O universo dos dragões NFT está aqui!",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#0a0a0a",
  "theme_color": "#ff6b35",
  "icons": [
    {
      "src": "favicon.svg",
      "sizes": "any",
      "type": "image/svg+xml"
    }
  ]
}
```

### 2. Adicione no HTML

```html
<link rel="manifest" href="manifest.json" />
<meta name="theme-color" content="#ff6b35" />
```

## 🔒 Configuração de Segurança

### 1. Headers de Segurança

```html
<!-- Adicione no <head> -->
<meta http-equiv="X-Content-Type-Options" content="nosniff" />
<meta http-equiv="X-Frame-Options" content="DENY" />
<meta http-equiv="X-XSS-Protection" content="1; mode=block" />
```

### 2. Configuração de CORS (se necessário)

```javascript
// Adicione no script.js se precisar de APIs externas
const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization',
};
```

## 🚀 Deploy Automático

### 1. GitHub Actions (já configurado)

O arquivo `.github/workflows/pages.yml` já está configurado para deploy automático.

### 2. Netlify Deploy

```yaml
# netlify.toml
[build]
  publish = "."
  command = "echo 'No build needed'"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

### 3. Vercel Deploy

```json
{
  "version": 2,
  "builds": [
    {
      "src": "index.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/index.html"
    }
  ]
}
```

## 📊 Monitoramento e Analytics

### 1. Google Analytics

- Configure uma conta no Google Analytics
- Adicione o código de tracking
- Monitore visitantes, páginas mais acessadas, etc.

### 2. Google Search Console

- Adicione seu site
- Configure sitemap.xml
- Monitore performance de busca

### 3. Uptime Monitoring

- Use serviços como UptimeRobot
- Configure alertas por email/SMS
- Monitore disponibilidade 24/7

## 🎯 Recomendação Final

**Para começar rapidamente:**

1. **GitHub Pages** (gratuito, fácil, confiável)
2. **Domínio personalizado** (opcional, mas recomendado)
3. **HTTPS** (obrigatório para produção)
4. **Analytics** (para monitorar uso)

**Exemplo de configuração completa:**

```
1. Compre domínio: drakthar.com
2. Configure GitHub Pages
3. Adicione domínio personalizado
4. Configure DNS
5. Adicione HTTPS
6. Configure Analytics
7. Deploy automático
```

## 🔧 Suporte Técnico

Se precisar de ajuda com alguma configuração específica:

- Consulte a documentação do seu provedor
- Verifique logs de erro
- Teste em diferentes navegadores
- Use ferramentas de debug (F12)

**Seu site DRAKTHAR estará online em poucos minutos!** 🐉✨

