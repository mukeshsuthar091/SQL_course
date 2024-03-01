select su.id, country, age, sm.question, dr.question, ex.question
from survey su
join smoke sm on su.smoke=sm.id 
join drink dr on su.drink=dr.id
join exercise ex on su.exercise=ex.id
order by su.id