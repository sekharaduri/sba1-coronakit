select * from product;

update product set ProductId=1 where Cost=120

select * from product where ProductId=1

delete from product;

insert into product(ProductName, Description, Cost) values('sanitizer', 'useful', '100')
insert into product(ProductId, ProductName, Description, Cost) values('2', 'sanitizer', 'very helpful', '150')
insert into product(ProductId, ProductName, Description, Cost) values('3', 'medicine', 'very careful', '200')
insert into product(ProductId, ProductName, Description, Cost) values('4', 'oxymetter', 'very accurate', '170')
ALTER TABLE product ADD ProductId INT NOT NULL IDENTITY PRIMARY KEY

update product set ProductName='sanitizer11', Description='very useful11', Cost=107 where ProductId=2

ALTER TABLE product DROP column ProductId