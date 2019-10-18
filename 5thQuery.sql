use gsm
select op_Region_Name,count(Operators.op_ID) as Number_of_Branches,COUNT(sub_ID) as Number_of_Subscribers 
from Operators left join Subscribers on Subscribers.op_ID=Operators.op_ID group by op_Region_Name