; ------------ LAURIS ----------------------------------------------------------------
#IfWinActive LAURIS 

s::ClickReturn(LaurisBefundansicht)
w::ClickReturn(LaurisAuftragserfassung)
e::ClickReturn(LaurisKumulativbefund)
q::ClickReturn(LaurisBefunduebersicht)
a::ClickReturn(LaurisNaechstAktuellerBefund)
+a::ClickReturn(LaurisAktuellereBefunde)
d::ClickReturn(LaurisNaechstAeltererBefund)
+d::ClickReturn(LaurisAeltereBefunde)
c::ClickReturn(LaurisKopieren)
v::ClickReturn(LaurisVerlaufsansicht)
Tab::
ClickReturn(LaurisDropdown)
Send {Down 3}
Send {Enter}
return