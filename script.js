// DRAKTHAR Game JavaScript
class DraktharGame {
    constructor() {
        this.currentSection = 'home';
        this.userData = {
            currency: 1000,
            incubationCurrency: 1000,
            dragons: [],
            eggs: [],
            inventory: [],
            expeditions: [],
            stats: {
                totalDragons: 0,
                totalEggs: 0,
                totalExpeditions: 0,
                totalBreedings: 0
            }
        };
        this.marketplaceItems = [];
        this.breedingParents = { parent1: null, parent2: null };
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.generateInitialMarketplace();
        this.loadUserData();
        this.updateUI();
        this.startGameLoop();
    }

    setupEventListeners() {
        // Navigation
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const section = e.target.getAttribute('href').substring(1);
                this.showSection(section);
            });
        });

        // Mobile menu toggle
        const navToggle = document.querySelector('.nav-toggle');
        const navMenu = document.querySelector('.nav-menu');
        
        navToggle.addEventListener('click', () => {
            navMenu.classList.toggle('active');
        });

        // Incubator slots
        document.querySelectorAll('.incubator-slot').forEach(slot => {
            slot.addEventListener('click', () => {
                this.handleIncubatorSlotClick(slot);
            });
        });

        // Breeding slots
        document.getElementById('parent-1').addEventListener('click', () => {
            this.openDragonSelectModal('parent1');
        });

        document.getElementById('parent-2').addEventListener('click', () => {
            this.openDragonSelectModal('parent2');
        });

        // Marketplace search and filters
        document.getElementById('marketplace-search').addEventListener('input', (e) => {
            this.filterMarketplace();
        });

        document.getElementById('rarity-filter').addEventListener('change', () => {
            this.filterMarketplace();
        });

        document.getElementById('type-filter').addEventListener('change', () => {
            this.filterMarketplace();
        });
    }

    showSection(sectionName) {
        // Hide all sections
        document.querySelectorAll('.section').forEach(section => {
            section.classList.add('hidden');
        });

        // Show target section
        const targetSection = document.getElementById(sectionName);
        if (targetSection) {
            targetSection.classList.remove('hidden');
            this.currentSection = sectionName;
            this.updateSectionContent(sectionName);
        }

        // Update navigation
        document.querySelectorAll('.nav-link').forEach(link => {
            link.classList.remove('active');
        });
        document.querySelector(`[href="#${sectionName}"]`).classList.add('active');

        // Close mobile menu
        document.querySelector('.nav-menu').classList.remove('active');
    }

    updateSectionContent(sectionName) {
        switch (sectionName) {
            case 'marketplace':
                this.updateMarketplace();
                break;
            case 'incubator':
                this.updateIncubator();
                break;
            case 'breeding':
                this.updateBreeding();
                break;
            case 'expeditions':
                this.updateExpeditions();
                break;
            case 'profile':
                this.updateProfile();
                break;
        }
    }

    // Marketplace Functions
    generateInitialMarketplace() {
        const eggTypes = ['Fire Egg', 'Ice Egg', 'Lightning Egg', 'Earth Egg', 'Water Egg'];
        const dragonTypes = ['Fire Dragon', 'Ice Dragon', 'Lightning Dragon', 'Earth Dragon', 'Water Dragon'];
        const rarities = ['common', 'rare', 'epic', 'legendary', 'mythic'];
        const rarityPrices = { common: 100, rare: 300, epic: 800, legendary: 2000, mythic: 5000 };

        // Generate eggs
        for (let i = 0; i < 20; i++) {
            const rarity = rarities[Math.floor(Math.random() * rarities.length)];
            this.marketplaceItems.push({
                id: `egg_${i}`,
                type: 'egg',
                name: eggTypes[Math.floor(Math.random() * eggTypes.length)],
                rarity: rarity,
                price: rarityPrices[rarity] + Math.floor(Math.random() * 100),
                image: '🥚',
                seller: `Player${Math.floor(Math.random() * 1000)}`,
                description: `Um ovo misterioso com potencial ${rarity}.`
            });
        }

        // Generate dragons
        for (let i = 0; i < 15; i++) {
            const rarity = rarities[Math.floor(Math.random() * rarities.length)];
            this.marketplaceItems.push({
                id: `dragon_${i}`,
                type: 'dragon',
                name: dragonTypes[Math.floor(Math.random() * dragonTypes.length)],
                rarity: rarity,
                price: rarityPrices[rarity] * 2 + Math.floor(Math.random() * 500),
                image: '🐉',
                seller: `Player${Math.floor(Math.random() * 1000)}`,
                description: `Um dragão ${rarity} com habilidades especiais.`,
                level: Math.floor(Math.random() * 50) + 1,
                abilities: ['Fire Breath', 'Ice Shield', 'Lightning Strike'][Math.floor(Math.random() * 3)]
            });
        }

        // Generate DNA samples
        for (let i = 0; i < 10; i++) {
            const rarity = rarities[Math.floor(Math.random() * rarities.length)];
            this.marketplaceItems.push({
                id: `dna_${i}`,
                type: 'dna',
                name: `${rarity.charAt(0).toUpperCase() + rarity.slice(1)} DNA`,
                rarity: rarity,
                price: rarityPrices[rarity] * 0.5 + Math.floor(Math.random() * 50),
                image: '🧬',
                seller: `Player${Math.floor(Math.random() * 1000)}`,
                description: `DNA ${rarity} para breeding.`,
                traits: ['Fire Resistance', 'Ice Immunity', 'Lightning Speed'][Math.floor(Math.random() * 3)]
            });
        }
    }

    updateMarketplace() {
        const container = document.getElementById('marketplace-items');
        container.innerHTML = '';

        this.marketplaceItems.forEach(item => {
            const itemElement = this.createMarketplaceItem(item);
            container.appendChild(itemElement);
        });
    }

    createMarketplaceItem(item) {
        const div = document.createElement('div');
        div.className = 'marketplace-item';
        div.innerHTML = `
            <div class="item-image">${item.image}</div>
            <div class="item-info">
                <h3>${item.name}</h3>
                <span class="item-rarity rarity-${item.rarity}">${item.rarity.charAt(0).toUpperCase() + item.rarity.slice(1)}</span>
                <p class="item-description">${item.description}</p>
                ${item.level ? `<p><strong>Level:</strong> ${item.level}</p>` : ''}
                ${item.abilities ? `<p><strong>Abilities:</strong> ${item.abilities}</p>` : ''}
                ${item.traits ? `<p><strong>Traits:</strong> ${item.traits}</p>` : ''}
                <p class="item-price">${item.price} 💰</p>
                <p class="item-seller">Vendedor: ${item.seller}</p>
                <div class="item-actions">
                    <button class="btn btn-primary btn-small" onclick="game.buyItem('${item.id}')">
                        <i class="fas fa-shopping-cart"></i> Comprar
                    </button>
                    <button class="btn btn-outline btn-small" onclick="game.viewItemDetails('${item.id}')">
                        <i class="fas fa-info-circle"></i> Detalhes
                    </button>
                </div>
            </div>
        `;
        return div;
    }

    filterMarketplace() {
        const searchTerm = document.getElementById('marketplace-search').value.toLowerCase();
        const rarityFilter = document.getElementById('rarity-filter').value;
        const typeFilter = document.getElementById('type-filter').value;

        const filteredItems = this.marketplaceItems.filter(item => {
            const matchesSearch = item.name.toLowerCase().includes(searchTerm) || 
                                item.description.toLowerCase().includes(searchTerm);
            const matchesRarity = !rarityFilter || item.rarity === rarityFilter;
            const matchesType = !typeFilter || item.type === typeFilter;

            return matchesSearch && matchesRarity && matchesType;
        });

        const container = document.getElementById('marketplace-items');
        container.innerHTML = '';

        filteredItems.forEach(item => {
            const itemElement = this.createMarketplaceItem(item);
            container.appendChild(itemElement);
        });
    }

    buyItem(itemId) {
        const item = this.marketplaceItems.find(i => i.id === itemId);
        if (!item) return;

        if (this.userData.currency >= item.price) {
            this.userData.currency -= item.price;
            
            // Add to user's collection
            if (item.type === 'dragon') {
                this.userData.dragons.push({
                    ...item,
                    id: `user_${Date.now()}`,
                    acquiredAt: new Date().toISOString()
                });
                this.userData.stats.totalDragons++;
            } else if (item.type === 'egg') {
                this.userData.eggs.push({
                    ...item,
                    id: `user_${Date.now()}`,
                    acquiredAt: new Date().toISOString()
                });
                this.userData.stats.totalEggs++;
            } else {
                this.userData.inventory.push({
                    ...item,
                    id: `user_${Date.now()}`,
                    acquiredAt: new Date().toISOString()
                });
            }

            // Remove from marketplace
            this.marketplaceItems = this.marketplaceItems.filter(i => i.id !== itemId);
            
            this.updateUI();
            this.updateMarketplace();
            this.showMessage(`Você comprou ${item.name}!`, 'success');
        } else {
            this.showMessage('Moedas insuficientes!', 'error');
        }
    }

    // Incubator Functions
    updateIncubator() {
        const slots = document.querySelectorAll('.incubator-slot');
        slots.forEach((slot, index) => {
            const slotData = this.userData.incubatorSlots?.[index];
            if (slotData && slotData.egg) {
                slot.classList.add('occupied');
                const timeLeft = slotData.endTime - Date.now();
                if (timeLeft > 0) {
                    slot.innerHTML = `
                        <div class="slot-content">
                            <div class="item-image">🥚</div>
                            <h3>${slotData.egg.name}</h3>
                            <p class="incubation-timer">${this.formatTime(timeLeft)}</p>
                            <button class="btn btn-outline btn-small" onclick="game.speedUpIncubation(${index})">
                                <i class="fas fa-bolt"></i> Acelerar
                            </button>
                        </div>
                    `;
                } else {
                    // Hatching complete
                    this.hatchEgg(index);
                }
            } else {
                slot.classList.remove('occupied');
                slot.innerHTML = `
                    <div class="slot-content">
                        <i class="fas fa-plus"></i>
                        <p>Slot Vazio</p>
                    </div>
                `;
            }
        });

        document.getElementById('incubation-currency').textContent = this.userData.incubationCurrency;
    }

    handleIncubatorSlotClick(slot) {
        if (!slot.classList.contains('occupied')) {
            this.openEggShop();
        }
    }

    openEggShop() {
        const modal = document.getElementById('egg-shop-modal');
        const container = document.getElementById('egg-shop-items');
        
        container.innerHTML = '';
        
        this.userData.eggs.forEach(egg => {
            const div = document.createElement('div');
            div.className = 'shop-item';
            div.innerHTML = `
                <div class="item-image">${egg.image}</div>
                <h3>${egg.name}</h3>
                <span class="item-rarity rarity-${egg.rarity}">${egg.rarity.charAt(0).toUpperCase() + egg.rarity.slice(1)}</span>
                <p>${egg.description}</p>
                <button class="btn btn-primary btn-small" onclick="game.incubateEgg('${egg.id}')">
                    <i class="fas fa-play"></i> Incubar
                </button>
            `;
            container.appendChild(div);
        });

        modal.classList.remove('hidden');
    }

    incubateEgg(eggId) {
        const egg = this.userData.eggs.find(e => e.id === eggId);
        if (!egg) return;

        // Find empty slot
        const emptySlotIndex = this.findEmptyIncubatorSlot();
        if (emptySlotIndex === -1) {
            this.showMessage('Todos os slots da incubadora estão ocupados!', 'error');
            return;
        }

        // Check if user has enough incubation currency
        const incubationCost = this.getIncubationCost(egg.rarity);
        if (this.userData.incubationCurrency < incubationCost) {
            this.showMessage('Moeda de incubação insuficiente!', 'error');
            return;
        }

        this.userData.incubationCurrency -= incubationCost;
        
        // Initialize incubator slots if not exists
        if (!this.userData.incubatorSlots) {
            this.userData.incubatorSlots = [{}, {}, {}];
        }

        // Start incubation
        const incubationTime = this.getIncubationTime(egg.rarity);
        this.userData.incubatorSlots[emptySlotIndex] = {
            egg: egg,
            startTime: Date.now(),
            endTime: Date.now() + incubationTime
        };

        // Remove egg from user's eggs
        this.userData.eggs = this.userData.eggs.filter(e => e.id !== eggId);

        this.closeModal('egg-shop-modal');
        this.updateUI();
        this.updateIncubator();
        this.showMessage(`Iniciando incubação de ${egg.name}!`, 'success');
    }

    findEmptyIncubatorSlot() {
        if (!this.userData.incubatorSlots) return 0;
        return this.userData.incubatorSlots.findIndex(slot => !slot.egg);
    }

    getIncubationCost(rarity) {
        const costs = { common: 50, rare: 100, epic: 200, legendary: 500, mythic: 1000 };
        return costs[rarity] || 50;
    }

    getIncubationTime(rarity) {
        const times = { 
            common: 5 * 60 * 1000,    // 5 minutes
            rare: 10 * 60 * 1000,    // 10 minutes
            epic: 20 * 60 * 1000,    // 20 minutes
            legendary: 30 * 60 * 1000, // 30 minutes
            mythic: 60 * 60 * 1000   // 1 hour
        };
        return times[rarity] || 5 * 60 * 1000;
    }

    speedUpIncubation(slotIndex) {
        const slot = this.userData.incubatorSlots[slotIndex];
        if (!slot) return;

        const speedUpCost = 100;
        if (this.userData.incubationCurrency >= speedUpCost) {
            this.userData.incubationCurrency -= speedUpCost;
            slot.endTime = Date.now();
            this.updateUI();
            this.updateIncubator();
            this.showMessage('Incubação acelerada!', 'success');
        } else {
            this.showMessage('Moeda de incubação insuficiente!', 'error');
        }
    }

    hatchEgg(slotIndex) {
        const slot = this.userData.incubatorSlots[slotIndex];
        if (!slot) return;

        const egg = slot.egg;
        const dragon = this.generateDragonFromEgg(egg);
        
        this.userData.dragons.push(dragon);
        this.userData.stats.totalDragons++;
        
        // Clear slot
        this.userData.incubatorSlots[slotIndex] = {};
        
        this.updateUI();
        this.updateIncubator();
        this.showMessage(`🎉 ${dragon.name} nasceu!`, 'success');
    }

    generateDragonFromEgg(egg) {
        const dragonTypes = ['Fire Dragon', 'Ice Dragon', 'Lightning Dragon', 'Earth Dragon', 'Water Dragon'];
        const abilities = ['Fire Breath', 'Ice Shield', 'Lightning Strike', 'Earth Crush', 'Water Wave'];
        
        return {
            id: `dragon_${Date.now()}`,
            name: dragonTypes[Math.floor(Math.random() * dragonTypes.length)],
            rarity: egg.rarity,
            level: 1,
            experience: 0,
            abilities: abilities[Math.floor(Math.random() * abilities.length)],
            image: '🐉',
            hatchedAt: new Date().toISOString(),
            parentEgg: egg.name,
            stats: {
                health: 100,
                attack: 50,
                defense: 30,
                speed: 40
            }
        };
    }

    // Breeding Functions
    updateBreeding() {
        const parent1Slot = document.getElementById('parent-1');
        const parent2Slot = document.getElementById('parent-2');
        const breedingBtn = document.getElementById('breeding-btn');

        // Update parent slots
        if (this.breedingParents.parent1) {
            parent1Slot.classList.add('selected');
            parent1Slot.innerHTML = `
                <div class="slot-content">
                    <div class="item-image">🐉</div>
                    <h3>${this.breedingParents.parent1.name}</h3>
                    <span class="item-rarity rarity-${this.breedingParents.parent1.rarity}">${this.breedingParents.parent1.rarity.charAt(0).toUpperCase() + this.breedingParents.parent1.rarity.slice(1)}</span>
                </div>
            `;
        } else {
            parent1Slot.classList.remove('selected');
            parent1Slot.innerHTML = `
                <div class="slot-content">
                    <i class="fas fa-plus"></i>
                    <p>Selecionar Dragão Pai</p>
                </div>
            `;
        }

        if (this.breedingParents.parent2) {
            parent2Slot.classList.add('selected');
            parent2Slot.innerHTML = `
                <div class="slot-content">
                    <div class="item-image">🐉</div>
                    <h3>${this.breedingParents.parent2.name}</h3>
                    <span class="item-rarity rarity-${this.breedingParents.parent2.rarity}">${this.breedingParents.parent2.rarity.charAt(0).toUpperCase() + this.breedingParents.parent2.rarity.slice(1)}</span>
                </div>
            `;
        } else {
            parent2Slot.classList.remove('selected');
            parent2Slot.innerHTML = `
                <div class="slot-content">
                    <i class="fas fa-plus"></i>
                    <p>Selecionar Dragão Mãe</p>
                </div>
            `;
        }

        // Enable/disable breeding button
        breedingBtn.disabled = !this.breedingParents.parent1 || !this.breedingParents.parent2;
    }

    openDragonSelectModal(parentType) {
        const modal = document.getElementById('dragon-select-modal');
        const container = document.getElementById('dragon-select-items');
        
        container.innerHTML = '';
        
        this.userData.dragons.forEach(dragon => {
            const div = document.createElement('div');
            div.className = 'select-item';
            div.innerHTML = `
                <div class="item-image">${dragon.image}</div>
                <h3>${dragon.name}</h3>
                <span class="item-rarity rarity-${dragon.rarity}">${dragon.rarity.charAt(0).toUpperCase() + dragon.rarity.slice(1)}</span>
                <p>Level: ${dragon.level}</p>
                <p>Abilities: ${dragon.abilities}</p>
                <button class="btn btn-primary btn-small" onclick="game.selectDragonForBreeding('${dragon.id}', '${parentType}')">
                    Selecionar
                </button>
            `;
            container.appendChild(div);
        });

        modal.classList.remove('hidden');
    }

    selectDragonForBreeding(dragonId, parentType) {
        const dragon = this.userData.dragons.find(d => d.id === dragonId);
        if (!dragon) return;

        this.breedingParents[parentType] = dragon;
        this.closeModal('dragon-select-modal');
        this.updateBreeding();
    }

    startBreeding() {
        if (!this.breedingParents.parent1 || !this.breedingParents.parent2) return;

        const breedingCost = 500;
        if (this.userData.currency < breedingCost) {
            this.showMessage('Moedas insuficientes para breeding!', 'error');
            return;
        }

        this.userData.currency -= breedingCost;
        this.userData.stats.totalBreedings++;

        // Generate new egg from breeding
        const newEgg = this.generateEggFromBreeding(this.breedingParents.parent1, this.breedingParents.parent2);
        this.userData.eggs.push(newEgg);
        this.userData.stats.totalEggs++;

        // Clear breeding parents
        this.breedingParents = { parent1: null, parent2: null };

        this.updateUI();
        this.updateBreeding();
        this.showMessage(`Novo ovo gerado: ${newEgg.name}!`, 'success');
    }

    generateEggFromBreeding(parent1, parent2) {
        const eggTypes = ['Fire Egg', 'Ice Egg', 'Lightning Egg', 'Earth Egg', 'Water Egg'];
        const rarities = ['common', 'rare', 'epic', 'legendary', 'mythic'];
        
        // Determine rarity based on parents
        let newRarity = 'common';
        if (parent1.rarity === 'mythic' || parent2.rarity === 'mythic') {
            newRarity = 'legendary';
        } else if (parent1.rarity === 'legendary' || parent2.rarity === 'legendary') {
            newRarity = 'epic';
        } else if (parent1.rarity === 'epic' || parent2.rarity === 'epic') {
            newRarity = 'rare';
        } else if (parent1.rarity === 'rare' || parent2.rarity === 'rare') {
            newRarity = 'rare';
        }

        // Small chance for higher rarity
        if (Math.random() < 0.1) {
            const rarityIndex = rarities.indexOf(newRarity);
            if (rarityIndex < rarities.length - 1) {
                newRarity = rarities[rarityIndex + 1];
            }
        }

        return {
            id: `egg_${Date.now()}`,
            type: 'egg',
            name: eggTypes[Math.floor(Math.random() * eggTypes.length)],
            rarity: newRarity,
            image: '🥚',
            description: `Ovo gerado pelo breeding de ${parent1.name} e ${parent2.name}.`,
            parent1: parent1.name,
            parent2: parent2.name,
            createdAt: new Date().toISOString()
        };
    }

    // Expeditions Functions
    updateExpeditions() {
        const activeExpeditionsContainer = document.getElementById('active-expeditions-list');
        activeExpeditionsContainer.innerHTML = '';

        this.userData.expeditions.forEach((expedition, index) => {
            const timeLeft = expedition.endTime - Date.now();
            if (timeLeft > 0) {
                const progress = ((expedition.duration - timeLeft) / expedition.duration) * 100;
                const expeditionElement = document.createElement('div');
                expeditionElement.className = 'active-expedition';
                expeditionElement.innerHTML = `
                    <h4>${expedition.name}</h4>
                    <p>Dragão: ${expedition.dragonName}</p>
                    <div class="expedition-progress">
                        <div class="progress-bar" style="width: ${progress}%"></div>
                    </div>
                    <p>Tempo restante: ${this.formatTime(timeLeft)}</p>
                `;
                activeExpeditionsContainer.appendChild(expeditionElement);
            } else {
                // Expedition completed
                this.completeExpedition(index);
            }
        });
    }

    startExpedition(expeditionType) {
        const expeditions = {
            forest: {
                name: 'Floresta Mística',
                duration: 2 * 60 * 1000, // 2 minutes for demo
                reward: { min: 100, max: 200 },
                resources: ['Madeira', 'Cristais']
            },
            mountain: {
                name: 'Montanhas Geladas',
                duration: 4 * 60 * 1000, // 4 minutes for demo
                reward: { min: 200, max: 400 },
                resources: ['Pedras Preciosas', 'Gelo']
            },
            volcano: {
                name: 'Vulcão Ardente',
                duration: 6 * 60 * 1000, // 6 minutes for demo
                reward: { min: 400, max: 800 },
                resources: ['Magma', 'Gemas']
            }
        };

        const expedition = expeditions[expeditionType];
        if (!expedition) return;

        // Check if user has available dragons
        const availableDragons = this.userData.dragons.filter(dragon => 
            !this.userData.expeditions.some(exp => exp.dragonId === dragon.id)
        );

        if (availableDragons.length === 0) {
            this.showMessage('Todos os seus dragões estão em expedições!', 'error');
            return;
        }

        // For demo, select first available dragon
        const selectedDragon = availableDragons[0];

        const newExpedition = {
            id: `exp_${Date.now()}`,
            type: expeditionType,
            name: expedition.name,
            dragonId: selectedDragon.id,
            dragonName: selectedDragon.name,
            startTime: Date.now(),
            endTime: Date.now() + expedition.duration,
            duration: expedition.duration,
            reward: expedition.reward,
            resources: expedition.resources
        };

        this.userData.expeditions.push(newExpedition);
        this.userData.stats.totalExpeditions++;

        this.updateUI();
        this.updateExpeditions();
        this.showMessage(`${selectedDragon.name} iniciou a expedição ${expedition.name}!`, 'success');
    }

    completeExpedition(expeditionIndex) {
        const expedition = this.userData.expeditions[expeditionIndex];
        if (!expedition) return;

        const reward = Math.floor(Math.random() * (expedition.reward.max - expedition.reward.min + 1)) + expedition.reward.min;
        this.userData.currency += reward;

        // Remove expedition
        this.userData.expeditions.splice(expeditionIndex, 1);

        this.updateUI();
        this.updateExpeditions();
        this.showMessage(`${expedition.dragonName} retornou da ${expedition.name} com ${reward} moedas!`, 'success');
    }

    // Profile Functions
    updateProfile() {
        // Update stats
        document.getElementById('total-dragons').textContent = this.userData.dragons.length;
        document.getElementById('total-eggs').textContent = this.userData.eggs.length;
        document.getElementById('total-currency').textContent = this.userData.currency;
        document.getElementById('total-expeditions').textContent = this.userData.stats.totalExpeditions;

        // Update dragons tab
        this.updateDragonsTab();
        this.updateEggsTab();
        this.updateInventoryTab();
    }

    updateDragonsTab() {
        const container = document.getElementById('user-dragons');
        container.innerHTML = '';

        this.userData.dragons.forEach(dragon => {
            const div = document.createElement('div');
            div.className = 'dragon-card';
            div.innerHTML = `
                <div class="item-image">${dragon.image}</div>
                <h3>${dragon.name}</h3>
                <span class="item-rarity rarity-${dragon.rarity}">${dragon.rarity.charAt(0).toUpperCase() + dragon.rarity.slice(1)}</span>
                <p><strong>Level:</strong> ${dragon.level}</p>
                <p><strong>Abilities:</strong> ${dragon.abilities}</p>
                <p><strong>Health:</strong> ${dragon.stats.health}</p>
                <p><strong>Attack:</strong> ${dragon.stats.attack}</p>
                <div class="item-actions">
                    <button class="btn btn-outline btn-small" onclick="game.sendDragonToExpedition('${dragon.id}')">
                        <i class="fas fa-mountain"></i> Expedição
                    </button>
                </div>
            `;
            container.appendChild(div);
        });
    }

    updateEggsTab() {
        const container = document.getElementById('user-eggs');
        container.innerHTML = '';

        this.userData.eggs.forEach(egg => {
            const div = document.createElement('div');
            div.className = 'egg-card';
            div.innerHTML = `
                <div class="item-image">${egg.image}</div>
                <h3>${egg.name}</h3>
                <span class="item-rarity rarity-${egg.rarity}">${egg.rarity.charAt(0).toUpperCase() + egg.rarity.slice(1)}</span>
                <p>${egg.description}</p>
                ${egg.parent1 ? `<p><strong>Pais:</strong> ${egg.parent1} & ${egg.parent2}</p>` : ''}
                <div class="item-actions">
                    <button class="btn btn-primary btn-small" onclick="game.openEggShop()">
                        <i class="fas fa-play"></i> Incubar
                    </button>
                </div>
            `;
            container.appendChild(div);
        });
    }

    updateInventoryTab() {
        const container = document.getElementById('user-inventory');
        container.innerHTML = '';

        this.userData.inventory.forEach(item => {
            const div = document.createElement('div');
            div.className = 'inventory-item';
            div.innerHTML = `
                <div class="item-image">${item.image}</div>
                <h3>${item.name}</h3>
                <span class="item-rarity rarity-${item.rarity}">${item.rarity.charAt(0).toUpperCase() + item.rarity.slice(1)}</span>
                <p>${item.description}</p>
                ${item.traits ? `<p><strong>Traits:</strong> ${item.traits}</p>` : ''}
            `;
            container.appendChild(div);
        });
    }

    sendDragonToExpedition(dragonId) {
        // This would open expedition selection modal
        this.showSection('expeditions');
        this.showMessage('Selecione uma expedição para enviar seu dragão!', 'info');
    }

    // Utility Functions
    formatTime(milliseconds) {
        const seconds = Math.floor(milliseconds / 1000);
        const minutes = Math.floor(seconds / 60);
        const hours = Math.floor(minutes / 60);
        
        if (hours > 0) {
            return `${hours}h ${minutes % 60}m ${seconds % 60}s`;
        } else if (minutes > 0) {
            return `${minutes}m ${seconds % 60}s`;
        } else {
            return `${seconds}s`;
        }
    }

    showMessage(message, type = 'info') {
        // Create message element
        const messageDiv = document.createElement('div');
        messageDiv.className = `message ${type}`;
        messageDiv.textContent = message;
        
        // Add to page
        document.body.appendChild(messageDiv);
        
        // Remove after 3 seconds
        setTimeout(() => {
            messageDiv.remove();
        }, 3000);
    }

    closeModal(modalId) {
        document.getElementById(modalId).classList.add('hidden');
    }

    showTab(tabName) {
        // Hide all tab panels
        document.querySelectorAll('.tab-panel').forEach(panel => {
            panel.classList.remove('active');
        });

        // Remove active class from all tab buttons
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.classList.remove('active');
        });

        // Show selected tab panel
        document.getElementById(`${tabName}-tab`).classList.add('active');
        
        // Add active class to clicked button
        event.target.classList.add('active');
    }

    updateUI() {
        // Update currency displays
        document.getElementById('total-currency').textContent = this.userData.currency;
        document.getElementById('incubation-currency').textContent = this.userData.incubationCurrency;
    }

    loadUserData() {
        const savedData = localStorage.getItem('drakthar_user_data');
        if (savedData) {
            this.userData = { ...this.userData, ...JSON.parse(savedData) };
        }
    }

    saveUserData() {
        localStorage.setItem('drakthar_user_data', JSON.stringify(this.userData));
    }

    startGameLoop() {
        setInterval(() => {
            this.updateIncubator();
            this.updateExpeditions();
            this.saveUserData();
        }, 1000); // Update every second
    }
}

// Global functions for HTML onclick events
function showSection(sectionName) {
    game.showSection(sectionName);
}

function openEggShop() {
    game.openEggShop();
}

function startBreeding() {
    game.startBreeding();
}

function startExpedition(expeditionType) {
    game.startExpedition(expeditionType);
}

function showTab(tabName) {
    game.showTab(tabName);
}

function closeModal(modalId) {
    game.closeModal(modalId);
}

// Initialize game when page loads
let game;
document.addEventListener('DOMContentLoaded', () => {
    game = new DraktharGame();
});
