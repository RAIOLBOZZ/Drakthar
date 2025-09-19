# DRAKTHAR - Jogo NFT de Dragões

DRAKTHAR é um jogo NFT completo baseado em dragões, onde os jogadores podem criar, explorar e negociar dragões únicos com características e raridades geradas por genética.

## 🐉 Características do Jogo

### Mecânicas Principais

1. **Incubação de Ovos NFT**

   - Compre ovos de dragão como NFTs
   - Use moedas especiais para incubar ovos
   - Tempo de incubação variável baseado na raridade
   - Geração de dragões com características únicas

2. **Sistema de Breeding**

   - Combine dois dragões para criar descendentes
   - Genética dos pais influencia raridade e atributos
   - Máquina de breeding especializada
   - Resultado: novo ovo com mistura genética

3. **Mercado Dinâmico**

   - Negocie dragões, ovos e DNAs
   - Sistema de oferta e demanda
   - Filtros por raridade e tipo
   - Histórico de transações

4. **Expedições e Recursos**

   - Envie dragões adultos em expedições
   - Colete recursos valiosos
   - Gere renda passiva
   - Habilidades especiais afetam resultados

5. **Sistema de Raridade**
   - Comum, Raro, Épico, Lendário, Mítico
   - Influenciado pela genética dos pais
   - Afeta preços e capacidades

## 🎮 Como Jogar

### Início Rápido

1. **Compre Ovos**: Navegue até o marketplace e compre ovos NFT
2. **Incube**: Use a incubadora para chocar seus ovos
3. **Breeding**: Combine dragões para criar descendentes únicos
4. **Expedições**: Envie dragões adultos em missões para coletar recursos
5. **Negocie**: Venda itens no marketplace para ganhar moedas

### Economia do Jogo

- **Moeda Principal**: Para transações gerais
- **Moeda de Incubação**: Para usar a incubadora
- **Renda Passiva**: Através de expedições e vendas

## 🚀 Funcionalidades Implementadas

### ✅ Sistema Completo de Incubação

- 3 slots de incubação simultânea
- Timer em tempo real
- Aceleração com moeda especial
- Geração automática de dragões

### ✅ Sistema de Breeding Avançado

- Seleção de dragões pais
- Cálculo de raridade baseado em genética
- Geração de novos ovos
- Interface intuitiva

### ✅ Marketplace Dinâmico

- 45+ itens gerados automaticamente
- Sistema de busca e filtros
- Compra instantânea
- Categorização por tipo e raridade

### ✅ Sistema de Expedições

- 3 tipos de expedições diferentes
- Timer em tempo real
- Recompensas variáveis
- Múltiplas expedições simultâneas

### ✅ Área do Usuário Completa

- Estatísticas detalhadas
- Inventário organizado
- Abas para dragões, ovos e itens
- Progresso salvo localmente

### ✅ Interface Responsiva

- Design moderno e intuitivo
- Animações suaves
- Compatível com mobile
- Tema dark com cores vibrantes

## 🛠️ Tecnologias Utilizadas

- **HTML5**: Estrutura semântica
- **CSS3**: Estilos avançados com animações
- **JavaScript ES6+**: Lógica do jogo orientada a objetos
- **LocalStorage**: Persistência de dados
- **Font Awesome**: Ícones
- **Google Fonts**: Tipografia (Orbitron, Roboto)
- **SVG**: Logotipo vetorial de alta qualidade

## 📁 Estrutura do Projeto

```
drakthar/
├── index.html          # Página principal
├── styles.css          # Estilos CSS
├── script.js           # Lógica do jogo
├── logo.svg            # Logotipo principal DRAKTHAR
├── favicon.svg         # Favicon do site
├── server.js           # Servidor Node.js
├── package.json        # Configuração npm
├── README.md           # Documentação principal
├── INSTALL.md          # Guia de instalação
├── DEMO.md             # Demonstração de funcionalidades
├── LICENSE             # Licença MIT
├── .gitignore          # Arquivos ignorados pelo Git
├── .vscode/            # Configurações VSCode
├── .github/            # GitHub Actions e templates
└── .prettierrc         # Configuração Prettier
```

