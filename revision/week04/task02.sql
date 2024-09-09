--Напишете заявка, която извежда производител, модел и тип на продукт за тези производители, 
-- за които съответния продукт не се продава (няма го в таблиците PC, лаптоп или принтер).

use pc

select distinct maker, model, type
from product 
where model not in (
(select model from laptop)
union
(select model from printer)
union
(select model from pc)
)

select maker, product.model, type
from product left outer join 
((select model from laptop)
union
(select model from pc)
union
(select model from printer)) ct
on ct.model = product.model
where ct.model is NULL
