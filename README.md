# Alias and Script Collection

Questa raccolta di alias e funzioni bash è pensata per portare con sé, tramite un semplice clone, una serie di comandi utili che rendono l'ambiente Linux più familiare e produttivo, anche su computer non propri.


## Comandi e alias disponibili

### Alias

- **missing**: Esegue uno script custom `missing.sh` (percorso hardcoded, personalizzabile).
- **mini**: Avvia uno script bash per la mini-moulinette.
- **gg**: Compila con gcc e flag di warning e errori attivi.
- **francinette / paco**: Avvia lo script di test francinette.
- **grind**: Avvia valgrind con opzioni dettagliate per il debug della memoria.
- **grademe**: Esegue uno script remoto per la valutazione automatica.
- **la**: Mostra la directory corrente e la lista dettagliata dei file.
- **clip**: Copia lo standard input nella clipboard di sistema.
- **studio**: Avvia Android Studio da un percorso specifico.
- **map**: Apre una mappa testuale via telnet.
- **ship**: Stampa una nave ASCII art.
- **clipc**: Copia il contenuto di tutti i file `.c` nella clipboard.

### Funzioni

- **scout**: Usa `ranger` per navigare tra le cartelle e, all'uscita, cambia la directory corrente in quella selezionata.
- **srcmd**: Ricerca tra i comandi disponibili con `fzf` e mostra la man page selezionata.
- **srcfile**: Ricerca file nella directory corrente con `fzf`, mostra un'anteprima e si sposta nella cartella del file selezionato.
- **srcman**: Ricerca tra tutte le man page disponibili tramite `fzf` e mostra quella selezionata.
- **convert_segments**: Funzione di utilità per convertire segmenti numerici tra basi diverse (usata dalle funzioni seguenti).
- **itob**: Converte numeri decimali in binario (opzione `--full` per output a 8 bit per segmento).
- **btoi**: Converte numeri binari in decimale.
- **itoh**: Converte numeri decimali in esadecimale.
- **htoi**: Converte numeri esadecimali in decimale.
- **btoh**: Converte numeri binari in esadecimale.
- **htob**: Converte numeri esadecimali in binario.

### Handler custom

- **command_not_found_handler**: Si attiva quando il comando sconosciuto contiene "grazie"

---

