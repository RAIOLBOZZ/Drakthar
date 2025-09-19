# 🌐 DRAKTHAR - Configuração GoDaddy

## 🎯 Configuração do Domínio na GoDaddy

### 1. 📋 Informações do Seu Domínio

**Domínio comprado**: `drakthar.site`
**Provedor**: GoDaddy
**Status**: Ativo

### 2. 🔧 Configuração DNS na GoDaddy

#### Passo 1: Acesse o Painel de Controle

1. **Faça login** na sua conta GoDaddy
2. **Vá para "Meus Produtos"**
3. **Clique em "DNS"** ao lado do seu domínio
4. **Clique em "Gerenciar"**

#### Passo 2: Configure os Registros DNS

**Para GitHub Pages:**

```
Tipo: CNAME
Nome: www
Valor: SEU_USUARIO.github.io
TTL: 1 hora

Tipo: A
Nome: @
Valor: 185.199.108.153
TTL: 1 hora

Tipo: A
Nome: @
Valor: 185.199.109.153
TTL: 1 hora

Tipo: A
Nome: @
Valor: 185.199.110.153
TTL: 1 hora

Tipo: A
Nome: @
Valor: 185.199.111.153
TTL: 1 hora
```

**Para Netlify:**

```
Tipo: A
Nome: @
Valor: 75.2.60.5
TTL: 1 hora

Tipo: CNAME
Nome: www
Valor: SEU_SITE.netlify.app
TTL: 1 hora
```

**Para Vercel:**

```
Tipo: A
Nome: @
Valor: 76.76.19.61
TTL: 1 hora

Tipo: CNAME
Nome: www
Valor: SEU_SITE.vercel.app
TTL: 1 hora
```

### 3. 🚀 Deploy do Site

#### Opção A: GitHub Pages (Recomendado)

**1. Configure o Repositório:**

```bash
# No seu computador, na pasta do DRAKTHAR
git init
git add .
git commit -m "Initial commit - DRAKTHAR game"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/drakthar.git
git push -u origin main
```

**2. Ative o GitHub Pages:**

- Vá para Settings > Pages
- Selecione "Deploy from a branch"
- Escolha "main" branch
- Clique em "Save"

**3. Configure o Domínio Personalizado:**

- Vá para Settings > Pages
- Adicione seu domínio em "Custom domain"
- Exemplo: `drakthar.com` ou `www.drakthar.com`

**4. Crie arquivo CNAME:**

```bash
echo "SEU_DOMINIO.com" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push
```

#### Opção B: Netlify (Mais Fácil)

