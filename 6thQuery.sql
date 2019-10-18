use gsm
select top 1subscribers.sub_Name,subscribers.sub_Surname,t_Name,b_Minutes,Subscribers.sub_Phone_Number,Subscribers.sub_Identity_Documents_Number,Subscribers.sub_Country,sub_Abroad_Connection,b_Last_Discharge_Time 
from Subscribers inner join Bills on Subscribers.sub_ID=Bills.sub_ID 
inner join Tariff on Tariff.t_ID=Subscribers.t_ID 
where b_Last_Discharge_Time between '2019-10-16' and '2019-11-16' order by b_Minutes desc 