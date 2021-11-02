# RENT-A-CAR
# Titlu proiect : Evidența autoturismelor într-o firmă de închirieri auto
Analiza, proiectarea și implementarea unei baze de date care să modeleze activitatea unei firme de închirieri auto. 

# Descrierea proiectului
    
    Informatiile de care avem nevoie sunt  legate de: mașinile pe care le deține firma, dotările care pot adăugate unei mașini, clienții, contractul de închiriere. 

    În prima parte vom avea nevoie de informațiile legate de mașinile pe care le deține firma: fiecare mașină este identificată printr-un id, are un număr de înmatriculare și fiecărei mașini îi corespunde o serie de detalii (marca, clasa, anul fabricației, tipul de carburant, culoarea, tipul transmisiei, consumul și tariful mașinii), date care sunt utile pentru un client atunci cand acesta dorește să aleagă o mașină. Unei mașini îi pot fi adăugate diferite dotări iar fiecare dotare este identificată printr-un id, are o denumire (scaun copil, gps, lanțuri zapadă) și un tarif. 
    
    În a doua parte ne vom ocupa de închirierea propriu-zisă. Pentru închiriere avem nevoie de informații referitoare la clienți și la contractul de închiriere. 
    Fiecare persoană care dorește să închirieze o mașină este identificată printr-un id, are o serie a actului de identitate care este unică, nume, prenume, data nașterii, data obținerii permisului de conducere. Pe lângă datele sale personale, mai este nevoie obligatoriu de un număr de telefon și opțional de o adresă de email pentru ca persoana respectivă să poată fi contactată. 

    După ce clientul s-a hotărât de ce mașină are nevoie următorul pas este contractul de închiriere care conține date referitoare la perioada de inchiriere (data la care se face închirierea și data la care se returnează mașina) precum si costul total, pe toată perioada pe care este închiriată mașina care este calculat în funcție de perioada de închiriere, de mașina aleasă și de dotările care sunt adăugate mașinii.