## 📱 Responsividade

O jogo é totalmente responsivo e funciona perfeitamente em:

- Desktop (1200px+)
- Tablet (768px - 1199px)
- Mobile (320px - 767px)

## 🎨 Design e UX

### Logotipo DRAKTHAR

- **Design**: Dragão metálico prateado entrelaçado com texto angular
- **Estilo**: Gótico, metálico e fantasia sombria
- **Cores**: Tons de cinza, branco, prateado e azul escuro
- **Efeitos**: Brilho metálico, sombras e reflexos
- **Formato**: SVG vetorial para máxima qualidade

### Paleta de Cores

- **Primária**: #ff6b35 (Laranja vibrante)
- **Secundária**: #4a90e2 (Azul)
- **Background**: Gradiente escuro (#0a0a0a → #16213e)
- **Texto**: Branco com variações de cinza
- **Logotipo**: Metálico prateado com efeitos de brilho

### Animações

- Efeitos de hover suaves
- Transições CSS3
- Animações de dragões
- Feedback visual para ações

## 🔧 Instalação e Execução

### Execução Local

1. **Abra o arquivo index.html** em qualquer navegador moderno
2. **Comece a jogar** imediatamente!

### Deploy para Produção

1. **GitHub Pages** (Recomendado - Gratuito)

   ```bash
   # Clone o repositório
   git clone [url-do-repositorio]
   cd drakthar

   # Configure o repositório remoto
   git remote add origin https://github.com/SEU_USUARIO/drakthar.git

   # Deploy automático
   git push origin main
   ```

2. **Netlify** (Gratuito e Fácil)

   - Acesse [netlify.com](https://netlify.com)
   - Conecte com GitHub
   - Selecione o repositório DRAKTHAR
   - Deploy automático

3. **Vercel** (Gratuito e Rápido)
   - Acesse [vercel.com](https://vercel.com)
   - Conecte com GitHub
   - Importe o projeto DRAKTHAR
   - Deploy automático

### Scripts de Deploy Automático

- **Windows**: Execute `deploy.bat` ou `deploy.ps1`
- **Linux/Mac**: Execute `./deploy.sh`
- **Manual**: Siga as instruções em `DOMAIN_SETUP.md`

## 📊 Sistema de Dados

### Estrutura de Dados do Usuário

```javascript
{
  currency: 1000,           // Moeda principal
  incubationCurrency: 1000, // Moeda de incubação
  dragons: [],              // Dragões possuídos
  eggs: [],                 // Ovos possuídos
  inventory: [],            // Itens do inventário
  expeditions: [],          // Expedições ativas
  incubatorSlots: [],      // Slots da incubadora
  stats: {                  // Estatísticas do jogador
    totalDragons: 0,
    totalEggs: 0,
    totalExpeditions: 0,
    totalBreedings: 0
  }
}
```

### Sistema de Raridade

- **Comum**: Verde, preço base
- **Raro**: Azul, preço 3x
- **Épico**: Roxo, preço 8x
- **Lendário**: Laranja, preço 20x
- **Mítico**: Vermelho, preço 50x

## 🎯 Próximas Funcionalidades

### Funcionalidades Planejadas

- [ ] Integração com blockchain real
- [ ] Sistema de carteira digital
- [ ] Multiplayer e chat
- [ ] Eventos especiais
- [ ] Sistema de guilds
- [ ] Batalhas PvP
- [ ] Mais tipos de expedições
- [ ] Sistema de crafting

### Melhorias Técnicas

- [ ] Backend com Node.js
- [ ] Banco de dados MongoDB
- [ ] API RESTful
- [ ] Sistema de autenticação
- [ ] Notificações push
- [ ] PWA (Progressive Web App)

## 🤝 Contribuição

Contribuições são bem-vindas! Para contribuir:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 📞 Suporte

Para suporte ou dúvidas:

- Abra uma issue no GitHub
- Entre em contato via email
- Consulte a documentação do código

## 🎉 Agradecimentos

- Comunidade de desenvolvedores web
- Inspiração em jogos NFT existentes
- Contribuidores do projeto

---

**DRAKTHAR** - O Universo dos Dragões NFT 🐉✨
