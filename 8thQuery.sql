
CREATE LOGIN tgcnn WITH PASSWORD = '1234';
create user tgcn for login tgcnn;
use gsm
grant select to tgcn 
