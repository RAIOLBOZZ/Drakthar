# 🎯 DRAKTHAR - Configuração Visual Passo a Passo

## 🖥️ O que você está vendo na GoDaddy:

```
Tipo    Nome    Dados                           TTL     Excluir  Editar
a       @       WebsiteBuilder Site             1 hora    ✅      ✅
ns      @       ns35.domaincontrol.com.         1 hora    ❌      ❌
ns      @       ns36.domaincontrol.com.         1 hora    ❌      ❌
cname   www     drakthar.site.                  1 hora    ✅      ✅
cname   _domainconnect _domainconnect.gd.domaincontrol.com. 1 hora  ✅  ✅
soa     @       Servidor de nome principal: ns35.domaincontrol.com. 1 hora  ❌  ❌
txt     _dmarc  v=DMARC1; p=quarantine; adkim=r; aspf=r; rua=mailto:dmarc_rua@onsecureserver.net; 1 hora  ✅  ✅
```

## 🔧 AÇÕES QUE VOCÊ PRECISA FAZER:

### 1️⃣ EXCLUIR o WebsiteBuilder

- **Clique em "Excluir"** na linha do WebsiteBuilder Site
- **Confirme a exclusão**

### 2️⃣ ADICIONAR 4 registros A (para GitHub Pages)

- **Clique em "Adicionar"** ou "+"
- **Adicione estes 4 registros:**

```
Registro 1:
Tipo: A
Nome: @
Dados: 185.199.108.153
TTL: 1 hora

Registro 2:
Tipo: A
Nome: @
Dados: 185.199.109.153
TTL: 1 hora

Registro 3:
Tipo: A
Nome: @
Dados: 185.199.110.153
TTL: 1 hora

Registro 4:
Tipo: A
Nome: @
Dados: 185.199.111.153
TTL: 1 hora
```

**📝 VALORES COMPLETOS PARA COPIAR:**

**Registro 1:**

- Tipo: `A`
- Nome: `@`
- Dados: `185.199.108.153`
- TTL: `1 hora`

**Registro 2:**

- Tipo: `A`
- Nome: `@`
- Dados: `185.199.109.153`
- TTL: `1 hora`

**Registro 3:**

- Tipo: `A`
- Nome: `@`
- Dados: `185.199.110.153`
- TTL: `1 hora`

**Registro 4:**

- Tipo: `A`
- Nome: `@`
- Dados: `185.199.111.153`
- TTL: `1 hora`

### 3️⃣ EDITAR o CNAME www

- **Clique em "Editar"** na linha do CNAME www
- **Mude os dados de:** `drakthar.site.`
- **Para:** `SEU_USUARIO.github.io` (substitua SEU_USUARIO pelo seu usuário do GitHub)

**📝 VALORES COMPLETOS PARA EDITAR:**

**CNAME www:**

- Tipo: `CNAME`
- Nome: `www`
- Dados: `SEU_USUARIO.github.io` (substitua SEU_USUARIO pelo seu usuário do GitHub)
- TTL: `1 hora`

## 🎯 RESULTADO FINAL:

Após as alterações, você terá:

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

## ⚠️ IMPORTANTE:

- **NÃO EXCLUA** os registros NS, SOA e TXT
- **MANTENHA** os registros \_domainconnect
- **APENAS MODIFIQUE** o registro A do WebsiteBuilder e o CNAME www

## 🚀 PRÓXIMOS PASSOS:

1. **Configure os registros DNS** conforme acima
2. **Aguarde a propagação** (24-48 horas)
3. **Configure o domínio** no GitHub Pages
4. **Teste o acesso** em `https://drakthar.site`

## 🎉 PRONTO!

Após essas configurações, seu domínio `drakthar.site` estará apontando para o seu site DRAKTHAR!

🐉 **Bem-vindo ao universo dos dragões NFT!** ✨
