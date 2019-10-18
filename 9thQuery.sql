use gsm
select subscribers.sub_Name,subscribers.sub_Surname,Subscribers.sub_Phone_Number,Subscribers.sub_Identity_Documents_Number,Subscribers.sub_Country,sub_Abroad_Connection,b_Last_Discharge_Time,t_Name,b_Minutes,b_SMS,
((b_Minutes*t_Costs_Per_Minutes)+(b_Minutes*t_Costs_Per_SMS)) as TotalDebt from Subscribers 
inner join Bills on Subscribers.sub_ID=Bills.sub_ID 
inner join Tariff on Subscribers.t_ID=Tariff.t_ID