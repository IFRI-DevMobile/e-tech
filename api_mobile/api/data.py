from store.models import Product

products_data = [
    # Catégorie 1: Ordinateurs
    {
        'name': 'MacBook Pro 16" M3',
        'description': 'Ordinateur portable professionnel avec puce M3, 16 Go RAM, 512 Go SSD. Écran Retina XDR pour une qualité d\'image exceptionnelle.',
        'price': 2499.99,
        'stock': 15,
        'image_url': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
        'category_id': 1
    },
    {
        'name': 'Dell XPS 15',
        'description': 'PC portable premium avec processeur Intel Core i7, 32 Go RAM, écran OLED 4K. Parfait pour le multitâche et la création de contenu.',
        'price': 1899.99,
        'stock': 22,
        'image_url': 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45',
        'category_id': 1
    },
    {
        'name': 'HP Pavilion Desktop',
        'description': 'PC de bureau polyvalent avec processeur AMD Ryzen 5, 16 Go RAM, 1 To HDD + 256 Go SSD. Idéal pour la bureautique et le divertissement.',
        'price': 799.99,
        'stock': 30,
        'image_url': 'https://images.unsplash.com/photo-1587202372634-32705e3bf49c',
        'category_id': 1
    },
    {
        'name': 'Lenovo ThinkPad X1 Carbon',
        'description': 'Ultrabook professionnel léger, processeur Intel Core i5, 16 Go RAM, 512 Go SSD. Robuste et fiable pour les déplacements.',
        'price': 1599.99,
        'stock': 18,
        'image_url': 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed',
        'category_id': 1
    },
    {
        'name': 'ASUS ROG Strix G15',
        'description': 'PC portable gaming avec RTX 4060, AMD Ryzen 7, 16 Go RAM, 1 To SSD. Écran 165 Hz pour une expérience gaming fluide.',
        'price': 1399.99,
        'stock': 12,
        'image_url': 'https://images.unsplash.com/photo-1603302576837-37561b2e2302',
        'category_id': 1
    },
    {
        'name': 'iMac 24" M3',
        'description': 'Ordinateur tout-en-un avec puce M3, écran Retina 4.5K, 8 Go RAM, 256 Go SSD. Design élégant disponible en plusieurs couleurs.',
        'price': 1499.99,
        'stock': 20,
        'image_url': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97',
        'category_id': 1
    },
    {
        'name': 'Acer Aspire 5',
        'description': 'PC portable économique avec Intel Core i3, 8 Go RAM, 512 Go SSD. Parfait pour les étudiants et usage bureautique.',
        'price': 549.99,
        'stock': 45,
        'image_url': 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853',
        'category_id': 1
    },
    {
        'name': 'Microsoft Surface Laptop 5',
        'description': 'Laptop élégant avec écran tactile, Intel Core i7, 16 Go RAM, 512 Go SSD. Interface tactile intuitive avec Windows 11.',
        'price': 1299.99,
        'stock': 25,
        'image_url': 'https://images.unsplash.com/photo-1629131726692-1accd0c53ce0',
        'category_id': 1
    },
    {
        'name': 'Custom Gaming PC RGB',
        'description': 'PC assemblé sur mesure: RTX 4070 Ti, Intel i9, 32 Go RAM DDR5, 2 To NVMe. Boîtier RGB avec refroidissement liquide.',
        'price': 2799.99,
        'stock': 8,
        'image_url': 'https://images.unsplash.com/photo-1587202372583-49330a15584d',
        'category_id': 1
    },
    {
        'name': 'Chromebook Lenovo IdeaPad',
        'description': 'Ordinateur portable Chrome OS, MediaTek, 4 Go RAM, 64 Go eMMC. Rapide, sécurisé et parfait pour le cloud.',
        'price': 349.99,
        'stock': 50,
        'image_url': 'https://images.unsplash.com/photo-1484788984921-03950022c9ef',
        'category_id': 1
    },

    # Catégorie 2: Téléphones
    {
        'name': 'iPhone 15 Pro Max',
        'description': 'Smartphone premium avec puce A17 Pro, appareil photo 48 MP, écran Super Retina XDR 6.7", 256 Go. Titane.',
        'price': 1299.99,
        'stock': 35,
        'image_url': 'https://images.unsplash.com/photo-1592286927505-2c28cb8e8e2c',
        'category_id': 2
    },
    {
        'name': 'Samsung Galaxy S24 Ultra',
        'description': 'Flagship Android avec S Pen, Snapdragon 8 Gen 3, caméra 200 MP, écran AMOLED 6.8", 512 Go.',
        'price': 1199.99,
        'stock': 28,
        'image_url': 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c',
        'category_id': 2
    },
    {
        'name': 'Google Pixel 8 Pro',
        'description': 'Smartphone IA avec Tensor G3, meilleur appareil photo computational, écran 120 Hz, 256 Go. Pure Android.',
        'price': 999.99,
        'stock': 40,
        'image_url': 'https://images.unsplash.com/photo-1598327105666-5b89351aff97',
        'category_id': 2
    },
    {
        'name': 'OnePlus 12',
        'description': 'Flagship killer avec Snapdragon 8 Gen 3, charge rapide 100W, écran AMOLED 120 Hz, 256 Go.',
        'price': 799.99,
        'stock': 32,
        'image_url': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
        'category_id': 2
    },
    {
        'name': 'Xiaomi 14 Pro',
        'description': 'Smartphone performant avec caméra Leica, Snapdragon 8 Gen 3, charge sans fil 50W, 512 Go.',
        'price': 899.99,
        'stock': 25,
        'image_url': 'https://images.unsplash.com/photo-1574944985070-8f3ebc6b79d2',
        'category_id': 2
    },
    {
        'name': 'iPhone 14',
        'description': 'iPhone avec puce A15 Bionic, double caméra 12 MP, écran OLED 6.1", 128 Go. Excellent rapport qualité-prix.',
        'price': 799.99,
        'stock': 50,
        'image_url': 'https://images.unsplash.com/photo-1556656793-08538906a9f8',
        'category_id': 2
    },
    {
        'name': 'Samsung Galaxy A54',
        'description': 'Milieu de gamme avec écran Super AMOLED, caméra 50 MP, batterie 5000 mAh, 128 Go. Résistant à l\'eau.',
        'price': 449.99,
        'stock': 60,
        'image_url': 'https://images.unsplash.com/photo-1580910051074-3eb694886505',
        'category_id': 2
    },
    {
        'name': 'Motorola Edge 40',
        'description': 'Smartphone élégant avec écran incurvé 144 Hz, charge rapide 68W, 256 Go. Android pur et rapide.',
        'price': 599.99,
        'stock': 38,
        'image_url': 'https://images.unsplash.com/photo-1585060544812-6b45742d762f',
        'category_id': 2
    },
    {
        'name': 'Nothing Phone (2)',
        'description': 'Design unique avec Glyph Interface, Snapdragon 8+ Gen 1, écran OLED 120 Hz, 256 Go.',
        'price': 699.99,
        'stock': 22,
        'image_url': 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb',
        'category_id': 2
    },
    {
        'name': 'Oppo Find X6 Pro',
        'description': 'Flagship avec triple caméra Hasselblad, Snapdragon 8 Gen 2, charge 100W, écran AMOLED 2K.',
        'price': 1099.99,
        'stock': 18,
        'image_url': 'https://images.unsplash.com/photo-1512499617640-c74ae3a79d37',
        'category_id': 2
    },

    # Catégorie 3: Tablettes
    {
        'name': 'iPad Pro 12.9" M2',
        'description': 'Tablette professionnelle avec puce M2, écran Liquid Retina XDR, 256 Go, compatible Apple Pencil et Magic Keyboard.',
        'price': 1099.99,
        'stock': 20,
        'image_url': 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0',
        'category_id': 3
    },
    {
        'name': 'Samsung Galaxy Tab S9 Ultra',
        'description': 'Tablette Android premium 14.6", Snapdragon 8 Gen 2, S Pen inclus, 512 Go, écran AMOLED 120 Hz.',
        'price': 1199.99,
        'stock': 15,
        'image_url': 'https://images.unsplash.com/photo-1585790050230-5dd28404f805',
        'category_id': 3
    },
    {
        'name': 'iPad Air 11" M2',
        'description': 'Tablette légère avec puce M2, écran Liquid Retina, 128 Go, Touch ID. Parfaite pour la créativité mobile.',
        'price': 599.99,
        'stock': 35,
        'image_url': 'https://images.unsplash.com/photo-1561154464-82e9adf32764',
        'category_id': 3
    },
    {
        'name': 'Microsoft Surface Pro 9',
        'description': 'Tablette 2-en-1 Windows, Intel Core i7, 16 Go RAM, 512 Go SSD, écran tactile 13". Remplace un laptop.',
        'price': 1299.99,
        'stock': 18,
        'image_url': 'https://images.unsplash.com/photo-1632833239869-a37e3a5806d2',
        'category_id': 3
    },
    {
        'name': 'Lenovo Tab P12 Pro',
        'description': 'Tablette Android 12.6" AMOLED, Snapdragon 870, 256 Go, stylet inclus. Idéale pour le divertissement.',
        'price': 699.99,
        'stock': 25,
        'image_url': 'https://images.unsplash.com/photo-1611532736597-de2d4265fba3',
        'category_id': 3
    },
    {
        'name': 'iPad 10.9"',
        'description': 'iPad polyvalent avec puce A14 Bionic, écran Liquid Retina, 64 Go, compatible Apple Pencil 1ère génération.',
        'price': 449.99,
        'stock': 45,
        'image_url': 'https://images.unsplash.com/photo-1544244015-9c72fd9d2e5d',
        'category_id': 3
    },
    {
        'name': 'Samsung Galaxy Tab S9',
        'description': 'Tablette compacte 11", Snapdragon 8 Gen 2, S Pen inclus, 128 Go, résistante à l\'eau IP68.',
        'price': 799.99,
        'stock': 30,
        'image_url': 'https://images.unsplash.com/photo-1586953208270-e6255e6bba99',
        'category_id': 3
    },
    {
        'name': 'Amazon Fire HD 10',
        'description': 'Tablette économique 10.1", quad-core, 32 Go, parfaite pour la lecture et le streaming. Alexa intégrée.',
        'price': 149.99,
        'stock': 60,
        'image_url': 'https://images.unsplash.com/photo-1542751110-97427bbecf20',
        'category_id': 3
    },
    {
        'name': 'Huawei MatePad Pro',
        'description': 'Tablette premium 11", Snapdragon, M-Pencil inclus, 256 Go, écran OLED FullView avec encoche minimaliste.',
        'price': 649.99,
        'stock': 22,
        'image_url': 'https://images.unsplash.com/photo-1590247813693-5541d1c609fd',
        'category_id': 3
    },
    {
        'name': 'iPad mini 6',
        'description': 'Tablette compacte 8.3" avec puce A15 Bionic, 64 Go, Touch ID, compatible Apple Pencil 2. Ultra portable.',
        'price': 499.99,
        'stock': 28,
        'image_url': 'https://images.unsplash.com/photo-1544244015-9c72fd9d2e5e',
        'category_id': 3
    },

    # Catégorie 4: Accessoires
    {
        'name': 'AirPods Pro 2',
        'description': 'Écouteurs sans fil avec réduction de bruit active adaptative, audio spatial, étui MagSafe. Autonomie 6h.',
        'price': 249.99,
        'stock': 80,
        'image_url': 'https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7',
        'category_id': 4
    },
    {
        'name': 'Sony WH-1000XM5',
        'description': 'Casque Bluetooth premium avec meilleure réduction de bruit du marché, son Hi-Res, autonomie 30h.',
        'price': 399.99,
        'stock': 50,
        'image_url': 'https://images.unsplash.com/photo-1546435770-a3e426bf472b',
        'category_id': 4
    },
    {
        'name': 'Logitech MX Master 3S',
        'description': 'Souris ergonomique sans fil professionnelle, capteur 8000 DPI, 8 boutons programmables, batterie 70 jours.',
        'price': 99.99,
        'stock': 65,
        'image_url': 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46',
        'category_id': 4
    },
    {
        'name': 'Apple Magic Keyboard',
        'description': 'Clavier sans fil avec pavé tactile intégré, batterie rechargeable, design aluminium. Compatible Mac et iPad.',
        'price': 149.99,
        'stock': 40,
        'image_url': 'https://images.unsplash.com/photo-1587829741301-dc798b83add3',
        'category_id': 4
    },
    {
        'name': 'Anker PowerCore 20000mAh',
        'description': 'Batterie externe haute capacité, charge rapide USB-C PD 20W, 2 ports, compact et léger.',
        'price': 49.99,
        'stock': 100,
        'image_url': 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c5',
        'category_id': 4
    },
    {
        'name': 'Samsung T7 SSD Portable 1To',
        'description': 'Disque SSD externe ultra-rapide, USB 3.2 Gen 2, lecture 1050 Mo/s, chiffrement matériel, résistant aux chocs.',
        'price': 139.99,
        'stock': 55,
        'image_url': 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b',
        'category_id': 4
    },
    {
        'name': 'Belkin 3-in-1 Wireless Charger',
        'description': 'Station de charge sans fil pour iPhone, Apple Watch et AirPods. Design élégant, charge rapide 15W.',
        'price': 129.99,
        'stock': 45,
        'image_url': 'https://images.unsplash.com/photo-1591290619762-c588f8ab6571',
        'category_id': 4
    },
    {
        'name': 'Webcam Logitech C920 HD Pro',
        'description': 'Webcam Full HD 1080p, autofocus, correction lumière, micro stéréo. Parfaite pour visioconférences.',
        'price': 79.99,
        'stock': 70,
        'image_url': 'https://images.unsplash.com/photo-1587826080692-f439cd0b70da',
        'category_id': 4
    },
    {
        'name': 'Apple Pencil 2',
        'description': 'Stylet pour iPad Pro/Air avec charge sans fil magnétique, sensibilité à la pression et l\'inclinaison.',
        'price': 129.99,
        'stock': 60,
        'image_url': 'https://images.unsplash.com/photo-1611532736616-21e970d60318',
        'category_id': 4
    },
    {
        'name': 'Hub USB-C Anker 7-en-1',
        'description': 'Adaptateur multiport avec HDMI 4K, USB 3.0, lecteur SD/microSD, USB-C PD 100W. Compact et portable.',
        'price': 59.99,
        'stock': 85,
        'image_url': 'https://images.unsplash.com/photo-1625948515291-69613efd103f',
        'category_id': 4
    },

    # Catégorie 5: Gaming
    {
        'name': 'PlayStation 5',
        'description': 'Console next-gen avec SSD ultra-rapide, ray tracing, 4K/120fps, manette DualSense haptique. 825 Go.',
        'price': 499.99,
        'stock': 25,
        'image_url': 'https://images.unsplash.com/photo-1606813907291-d86efa9b94db',
        'category_id': 5
    },
    {
        'name': 'Xbox Series X',
        'description': 'Console puissante 4K native, 1 To SSD, rétrocompatibilité, Game Pass Ultimate. 12 téraflops.',
        'price': 499.99,
        'stock': 30,
        'image_url': 'https://images.unsplash.com/photo-1621259182978-fbf93132d53d',
        'category_id': 5
    },
    {
        'name': 'Nintendo Switch OLED',
        'description': 'Console hybride avec écran OLED 7", 64 Go, dock LAN, son amélioré. Jouez partout.',
        'price': 349.99,
        'stock': 40,
        'image_url': 'https://images.unsplash.com/photo-1578303512597-81e6cc155b3e',
        'category_id': 5
    },
    {
        'name': 'Razer BlackWidow V4 Pro',
        'description': 'Clavier mécanique gaming RGB, switches verts tactiles, repose-poignet, molette multifonction, USB passthrough.',
        'price': 229.99,
        'stock': 35,
        'image_url': 'https://images.unsplash.com/photo-1595225476474-87563907a212',
        'category_id': 5
    },
    {
        'name': 'Logitech G Pro X Superlight',
        'description': 'Souris gaming sans fil ultra-légère 63g, capteur HERO 25K, batterie 70h, switches mécaniques.',
        'price': 159.99,
        'stock': 50,
        'image_url': 'https://images.unsplash.com/photo-1527814050087-3793815479db',
        'category_id': 5
    },
    {
        'name': 'SteelSeries Arctis Nova Pro',
        'description': 'Casque gaming haut de gamme avec DAC, réduction de bruit active, audio haute résolution, micro ClearCast.',
        'price': 349.99,
        'stock': 28,
        'image_url': 'https://images.unsplash.com/photo-1599669454699-248893623440',
        'category_id': 5
    },
    {
        'name': 'Elgato Stream Deck',
        'description': 'Contrôleur de streaming avec 15 touches LCD personnalisables, macros, intégrations OBS/Twitch/YouTube.',
        'price': 149.99,
        'stock': 42,
        'image_url': 'https://images.unsplash.com/photo-1591405351990-4726e331f141',
        'category_id': 5
    },
    {
        'name': 'Valve Steam Deck',
        'description': 'Console portable PC gaming, écran 7" tactile, 512 Go NVMe, SteamOS. Jouez à votre bibliothèque Steam.',
        'price': 649.99,
        'stock': 20,
        'image_url': 'https://images.unsplash.com/photo-1635514498050-14c3bc4ce617',
        'category_id': 5
    },
    {
        'name': 'Manette Xbox Elite Series 2',
        'description': 'Manette pro personnalisable, sticks interchangeables, gâchettes ajustables, batterie 40h, étui inclus.',
        'price': 179.99,
        'stock': 38,
        'image_url': 'https://images.unsplash.com/photo-1592840496694-26d035b52b48',
        'category_id': 5
    },
    {
        'name': 'Corsair K70 RGB TKL',
        'description': 'Clavier gaming mécanique compact sans pavé numérique, switches Cherry MX, RGB dynamique, aluminium.',
        'price': 139.99,
        'stock': 45,
        'image_url': 'https://images.unsplash.com/photo-1587829741301-dc798b83add4',
        'category_id': 5
    },

    # Catégorie 6: Réseau
    {
        'name': 'TP-Link Archer AX73',
        'description': 'Routeur Wi-Fi 6 dual-band 5400 Mbps, 6 antennes, OFDMA, MU-MIMO, ports Gigabit. Couvre 200m².',
        'price': 149.99,
        'stock': 40,
        'image_url': 'https://images.unsplash.com/photo-1606904825846-647eb07f5be2',
        'category_id': 6
    },
    {
        'name': 'Netgear Orbi WiFi 6 Mesh',
        'description': 'Système mesh tri-band 6 Gbps, couvre 525m², 3 unités, compatible 100+ appareils. Wi-Fi partout.',
        'price': 599.99,
        'stock': 18,
        'image_url': 'https://images.unsplash.com/photo-1606904825679-b2c3f284397c',
        'category_id': 6
    },
    {
        'name': 'Ubiquiti UniFi Dream Machine',
        'description': 'Routeur tout-en-un professionnel, Wi-Fi 6, contrôleur intégré, sécurité avancée, 4 ports Gigabit.',
        'price': 379.99,
        'stock': 25,
        'image_url': 'https://images.unsplash.com/photo-1626428092703-e329bea5b3b0',
        'category_id': 6
    },
    {
        'name': 'Switch Netgear GS308',
        'description': 'Switch Gigabit 8 ports non managé, plug-and-play, boîtier métal, économie d\'énergie. Silencieux.',
        'price': 39.99,
        'stock': 70,
        'image_url': 'https://images.unsplash.com/photo-1625133582925-45c9ae7693a1',
        'category_id': 6
    },
    {
        'name': 'ASUS RT-AX86U Pro',
        'description': 'Routeur gaming Wi-Fi 6E, port 2.5G, AiMesh, contrôle parental, VPN, optimisation gaming mobile.',
        'price': 279.99,
        'stock': 32,
        'image_url': 'https://images.unsplash.com/photo-1606904825846-647eb07f5be3',
        'category_id': 6
    },
    {
        'name': 'Modem ARRIS SURFboard',
        'description': 'Modem câble DOCSIS 3.1, vitesses jusqu\'à 10 Gbps, compatible principaux FAI, 2 ports Ethernet Gigabit.',
        'price': 179.99,
        'stock': 35,
        'image_url': 'https://images.unsplash.com/photo-1606904825846-647eb07f5be4',
        'category_id': 6
    },
    {
        'name': 'TP-Link Deco X60',
        'description': 'Système mesh Wi-Fi 6 AX3000, pack de 3, couvre 600m², contrôle parental HomeShield, setup facile.',
        'price': 299.99,
        'stock': 28,
        'image_url': 'https://images.unsplash.com/photo-1606904825679-b2c3f284397d',
        'category_id': 6
    },
    {
        'name': 'Switch TP-Link TL-SG116',
        'description': 'Switch Gigabit 16 ports non managé, boîtier métal, Green Ethernet, montage rack ou bureau.',
        'price': 89.99,
        'stock': 45,
        'image_url': 'https://images.unsplash.com/photo-1625133582925-45c9ae7693a2',
        'category_id': 6
    },
    {
        'name': 'Powerline TP-Link AV2000',
        'description': 'Adaptateur CPL 2000 Mbps, kit de 2, 2 ports Gigabit par adaptateur, prise filtrée intégrée.',
        'price': 99.99,
        'stock': 50,
        'image_url': 'https://images.unsplash.com/photo-1597841557472-c6370ade75e3',
        'category_id': 6
    },
    {
        'name': 'Répéteur Wi-Fi 6 Netgear EAX20',
        'description': 'Amplificateur de signal Wi-Fi 6 AX1800, 4 flux simultanés, port Ethernet, couvre 150m² supplémentaires.',
        'price': 119.99,
        'stock': 55,
        'image_url': 'https://images.unsplash.com/photo-1606904825846-647eb07f5be5',
        'category_id': 6
    },

    # Catégorie 7: Stockage
    {
        'name': 'Samsung 990 Pro 2To NVMe',
        'description': 'SSD interne PCIe 4.0, lecture 7450 Mo/s, écriture 6900 Mo/s, dissipateur thermique inclus. Le plus rapide.',
        'price': 189.99,
        'stock': 45,
        'image_url': 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16c',
        'category_id': 7
    },
    {
        'name': 'WD Black SN850X 1To',
        'description': 'SSD NVMe gaming PCIe 4.0, lecture 7300 Mo/s, écriture 6300 Mo/s, Game Mode 2.0. Optimisé pour PS5/Xbox.',
        'price': 149.99,
        'stock': 60,
        'image_url': 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16d',
        'category_id': 7
    },
    {
        'name': 'Crucial P5 Plus 500Go',
        'description': 'SSD NVMe PCIe 4.0, lecture 6600 Mo/s, idéal pour upgrade laptop, faible consommation, garantie 5 ans.',
        'price': 79.99,
        'stock': 75,
        'image_url': 'https://images.unsplash.com/photo-1531492746076-161ca9bcad58',
        'category_id': 7
    },
    {
        'name': 'Seagate IronWolf 4To',
        'description': 'Disque dur NAS 3.5", 5400 RPM, cache 64 Mo, technologie AgileArray, conçu pour fonctionnement 24/7.',
        'price': 119.99,
        'stock': 50,
        'image_url': 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16e',
        'category_id': 7
    },
    {
        'name': 'SanDisk Extreme Pro 1To',
        'description': 'SSD externe portable, lecture 2000 Mo/s, USB-C 3.2 Gen 2x2, résistant aux chocs/eau IP55, compact.',
        'price': 169.99,
        'stock': 55,
        'image_url': 'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad',
        'category_id': 7
    },
    {
        'name': 'Kingston Fury Renegade 2To',
        'description': 'SSD NVMe PCIe 4.0 hautes performances, lecture 7300 Mo/s, dissipateur graphène-aluminium, garantie 5 ans.',
        'price': 199.99,
        'stock': 40,
        'image_url': 'https://images.unsplash.com/photo-1591488320449-011701bb6704',
        'category_id': 7
    },
    {
        'name': 'WD My Book 8To',
        'description': 'Disque dur externe bureau 3.5", USB 3.0, sauvegarde auto, chiffrement matériel 256-bit AES, alimentation secteur.',
        'price': 179.99,
        'stock': 35,
        'image_url': 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16f',
        'category_id': 7
    },
    {
        'name': 'Synology DiskStation DS220+',
        'description': 'NAS 2 baies, Intel Celeron dual-core, 2 Go RAM, RAID, cloud privé, transcoding 4K, apps mobiles.',
        'price': 299.99,
        'stock': 25,
        'image_url': 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ee',
        'category_id': 7
    },
    {
        'name': 'Samsung Fit Plus 128Go',
        'description': 'Clé USB 3.1 ultra-compacte, lecture 300 Mo/s, résistante eau/chocs/températures, mini-format discret.',
        'price': 24.99,
        'stock': 100,
        'image_url': 'https://images.unsplash.com/photo-1609081219090-a6d81d3085bf',
        'category_id': 7
    },
    {
        'name': 'Lexar Professional 256Go',
        'description': 'Carte SD UHS-II, lecture 250 Mo/s, écriture 120 Mo/s, V60, idéale photo/vidéo 4K, garantie à vie.',
        'price': 49.99,
        'stock': 80,
        'image_url': 'https://images.unsplash.com/photo-1626785774573-4b799315345d',
        'category_id': 7
    },

    # Catégorie 8: Périphériques
    {
        'name': 'LG UltraGear 27" QHD 165Hz',
        'description': 'Écran gaming IPS 2560x1440, 165 Hz, 1ms, G-Sync Compatible, HDR10, ajustable hauteur/pivot.',
        'price': 399.99,
        'stock': 30,
        'image_url': 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf',
        'category_id': 8
    },
    {
        'name': 'Dell UltraSharp U2723DE',
        'description': 'Écran professionnel 27" QHD IPS, USB-C 90W, hub USB, 99% sRGB, ComfortView Plus, réglages ergonomiques.',
        'price': 549.99,
        'stock': 25,
        'image_url': 'https://images.unsplash.com/photo-1585779034823-7e9ac8faec70',
        'category_id': 8
    },
    {
        'name': 'Canon PIXMA TR8620',
        'description': 'Imprimante multifonction jet d\'encre, Wi-Fi, recto-verso auto, écran tactile, 5 cartouches séparées.',
        'price': 199.99,
        'stock': 35,
        'image_url': 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6',
        'category_id': 8
    },
    {
        'name': 'HP LaserJet Pro M404dn',
        'description': 'Imprimante laser monochrome, recto-verso, Ethernet, 38 ppm, 350 feuilles, sécurité intégrée.',
        'price': 279.99,
        'stock': 28,
        'image_url': 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa7',
        'category_id': 8
    },
    {
        'name': 'Logitech MX Keys',
        'description': 'Clavier sans fil rétroéclairé intelligent, multi-dispositifs, touches concaves, USB-C rechargeable, métal.',
        'price': 119.99,
        'stock': 55,
        'image_url': 'https://images.unsplash.com/photo-1587829741301-dc798b83add5',
        'category_id': 8
    },
    {
        'name': 'BenQ ScreenBar Plus',
        'description': 'Lampe de bureau pour écran, température de couleur ajustable, contrôleur sans fil, économise l\'espace.',
        'price': 129.99,
        'stock': 40,
        'image_url': 'https://images.unsplash.com/photo-1507238691740-187a5b1d37b8',
        'category_id': 8
    },
    {
        'name': 'Wacom Intuos Pro Medium',
        'description': 'Tablette graphique professionnelle, 8192 niveaux de pression, multi-touch, stylet Pro Pen 2, sans fil.',
        'price': 379.99,
        'stock': 20,
        'image_url': 'https://images.unsplash.com/photo-1612198188060-c7c2a3b66eae',
        'category_id': 8
    },
    {
        'name': 'Samsung Odyssey G9 49"',
        'description': 'Écran gaming ultra-wide incurvé 1000R, DQHD 5120x1440, 240 Hz, 1ms, HDR1000, G-Sync/FreeSync.',
        'price': 1299.99,
        'stock': 12,
        'image_url': 'https://images.unsplash.com/photo-1586210579191-33b45e38fa8c',
        'category_id': 8
    },
    {
        'name': 'Epson EcoTank ET-2820',
        'description': 'Imprimante multifonction à réservoirs rechargeables, Wi-Fi, jusqu\'à 4500 pages noires, économique.',
        'price': 249.99,
        'stock': 32,
        'image_url': 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa8',
        'category_id': 8
    },
    {
        'name': 'Keychron K8 Pro',
        'description': 'Clavier mécanique sans fil 75%, QMK/VIA, hot-swap, rétroéclairage RGB, Mac/Windows, batterie 4000mAh.',
        'price': 109.99,
        'stock': 48,
        'image_url': 'https://images.unsplash.com/photo-1595225476474-87563907a213',
        'category_id': 8
    }
]

# Insertion en masse
for data in products_data:
    Product.objects.create(**data)
    print(f"Produit {data['name']} créé !")

print(f"{len(products_data)} produits insérés avec succès !")