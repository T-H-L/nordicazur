<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NordicAzur - Property Care & Concierge Services</title>
    <style>
        :root {
            --navy: #0e2a47;
            --blue: #1c75bc;
            --gold: #c5a059;
            --light-bg: #f8f9fa;
            --white: #ffffff;
            --text: #2c3e50;
            --gray: #6c757d;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            color: var(--text);
            background-color: var(--light-bg);
            line-height: 1.6;
        }

        /* Navigation & Header */
        header {
            background-color: var(--white);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            padding: 12px 0;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
            padding: 0 20px;
        }

        @media (min-width: 768px) {
            .nav-container {
                flex-direction: row;
                justify-content: space-between;
            }
        }

        .logo-wrapper svg {
            height: 85px;
            width: auto;
            display: block;
        }

        .lang-select-wrapper select {
            padding: 8px 14px;
            border-radius: 5px;
            border: 1px solid var(--gold);
            background-color: var(--white);
            color: var(--navy);
            font-weight: 600;
            cursor: pointer;
            outline: none;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(14, 42, 71, 0.85), rgba(14, 42, 71, 0.85)), url('https://images.unsplash.com/photo-1533105079780-92b9be482077?auto=format&fit=crop&w=1600&q=80') center/cover;
            color: var(--white);
            text-align: center;
            padding: 70px 20px;
        }

        .hero h1 {
            font-size: 2.2rem;
            margin-bottom: 15px;
            color: var(--white);
        }

        .hero p {
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto 30px auto;
            color: #e0e0e0;
        }

        .cta-btn {
            display: inline-block;
            background-color: var(--gold);
            color: var(--white);
            padding: 12px 30px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s;
        }

        .cta-btn:hover {
            background-color: #b08d48;
        }

        /* Layout & Cards */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 50px 20px;
        }

        .section-title {
            text-align: center;
            color: var(--navy);
            font-size: 2rem;
            margin-bottom: 35px;
            position: relative;
        }

        .section-title::after {
            content: '✦';
            display: block;
            color: var(--gold);
            font-size: 1.2rem;
            margin-top: 5px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .card {
            background: var(--white);
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border-top: 4px solid var(--gold);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card h3 {
            color: var(--navy);
            margin-bottom: 10px;
        }

        .card .price {
            font-size: 1.3rem;
            color: var(--blue);
            font-weight: bold;
            margin-bottom: 15px;
        }

        .card ul {
            list-style: none;
            margin-bottom: 15px;
        }

        .card ul li {
            padding: 5px 0;
            border-bottom: 1px solid #eee;
            font-size: 0.9rem;
        }

        .card ul li::before {
            content: "✓ ";
            color: var(--gold);
            font-weight: bold;
        }

        /* Coverage Zones */
        .zones {
            background-color: var(--white);
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        .zone-item {
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        /* Contact Box */
        .contact-box {
            background-color: var(--navy);
            color: var(--white);
            padding: 35px;
            border-radius: 8px;
            text-align: center;
        }

        .contact-box a {
            color: var(--gold);
            text-decoration: none;
            font-weight: bold;
        }

        .contact-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            margin-top: 20px;
            font-size: 1.05rem;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: var(--navy);
            color: var(--gray);
            font-size: 0.85rem;
            border-top: 1px solid rgba(255,255,255,0.1);
        }

        @media (max-width: 768px) {
            .hero h1 { font-size: 1.8rem; }
            .contact-details { flex-direction: column; gap: 10px; }
        }
    </style>
</head>
<body>

    <header>
        <div class="nav-container">
            <div class="logo-wrapper">
                <!-- NordicAzur Logo SVG -->
                <svg viewBox="0 0 500 450" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="310" cy="130" r="18" fill="#c5a059" />
                    <path d="M 160 215 A 130 130 0 0 1 355 160" fill="none" stroke="#c5a059" stroke-width="4" stroke-linecap="round" />
                    <path d="M 270 190 Q 330 165 380 195 L 380 215 L 270 215 Z" fill="#2980b9" opacity="0.6"/>
                    <path d="M 260 205 Q 310 195 380 205 Q 320 220 260 205 Z" fill="#1c75bc"/>
                    <polygon points="160,140 230,165 230,210 160,200" fill="#ffffff" stroke="#0e2a47" stroke-width="4"/>
                    <polygon points="230,165 265,180 265,220 230,210" fill="#ffffff" stroke="#0e2a47" stroke-width="4"/>
                    <polygon points="155,140 235,165 235,160 155,135" fill="#0e2a47"/>
                    <polygon points="230,165 270,180 270,175 230,160" fill="#0e2a47"/>
                    <rect x="180" y="165" width="12" height="22" fill="#0e2a47"/>
                    <rect x="203" y="165" width="12" height="22" fill="#0e2a47"/>
                    <path d="M 242 185 A 6 6 0 0 1 254 185 L 254 210 L 242 210 Z" fill="#0e2a47"/>
                    <path d="M 148 80 Q 130 140 133 200 L 163 200 Q 166 140 148 80 Z" fill="#0e2a47"/>
                    <path d="M 240 135 Q 235 180 238 205" stroke="#0e2a47" stroke-width="5" fill="none"/>
                    <path d="M 240 135 Q 200 120 185 130 M 240 135 Q 210 100 200 95 M 240 135 Q 250 95 265 95 M 240 135 Q 275 110 285 125" stroke="#0e2a47" stroke-width="4" fill="none"/>
                    <path d="M 115 220 Q 200 190 310 228 Q 230 250 115 220 Z" fill="#0e2a47"/>
                    <path d="M 150 230 Q 240 240 330 230 Q 240 255 150 230 Z" fill="#c5a059"/>
                    <text x="250" y="320" text-anchor="middle" font-family="'Georgia', serif" font-size="70" font-weight="bold" fill="#0e2a47">
                        Nordic<tspan fill="#1c75bc">Azur</tspan>
                    </text>
                    <line x1="40" y1="350" x2="220" y2="350" stroke="#c5a059" stroke-width="2"/>
                    <polygon points="250,338 253,347 262,350 253,353 250,362 247,353 238,350 247,347" fill="#c5a059"/>
                    <line x1="280" y1="350" x2="460" y2="350" stroke="#c5a059" stroke-width="2"/>
                    <text x="250" y="385" text-anchor="middle" font-family="sans-serif" font-size="15" font-weight="600" letter-spacing="3" fill="#0e2a47">
                        NORDIC PROPERTY CARE &amp; CONCIERGE SERVICES
                    </text>
                    <text x="250" y="410" text-anchor="middle" font-family="sans-serif" font-size="15" font-weight="600" letter-spacing="3" fill="#0e2a47">
                        ON THE FRENCH RIVIERA
                    </text>
                </svg>
            </div>
            <div class="lang-select-wrapper">
                <select id="languageSelector" onchange="changeLanguage(this.value)">
                    <option value="en" selected>English</option>
                    <option value="da">Dansk</option>
                    <option value="no">Norsk</option>
                    <option value="sv">Svenska</option>
                    <option value="fi">Suomi</option>
                    <option value="nl">Nederlands</option>
                    <option value="de">Deutsch</option>
                    <option value="es">Español</option>
                    <option value="pt">Português</option>
                    <option value="it">Italiano</option>
                    <option value="fr">Français</option>
                </select>
            </div>
        </div>
    </header>

    <section class="hero">
        <h1 id="hero-title">Nordic Property Care & Concierge Services</h1>
        <p id="hero-subtitle">Complete peace of mind for your secondary residence on the French Riviera. Premium inspection, keyholding, and personalized care in Vence and surroundings.</p>
        <a href="#contact" class="cta-btn" id="hero-cta">Contact Us</a>
    </section>

    <div class="container">
        <h2 class="section-title" id="services-title">Our Services</h2>
        <div class="grid">
            <!-- Essential -->
            <div class="card">
                <div>
                    <h3 id="plan1-title">Essential Inspection</h3>
                    <div class="price">€130 – €180 <span style="font-size: 0.85rem; font-weight: normal;">/ month</span></div>
                    <ul>
                        <li id="plan1-f1">2 physical inspections per month</li>
                        <li id="plan1-f2">Secure keyholding & perimeter check</li>
                        <li id="plan1-f3">Mail collection & urgent forwarding</li>
                        <li id="plan1-f4">Post-storm visual checks</li>
                        <li id="plan1-f5">Utility & meter reading check</li>
                        <li id="plan1-f6">Digital photo report after every visit</li>
                    </ul>
                </div>
            </div>

            <!-- Comfort -->
            <div class="card" style="border-top-color: var(--blue);">
                <div>
                    <h3 id="plan2-title">Comfort Home</h3>
                    <div class="price">€280 – €390 <span style="font-size: 0.85rem; font-weight: normal;">/ month</span></div>
                    <ul>
                        <li id="plan2-f1">4 inspections per month (weekly)</li>
                        <li id="plan2-f2">Includes all Essential features</li>
                        <li id="plan2-f3">Pre-arrival prep & post-departure lockdown</li>
                        <li id="plan2-f4">Contractor coordination (up to 2h/mo)</li>
                        <li id="plan2-f5">Patio setup & plant watering/irrigation check</li>
                        <li id="plan2-f6">Welcome grocery & pantry stocking</li>
                    </ul>
                </div>
            </div>

            <!-- Premium Rental Care -->
            <div class="card">
                <div>
                    <h3 id="plan3-title">Premium Rental Care</h3>
                    <div class="price">€200 <span style="font-size: 0.85rem; font-weight: normal;">/ mo base + turnover</span></div>
                    <ul>
                        <li id="plan3-f1">Keyholding & unlimited access handling</li>
                        <li id="plan3-f2">Pre-stay staging & post-stay inspection</li>
                        <li id="plan3-f3">Turnaround management (cleaning & linen)</li>
                        <li id="plan3-f4">24/7 guest helpline during active stays</li>
                        <li id="plan3-f5">€120 – €180 per guest turnaround</li>
                    </ul>
                </div>
            </div>

            <!-- À la Carte -->
            <div class="card" style="border-top-color: var(--blue);">
                <div>
                    <h3 id="plan4-title">À La Carte Concierge</h3>
                    <div class="price">€50 <span style="font-size: 0.85rem; font-weight: normal;">/ hour</span></div>
                    <ul>
                        <li id="plan4-f1">In-person guest check-in & check-out</li>
                        <li id="plan4-f2">Personalized grocery shopping</li>
                        <li id="plan4-f3">Artisan waiting & project oversight</li>
                        <li id="plan4-f4">Emergency call-outs (20:00–08:00 & Sun: €80-€90/h)</li>
                        <li id="plan4-f5">Welcome Baskets: €45 – €75</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="container" style="padding-top: 0;">
        <h2 class="section-title" id="coverage-title">Coverage Zones</h2>
        <div class="zones">
            <div class="zone-item">
                <strong style="color: var(--navy);" id="zone1-title">Zone 1 (Included in contracts):</strong>
                <span id="zone1-desc">Vence, Saint-Paul-de-Vence, Tourrettes-sur-Loup, Saint-Jeannet.</span>
            </div>
            <div class="zone-item">
                <strong style="color: var(--navy);" id="zone2-title">Zone 2 (€25 flat fee / visit):</strong>
                <span id="zone2-desc">Cagnes-sur-Mer, La Colle-sur-Loup, Carros, Roquefort-les-Pins.</span>
            </div>
            <div class="zone-item" style="border: none;">
                <strong style="color: var(--navy);" id="zone3-title">Zone 3 (€50 flat fee or €1.20/km):</strong>
                <span id="zone3-desc">Nice Airport/City Center, Antibes, Cannes, Mougins.</span>
            </div>
        </div>
    </div>

    <div class="container" id="contact">
        <div class="contact-box">
            <h2 id="contact-title" style="margin-bottom: 15px; color: var(--gold);">Get In Touch</h2>
            <p id="contact-sub">Based in Vence, serving international absentee owners across the French Riviera with multilingual precision.</p>
            <div class="contact-details">
                <div>📞 Phone: <a href="tel:+33672919159">+33 6 72 91 91 59</a></div>
                <div>✉️ Email: <a href="mailto:info@nordicazur.com">info@nordicazur.com</a> / <a href="mailto:thomas@nordicazur.com">thomas@nordicazur.com</a></div>
                <div>📍 Location: 120 Chemin Sainte Anne, 06140 Vence, France</div>
            </div>
        </div>
    </div>

    <footer>
        &copy; 2026 NordicAzur. All rights reserved.
    </footer>

    <script>
        const translations = {
            en: {
                heroTitle: "Nordic Property Care & Concierge Services",
                heroSub: "Complete peace of mind for your secondary residence on the French Riviera. Premium inspection, keyholding, and personalized care in Vence and surroundings.",
                heroCta: "Contact Us",
                servicesTitle: "Our Services",
                plan1Title: "Essential Inspection",
                plan1F1: "2 physical inspections per month",
                plan1F2: "Secure keyholding & perimeter check",
                plan1F3: "Mail collection & urgent forwarding",
                plan1F4: "Post-storm visual checks",
                plan1F5: "Utility & meter reading check",
                plan1F6: "Digital photo report after every visit",
                plan2Title: "Comfort Home",
                plan2F1: "4 inspections per month (weekly)",
                plan2F2: "Includes all Essential features",
                plan2F3: "Pre-arrival preparation & post-departure lockdown",
                plan2F4: "Contractor coordination (up to 2h/mo)",
                plan2F5: "Patio setup & plant watering/irrigation check",
                plan2F6: "Welcome grocery & pantry stocking",
                plan3Title: "Premium Rental Care",
                plan3F1: "Keyholding & unlimited access handling",
                plan3F2: "Pre-stay staging & post-stay inspection",
                plan3F3: "Turnaround management (cleaning & linen)",
                plan3F4: "24/7 guest helpline during active stays",
                plan3F5: "€120 – €180 per guest turnaround",
                plan4Title: "À La Carte Concierge",
                plan4F1: "In-person guest check-in & check-out",
                plan4F2: "Personalized grocery shopping",
                plan4F3: "Artisan waiting & project oversight",
                plan4F4: "Emergency call-outs (20:00–08:00 & Sun: €80-€90/h)",
                plan4F5: "Welcome Baskets: €45 – €75",
                coverageTitle: "Coverage Zones",
                zone1Title: "Zone 1 (Included in contracts):",
                zone1Desc: "Vence, Saint-Paul-de-Vence, Tourrettes-sur-Loup, Saint-Jeannet.",
                zone2Title: "Zone 2 (€25 flat fee / visit):",
                zone2Desc: "Cagnes-sur-Mer, La Colle-sur-Loup, Carros, Roquefort-les-Pins.",
                zone3Title: "Zone 3 (€50 flat fee or €1.20/km):",
                zone3Desc: "Nice Airport/City Center, Antibes, Cannes, Mougins.",
                contactTitle: "Get In Touch",
                contactSub: "Based in Vence, serving international absentee owners across the French Riviera with multilingual precision."
            },
            da: {
                heroTitle: "Nordisk Ejendomstilsyn & Concierge Service",
                heroSub: "Komplet tryghed for din bolig på Den Franske Riviera. Professionelt tilsyn, nøgleopbevaring og personlig service i Vence og omegn.",
                heroCta: "Kontakt Os",
                servicesTitle: "Vores Ydelser",
                plan1Title: "Basis Tilsyn",
                plan1F1: "2 fysiske tilsyn om måneden",
                plan1F2: "Sikker nøgleopbevaring & sikkerhedstjek",
                plan1F3: "Postindsamling og videreforsendelse",
                plan1F4: "Visuelt tjek efter storm/uvejr",
                plan1F5: "Aflæsning af forbrugsmålere",
                plan1F6: "Digital fotorapport efter hvert besøg",
                plan2Title: "Komfort Hjem",
                plan2F1: "4 tilsyn om måneden (ugentligt)",
                plan2F2: "Indeholder alt fra Basis Tilsyn",
                plan2F3: "Klargøring før ankomst & nedlukning efter afrejse",
                plan2F4: "Håndværkerkoordinering (op til 2 t/mdr)",
                plan2F5: "Klargøring af terrasse & vanding af planter",
                plan2F6: "Indkøb af velkomstproviant",
                plan3Title: "Premium Udlejningsservice",
                plan3F1: "Nøglehåndtering & ubegrænset adgang",
                plan3F2: "Klargøring før ophold & kontrol efter afrejse",
                plan3F3: "Styring af rengøring og linned",
                plan3F4: "24/7 gæstesupport under ophold",
                plan3F5: "€120 – €180 pr. gæsteskift",
                plan4Title: "À La Carte Concierge",
                plan4F1: "Personlig check-in & check-out af gæster",
                plan4F2: "Personlige indkøb og proviantering",
                plan4F3: "Ventetid og tilsyn med håndværkere",
                plan4F4: "Akkutte opkald (20:00–08:00 & søndage: €80-€90/t)",
                plan4F5: "Velkomstkurve: €45 – €75",
                coverageTitle: "Dækningsområder",
                zone1Title: "Zone 1 (Inkluderet i aftaler):",
                zone1Desc: "Vence, Saint-Paul-de-Vence, Tourrettes-sur-Loup, Saint-Jeannet.",
                zone2Title: "Zone 2 (€25 fast gebyr / besøg):",
                zone2Desc: "Cagnes-sur-Mer, La Colle-sur-Loup, Carros, Roquefort-les-Pins.",
                zone3Title: "Zone 3 (€50 fast gebyr eller €1,20/km):",
                zone3Desc: "Nice Lufthavn/Centrum, Antibes, Cannes, Mougins.",
                contactTitle: "Kontakt Os",
                contactSub: "Baseret i Vence, betjener internationale boligejere på Den Franske Riviera med flersproget præcision."
            },
            fr: {
                heroTitle: "Gestion Immobilière & Conciergerie Nordique",
                heroSub: "Sérénité totale pour votre résidence secondaire sur la Côte d'Azur. Inspection de qualité, garde de clés et services personnalisés à Vence et ses environs.",
                heroCta: "Contactez-nous",
                servicesTitle: "Nos Services",
                plan1Title: "Inspection Essentielle",
                plan1F1: "2 inspections physiques par mois",
                plan1F2: "Garde de clés sécurisée & contrôle du périmètre",
                plan1F3: "Relevé du courrier & réexpédition urgente",
                plan1F4: "Vérification visuelle après intempéries",
                plan1F5: "Relevé des compteurs d'eau et d'électricité",
                plan1F6: "Rapport photo numérique après chaque visite",
                plan2Title: "Maison Confort",
                plan2F1: "4 inspections par mois (hebdomadaire)",
                plan2F2: "Inclus toutes les prestations Essentielle",
                plan2F3: "Préparation avant arrivée & fermeture après départ",
                plan2F4: "Coordination des artisans (jusqu'à 2h/mois)",
                plan2F5: "Installation de la terrasse & arrosage des plantes",
                plan2F6: "Courses de bienvenue & garde-manger",
                plan3Title: "Gestion Locative Premium",
                plan3F1: "Garde de clés & gestion des accès illimitée",
                plan3F2: "Mise en place avant séjour & état des lieux de sortie",
                plan3F3: "Gestion du ménage et du linge",
                plan3F4: "Assistance 24/7 pour les clients",
                plan3F5: "120 € – 180 € par rotation de clients",
                plan4Title: "Conciergerie À La Carte",
                plan4F1: "Accueil physique & départ des voyageurs",
                plan4F2: "Achats personnalisés & approvisionnement",
                plan4F3: "Attente et suivi des interventions d'artisans",
                plan4F4: "Interventions d'urgence (20h-08h & dimanches: 80€-90€/h)",
                plan4F5: "Paniers d'accueil: 45 € – 75 €",
                coverageTitle: "Zones d'Intervention",
                zone1Title: "Zone 1 (Inclus dans les contrats):",
                zone1Desc: "Vence, Saint-Paul-de-Vence, Tourrettes-sur-Loup, Saint-Jeannet.",
                zone2Title: "Zone 2 (Forfait 25 € / visite):",
                zone2Desc: "Cagnes-sur-Mer, La Colle-sur-Loup, Carros, Roquefort-les-Pins.",
                zone3Title: "Zone 3 (Forfait 50 € ou 1,20 €/km):",
                zone3Desc: "Aéroport de Nice/Centre-ville, Antibes, Cannes, Mougins.",
                contactTitle: "Contactez-nous",
                contactSub: "Basé à Vence, au service des propriétaires internationaux sur la Côte d'Azur avec une précision multilingue."
            }
        };

        function changeLanguage(lang) {
            const data = translations[lang] || translations['en'];
            
            document.getElementById('hero-title').innerText = data.heroTitle;
            document.getElementById('hero-subtitle').innerText = data.heroSub;
            document.getElementById('hero-cta').innerText = data.heroCta;
            document.getElementById('services-title').innerText = data.servicesTitle;

            document.getElementById('plan1-title').innerText = data.plan1Title;
            document.getElementById('plan1-f1').innerText = data.plan1F1;
            document.getElementById('plan1-f2').innerText = data.plan1F2;
            document.getElementById('plan1-f3').innerText = data.plan1F3;
            document.getElementById('plan1-f4').innerText = data.plan1F4;
            document.getElementById('plan1-f5').innerText = data.plan1F5;
            document.getElementById('plan1-f6').innerText = data.plan1F6;

            document.getElementById('plan2-title').innerText = data.plan2Title;
            document.getElementById('plan2-f1').innerText = data.plan2F1;
            document.getElementById('plan2-f2').innerText = data.plan2F2;
            document.getElementById('plan2-f3').innerText = data.plan2F3;
            document.getElementById('plan2-f4').innerText = data.plan2F4;
            document.getElementById('plan2-f5').innerText = data.plan2F5;
            document.getElementById('plan2-f6').innerText = data.plan2F6;

            document.getElementById('plan3-title').innerText = data.plan3Title;
            document.getElementById('plan3-f1').innerText = data.plan3F1;
            document.getElementById('plan3-f2').innerText = data.plan3F2;
            document.getElementById('plan3-f3').innerText = data.plan3F3;
            document.getElementById('plan3-f4').innerText = data.plan3F4;
            document.getElementById('plan3-f5').innerText = data.plan3F5;

            document.getElementById('plan4-title').innerText = data.plan4Title;
            document.getElementById('plan4-f1').innerText = data.plan4F1;
            document.getElementById('plan4-f2').innerText = data.plan4F2;
            document.getElementById('plan4-f3').innerText = data.plan4F3;
            document.getElementById('plan4-f4').innerText = data.plan4F4;
            document.getElementById('plan4-f5').innerText = data.plan4F5;

            document.getElementById('coverage-title').innerText = data.coverageTitle;
            document.getElementById('zone1-title').innerText = data.zone1Title;
            document.getElementById('zone1-desc').innerText = data.zone1Desc;
            document.getElementById('zone2-title').innerText = data.zone2Title;
            document.getElementById('zone2-desc').innerText = data.zone2Desc;
            document.getElementById('zone3-title').innerText = data.zone3Title;
            document.getElementById('zone3-desc').innerText = data.zone3Desc;

            document.getElementById('contact-title').innerText = data.contactTitle;
            document.getElementById('contact-sub').innerText = data.contactSub;
        }
    </script>
</body>
</html>