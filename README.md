"# mysql_uzduotis1" 
DUOMENŲ BAZĖ
 
Veržli ir nauja prekybos kompanija sukūrusi savo prekės ženklą, nuo metu pradžios prekiavo keletos grupių prekėmis, keliose skirtingose rinkose. Prekės surašytos lentelėje prekės, grupės ir rinkos lentelėje selektoriai. Prekes tiekdavo skirtingi tiekėjai (lentelė tiekėjai). Kiekvienas tiekėjas kartkartėmis prekę vis atnaujindavo. Tiekėjų prekėms iki atnaujinimo būdavo suteikiamas vienoks barkodas, po atnaujinimo kitoks( lentelė prekes_tiekejai). Nupirktos iš tiekėjų prekės sudėtos lentelėje prekes_gavimai. Lentelė prekes_pardavimai dėl programuotojų klaidos sudaryta klaidingai. id_prekes_gavimo teisngai nurodo tik pačią prekę, bet ne jos barkodą ar tiekėją

UŽDUOTYS

0.**** Teisingą būtu tas prekes išlaiduoti iš naujo (sudaryti naują prekes_pardavimai lentelę), kurioje prekės būtu išlaiduojamos pagal principą, kad parduodamos pirma tos, kurios pirmos ir buvo gautos. Jei buvo viršytas prekių kiekis rekėtu laikyti, kad tai neįvykdytas užsakymas. Tai būtu viena iš užduočių. 

Galima rinktis ir vieną ar kelias iš kitų užduočiu:

2. Sudaryti prekių balansą (barkodai ir tiekejai nesvarbu). 

    a) ** balanso lentelę pasirinktam mėnesiui, kuri atrodytu taip : 
        1.menuo 2.preke 3.prekiu grupe 4.rinka 5.kiekis gauta 6.suma gauta 7.kiekis parduota 8.suma parduota
        
    b) ** balanso lentelę pagal mėnesiui, kuri atrodytu taip : 
        1. menuo 2. prekiu grupe 3. rinka 4.kiekis gauta 5.suma gauta 6.kiekis parduota 7.suma parduota
    
    c***) a ir b kartu, vienoje lentelėje  
