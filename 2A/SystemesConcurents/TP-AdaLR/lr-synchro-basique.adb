with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Lecteurs concurrents, approche automate. Pas de politique d'accès.
package body LR.Synchro.Basique is
    
    function Nom_Strategie return String is
    begin
        return "Automate, lecteurs concurrents, sans politique d'accès";
    end Nom_Strategie;
    
    task LectRedTask is
        entry Demander_Lecture;
        entry Demander_Ecriture;
        entry Terminer_Lecture;
        entry Terminer_Ecriture;
    end LectRedTask;
    
    task body LectRedTask is
        type Etat is (Libre, Lecture, AttendreFinLectures, Ecriture, PrendreEcriture);
        
        nbLecteurs : integer := 0;
        redacteur : boolean := false;
        etatCourant : Etat := Libre;
    begin
        loop
            -- 1 -- Version "Automate"
            case etatCourant is
                when Libre =>
                    select
                        accept Demander_Ecriture;
                        etatCourant := Ecriture;
                    or
                        accept Demander_Lecture;
                        nbLecteurs := nbLecteurs + 1;
                        etatCourant := Lecture;
                    end select;
                when Lecture =>
                    select
                        accept Terminer_Lecture;
                        nbLecteurs := nbLecteurs - 1;
                        if Demander_Ecriture'count > 0 and nbLecteurs > 0 then
                            etatCourant := AttendreFinLectures;
                        elsif Demander_Ecriture'count > 0 then
                            etatCourant := PrendreEcriture;
                        elsif nbLecteurs = 0 then
                            etatCourant := Libre;
                        end if;
                    or
                        accept Demander_Lecture;
                        nbLecteurs := nbLecteurs + 1;
                        if Demander_Ecriture'count > 0 then
                            etatCourant := AttendreFinLectures;
                        end if;
                    end select;
                when AttendreFinLectures =>
                    accept Terminer_Lecture;
                    nbLecteurs := nbLecteurs - 1;
                    if nbLecteurs  = 0 then
                        etatCourant := PrendreEcriture;
                    end if;
                when Ecriture =>
                    accept Terminer_Ecriture;
                    if Demander_Ecriture'count > 0 then
                        etatCourant := PrendreEcriture;
                    else
                        etatCourant := Libre;
                    end if;
                when PrendreEcriture =>
                    accept Demander_Ecriture;
                    etatCourant := Ecriture;
            end case;
            -- 2 -- Version "Service"
            --select
            --    when nbLecteurs = 0 and not redacteur =>
            --        accept Demander_Ecriture do
            --            redacteur := true;
            --        end Demander_Ecriture;
            --or
            --    when not redacteur =>
            --        accept Demander_Lecture do
            --            nbLecteurs := nbLecteurs + 1;
            --        end Demander_Lecture;
            --or
            --    accept Terminer_Lecture do
            --        nbLecteurs := nbLecteurs - 1;
            --    end Terminer_Lecture;
            --or
            --    accept Terminer_Ecriture do
            --        redacteur := false;
            --    end Terminer_Ecriture;
            --end select;
        end loop;
    exception
        when Error: others =>
            Put_Line("**** LectRedTask: exception: " & Ada.Exceptions.Exception_Information(Error));
    end LectRedTask;

    procedure Demander_Lecture is
    begin
        LectRedTask.Demander_Lecture;
    end Demander_Lecture;

    procedure Demander_Ecriture is
    begin
        LectRedTask.Demander_Ecriture;
    end Demander_Ecriture;

    procedure Terminer_Lecture is
    begin
        LectRedTask.Terminer_Lecture;
    end Terminer_Lecture;

    procedure Terminer_Ecriture is
    begin
        LectRedTask.Terminer_Ecriture;
    end Terminer_Ecriture;

end LR.Synchro.Basique;