**1. Acesse [netlify.com](https://netlify.com)**
**2. Conecte com GitHub**
**3. Selecione o repositório DRAKTHAR**
**4. Configure o build:**

- Build command: (deixe vazio)
- Publish directory: `.`
  **5. Deploy automático**

**6. Configure o Domínio:**

- Vá para Site settings > Domain management
- Adicione seu domínio
- Configure DNS conforme instruções acima

#### Opção C: Vercel (Mais Rápido)

**1. Acesse [vercel.com](https://vercel.com)**
**2. Conecte com GitHub**
**3. Importe o projeto DRAKTHAR**
**4. Deploy automático**

**5. Configure o Domínio:**

- Vá para Project Settings > Domains
- Adicione seu domínio
- Configure DNS conforme instruções acima

### 4. ⏱️ Tempo de Propagação

**DNS Propagation:**

- **Tempo**: 24-48 horas (geralmente 2-4 horas)
- **Verificação**: Use [whatsmydns.net](https://whatsmydns.net)
- **Teste**: Acesse seu domínio após a propagação

### 5. 🔒 Configuração de HTTPS

**GitHub Pages:**

- HTTPS automático após configuração do domínio
- Aguarde até 24 horas para ativação

**Netlify:**

- HTTPS automático
- Certificado SSL gratuito

**Vercel:**

- HTTPS automático
- Certificado SSL gratuito

### 6. 📱 Configuração de SEO

**Adicione no `<head>` do index.html:**

```html
<!-- Meta tags básicas -->
<meta
  name="description"
  content="DRAKTHAR - Jogo NFT de Dragões. Incube ovos, crie dragões únicos, explore mundos e negocie no marketplace mais dinâmico do universo blockchain."
/>
<meta
  name="keywords"
  content="nft, jogo, dragões, blockchain, breeding, marketplace, cripto"
/>
<meta name="author" content="DRAKTHAR Team" />

<!-- Open Graph -->
<meta property="og:title" content="DRAKTHAR - Jogo NFT de Dragões" />
<meta
  property="og:description"
  content="O universo dos dragões NFT está aqui! Incube, crie e negocie dragões únicos."
/>
<meta property="og:image" content="https://SEU_DOMINIO.com/logo.svg" />
<meta property="og:url" content="https://SEU_DOMINIO.com" />
<meta property="og:type" content="website" />

<!-- Twitter -->
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="DRAKTHAR - Jogo NFT de Dragões" />
<meta
  name="twitter:description"
  content="O universo dos dragões NFT está aqui!"
/>
<meta name="twitter:image" content="https://SEU_DOMINIO.com/logo.svg" />

<!-- Canonical URL -->
<link rel="canonical" href="https://SEU_DOMINIO.com" />
```

### 7. 📊 Configuração de Analytics

**Google Analytics:**

```html
<!-- Adicione antes do </head> -->
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

**Google Search Console:**

1. Acesse [search.google.com/search-console](https://search.google.com/search-console)
2. Adicione seu domínio
3. Verifique a propriedade
4. Submeta o sitemap.xml

### 8. 🎯 Checklist de Configuração

**DNS:**

- [ ] Configure registros A e CNAME
- [ ] Aguarde propagação (24-48h)
- [ ] Verifique com whatsmydns.net

**Deploy:**

- [ ] Escolha uma plataforma (GitHub Pages, Netlify, Vercel)
- [ ] Configure o domínio personalizado
- [ ] Teste o acesso

**HTTPS:**

- [ ] Aguarde ativação automática
- [ ] Teste em https://SEU_DOMINIO.com

**SEO:**

- [ ] Adicione metadados
- [ ] Configure Google Analytics
- [ ] Configure Google Search Console
- [ ] Submeta sitemap.xml

**Testes:**

- [ ] Teste em diferentes navegadores
- [ ] Teste em dispositivos móveis
- [ ] Verifique velocidade de carregamento

### 9. 🆘 Solução de Problemas

**Domínio não carrega:**

- Verifique se os registros DNS estão corretos
- Aguarde a propagação completa
- Limpe o cache do navegador

**HTTPS não funciona:**

- Aguarde até 24 horas
- Verifique se o domínio está configurado corretamente
- Teste em modo incógnito

**Site não atualiza:**

- Verifique se o deploy foi feito
- Limpe o cache do navegador
- Aguarde alguns minutos

### 10. 📞 Suporte GoDaddy

**Contato:**

- **Telefone**: 0800 123 4567
- **Chat**: Disponível 24/7
- **Email**: suporte@godaddy.com
- **Central de Ajuda**: [help.godaddy.com](https://help.godaddy.com)

**Recursos:**

- [Guia de DNS](https://help.godaddy.com/s/article/2308)
- [Configuração de Domínio](https://help.godaddy.com/s/article/2309)
- [Troubleshooting DNS](https://help.godaddy.com/s/article/2310)

### 11. 🎉 Próximos Passos

**Após configuração:**

1. **Teste o site** em diferentes dispositivos
2. **Configure Google Analytics** para monitorar visitantes
3. **Configure Google Search Console** para SEO
4. **Crie conteúdo** para redes sociais
5. **Participe de comunidades** NFT

**Marketing:**

- Crie posts no Twitter sobre o jogo
- Participe de grupos de NFT no Discord
- Crie vídeos de demonstração
- Configure anúncios (Google Ads, Facebook)

## 🐉 Parabéns!

Seu domínio DRAKTHAR está configurado e pronto para o mundo!

**Acesse**: `https://SEU_DOMINIO.com`

**Bem-vindo ao universo dos dragões NFT!** ✨

---

**Dica**: Mantenha o painel da GoDaddy aberto para monitorar a propagação DNS e fazer ajustes se necessário.
