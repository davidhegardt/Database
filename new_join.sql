SELECT count(betyg.kurskod),
betyg.portalid,student.förnamn,student.efternamn

FROM ladok.betyg INNER JOIN ladok.student

ON betyg.portalid = student.portalid

GROUP BY student.förnamn;