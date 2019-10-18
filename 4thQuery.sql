use gsm
select op_Name,op_Region_Name,count(sub_ID) as Number_Of_Subs from Subscribers 
inner join Operators on Subscribers.op_ID=Operators.op_ID where op_Name 
like '%______ð%' and op_Offices='Branch'group by op_Name,Op_Region_Name having count(sub_ID)>1 order by op_Name asc   