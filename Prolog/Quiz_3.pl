

hon_family(father,otosan).
hon_family(mother,okasan).
hon_family(older_brother,oniisan).
hon_family(older_sister,onesan).

hon(older_brother,chan).
hon(older_sister,chan).
hon(father,chan).
hon(mother,chan).
hon(older_brother,kun).
hon(older_sister,kun).
hon(father,kun).
hon(mother,kun).


hon(mr,san).
hon(ms,san).

%not understanding well th problem...

honorific(Ss,Name,Ss2,Name2,[]):-
    family(Ss,Name),
    keigo(Ss,Name2).

keigo(Ss,Name2):-
    hon(Ss,y),
    y \= Ss.






