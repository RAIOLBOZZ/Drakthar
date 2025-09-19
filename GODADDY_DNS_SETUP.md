# 🌐 DRAKTHAR - Configuração DNS GoDaddy

## 🎯 Seu Domínio: drakthar.site

### 📋 O que você está vendo agora:

```
Tipo    Nome    Dados                           TTL
a       @       WebsiteBuilder Site             1 hora
ns      @       ns35.domaincontrol.com.         1 hora
ns      @       ns36.domaincontrol.com.         1 hora
cname   www     drakthar.site.                  1 hora
cname   _domainconnect _domainconnect.gd.domaincontrol.com. 1 hora
soa     @       Servidor de nome principal: ns35.domaincontrol.com. 1 hora
txt     _dmarc  v=DMARC1; p=quarantine; adkim=r; aspf=r; rua=mailto:dmarc_rua@onsecureserver.net; 1 hora
```

## 🔧 O que você precisa fazer:

### 1. 🗑️ Excluir/Editar registros existentes

**Exclua este registro:**

- **Tipo**: `a`
- **Nome**: `@`
- **Dados**: `WebsiteBuilder Site`
- **Ação**: Clique em "Excluir"

**Edite este registro:**

- **Tipo**: `cname`
- **Nome**: `www`
- **Dados**: `drakthar.site.`
- **Ação**: Clique em "Editar" e mude para a plataforma escolhida

### 2. ➕ Adicionar novos registros

**Para GitHub Pages (Recomendado):**

1. **Adicione registro A:**

   - **Tipo**: `A`
   - **Nome**: `@`
   - **Dados**: `185.199.108.153`
   - **TTL**: `1 hora`

2. **Adicione registro A:**

   - **Tipo**: `A`
   - **Nome**: `@`
   - **Dados**: `185.199.109.153`
   - **TTL**: `1 hora`

3. **Adicione registro A:**

   - **Tipo**: `A`
   - **Nome**: `@`
   - **Dados**: `185.199.110.153`
   - **TTL**: `1 hora`

4. **Adicione registro A:**

   - **Tipo**: `A`
   - **Nome**: `@`
   - **Dados**: `185.199.111.153`
   - **TTL**: `1 hora`

5. **Edite registro CNAME:**
   - **Tipo**: `CNAME`
   - **Nome**: `www`
   - **Dados**: `SEU_USUARIO.github.io` (substitua SEU_USUARIO pelo seu usuário do GitHub)
   - **TTL**: `1 hora`

**Para Netlify:**

1. **Adicione registro A:**

   - **Tipo**: `A`
   - **Nome**: `@`
   - **Dados**: `75.2.60.5`
   - **TTL**: `1 hora`

2. **Edite registro CNAME:**
   - **Tipo**: `CNAME`
   - **Nome**: `www`
   - **Dados**: `SEU_SITE.netlify.app` (substitua pelo seu site do Netlify)
   - **TTL**: `1 hora`

**Para Vercel:**

1. **Adicione registro A:**

   - **Tipo**: `A`
   - **Nome**: `@`
   - **Dados**: `76.76.19.61`
   - **TTL**: `1 hora`

2. **Edite registro CNAME:**
   - **Tipo**: `CNAME`
   - **Nome**: `www`
   - **Dados**: `SEU_SITE.vercel.app` (substitua pelo seu site do Vercel)
   - **TTL**: `1 hora`

## 📝 Passo a Passo Detalhado:

### Passo 1: Excluir o WebsiteBuilder

1. **Encontre o registro** com Tipo `a`, Nome `@`, Dados `WebsiteBuilder Site`
2. **Clique em "Excluir"**
3. **Confirme a exclusão**

### Passo 2: Adicionar registros A

1. **Clique em "Adicionar"** ou "+"
2. **Selecione Tipo**: `A`
3. **Digite Nome**: `@`
4. **Digite Dados**: `185.199.108.153` (para GitHub Pages)
5. **Selecione TTL**: `1 hora`
6. **Clique em "Salvar"**
7. **Repita** para os outros 3 IPs do GitHub Pages

### Passo 3: Editar o CNAME www

1. **Encontre o registro** com Tipo `cname`, Nome `www`
2. **Clique em "Editar"**
3. **Mude os Dados** para `SEU_USUARIO.github.io`
4. **Clique em "Salvar"**

## 🎯 Resultado Final (GitHub Pages):

```
Tipo    Nome    Dados                           TTL
A       @       185.199.108.153                 1 hora
A       @       185.199.109.153                 1 hora
A       @       185.199.110.153                 1 hora
A       @       185.199.111.153                 1 hora
CNAME   www     SEU_USUARIO.github.io          1 hora
NS      @       ns35.domaincontrol.com.         1 hora
NS      @       ns36.domaincontrol.com.         1 hora
CNAME   _domainconnect _domainconnect.gd.domaincontrol.com. 1 hora
SOA     @       Servidor de nome principal: ns35.domaincontrol.com. 1 hora
TXT     _dmarc  v=DMARC1; p=quarantine; adkim=r; aspf=r; rua=mailto:dmarc_rua@onsecureserver.net; 1 hora
```

## ⏱️ Próximos Passos:

1. **Aguarde a propagação** (24-48 horas)
2. **Configure o domínio** na plataforma escolhida
3. **Teste o acesso** em `https://drakthar.site`

## 🆘 Se tiver dúvidas:

- **Não exclua** os registros NS, SOA e TXT
- **Mantenha** os registros \_domainconnect
- **Apenas modifique** o registro A do WebsiteBuilder e o CNAME www

## 🎉 Pronto!

Após essas configurações, seu domínio `drakthar.site` estará apontando para o seu site DRAKTHAR!

🐉 **Bem-vindo ao universo dos dragões NFT!** ✨

