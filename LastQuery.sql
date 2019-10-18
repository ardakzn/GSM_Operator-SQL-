use gsm
select top 1subscribers.sub_Name,subscribers.sub_Surname,subw_Login_Amount_Per_Month,Subscribers.sub_Phone_Number,Subscribers.sub_Identity_Documents_Number,Subscribers.sub_Country,sub_Abroad_Connection,t_Name from Subscribers 
 inner join Tariff on Tariff.t_ID=Subscribers.t_ID 
 inner join Sub_Web on Sub_Web.sub_ID=Subscribers.sub_ID order by subw_Login_Amount_Per_Month desc
