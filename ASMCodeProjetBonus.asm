;---Les registres B et C sont utilisés---;
MOV B, [rb]
MOV C, [rc]
MOV D, tab
PUSH [len]      ;La longueur du tableau est placée sur la pile
PUSH parity     ;La fonction "parity" est placée sur la pile
CALL func       ;Appel à la function "func"
HLT

func: PUSH B    ;On sauvegarde les 2 registres B et C
      PUSH C
      PUSH 0    ;Accumulateur qui va stocker le nombre d'éléments pairs
      MOV C, 0  ;L'index i

loop: MOV B, D        ;On place dans B l'adresse du tableau D
      MOV D, [B]      ;On place dans D l'élement tab[i]
       
      MOV A, [SP+8]   ;On place dans A la fonction "parity"
      CALL A          ;On appelle "parity"

      CMP A, 0        ;On compare si tab[i] est pair
      JE not          ;Si impair -> on va à "not"
      
      ADD B, 2       ;Sinon, on se déplace d'un élemnt dans le tab
      MOV D, B       ;L'adresse du prochain élement se trouve dans D

      POP A          ;Puisque tab[i] est pair -> on récupère l'accumulateur
      ADD A, 1       ;On lui ajoute 1 car il y a 1 element pair
      PUSH A         ;On le remet sur la pile
      
suite: INC C                ;On continue la fonction -> i++
       CMP C, [SP+10]       ;i ==? len(tab) ?
       JNE loop             ;Si on est pas à la fin: recommencer la loop

fin: POP A        ;On récupère les valeurs
     POP C     
     POP B
     RET          ;On retourne à l'appel de la fonction (le résultat est dans A)

not: ADD B, 2     ;tab[i] est impair -> on n'ajoute rien à l'accumulateur,
     MOV D, B     ;et on se déplace au prochain élement de tab
     JMP suite    ;On se déplace à "suite"


;---Fonction parity---;
;Pré: D est un nombre positif (>= à 0)
;Post: retourne dans A la valeur 1 si D est pair et 0 sinon (impair)

parity: MOV A, D
        DIV 2
        MUL 2
        CMP A, D  ;Compare (D//2)*2 == D (si reste à la div alors D impair)
        JE even

        MOV A, 0
        RET

even: MOV A, 1
      RET

;---Variables---;
tab: DB 1
     DB 0
     DB 2
     DB 4
     DB 61

len: DB 5
rb: DB 0
rc: DB 0

