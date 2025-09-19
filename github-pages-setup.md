# 🚀 DRAKTHAR - Configuração GitHub Pages

## 📋 Configuração Completa para drakthar.site

### 1️⃣ Configure o DNS na GoDaddy (já explicado acima)

### 2️⃣ Configure o GitHub Pages

#### Passo 1: Crie o Repositório

1. **Acesse [github.com](https://github.com)**
2. **Clique em "New repository"**
3. **Nome**: `drakthar` (ou qualquer nome)
4. **Marque**: "Public"
5. **Clique em "Create repository"**

#### Passo 2: Faça Upload dos Arquivos

1. **Arraste todos os arquivos** da pasta DRAKTHAR para o repositório
2. **Ou use o Git:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit - DRAKTHAR game"
   git branch -M main
   git remote add origin https://github.com/SEU_USUARIO/drakthar.git
   git push -u origin main
   ```

#### Passo 3: Ative o GitHub Pages

1. **Vá para Settings** (no repositório)
2. **Clique em "Pages"** (menu lateral)
3. **Source**: Selecione "Deploy from a branch"
4. **Branch**: Selecione "main"
5. **Folder**: Selecione "/ (root)"
6. **Clique em "Save"**

#### Passo 4: Configure o Domínio Personalizado

1. **Na mesma página Pages**
2. **Custom domain**: Digite `drakthar.site`
3. **Marque**: "Enforce HTTPS"
4. **Clique em "Save"**

### 3️⃣ Arquivo CNAME (já configurado)

O arquivo `CNAME` já está configurado com `drakthar.site`

### 4️⃣ Verificação

Após a configuração:

- **GitHub Pages URL**: `https://SEU_USUARIO.github.io/drakthar`
- **Domínio personalizado**: `https://drakthar.site`
- **HTTPS**: Automático após propagação DNS

### 5️⃣ Tempo de Propagação

- **DNS**: 24-48 horas
- **HTTPS**: Até 24 horas após DNS
- **Verificação**: [whatsmydns.net](https://whatsmydns.net)

## 🎉 Pronto!

Seu site DRAKTHAR estará disponível em:

- `https://drakthar.site`
- `https://www.drakthar.site`

🐉 **Bem-vindo ao universo dos dragões NFT!** ✨

