#---Fonction qui compte le nombre d'élements pair d'un tableau---#
def count_even_elem(tab):
    '''
    pré: tab est un tableau d'entier
    post: retourne le nombre d'élements pair de ce tab (0 est un nombre pair)
    '''
    count = 0
    for i in range(len(tab)):
        if tab[i] % 2 == 0:
            count += 1
    return count


#---Quelques tests---#
tab1 = [0, 2, 4, 6, 8]
tab2 = [0, 2, 5, 6]
tab3 = [1, 3, 5, 7]
tab4 = []
tab5 = [-1, -2, 3, 4]

assert (count_even_elem(tab1) == 5)
assert (count_even_elem(tab2) == 3)
assert (count_even_elem(tab3) == 0)
assert (count_even_elem(tab4) == 0)
assert (count_even_elem(tab5) == 2)

#----------------------------------------------------------------#
