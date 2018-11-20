hobby(juan,kaggle).
hobby(luis,hack).
hobby(elena,tennis).
hobby(midori,videogame).
hobby(simon,sail).
hobby(simon,kaggle).
hobby(laura,hack).
hobby(hans,videogame).


movie(chuck_norris, ranger).
movie(chuck_norris,shrek).
movie(jacky_chan,dragon).
movie(jacky_chan,pareja_explosiva).
movie(bruce_lee,mortal).
movie(bruce_lee,shrek).

share(X,Y):-
    movies(X,Z),
    movies(Y,Z).

actor(chuck).
actor(jacky_chan).
actor(bruce_lee).

