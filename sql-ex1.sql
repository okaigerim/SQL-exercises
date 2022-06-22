--¬ыбрать книгу по математике котора€ наиболее попул€рна у читателей (максимальное число выдач за год)
select top 1 Theme.Name, Book.Name, count(*) as cnt from Theme
join Book on Book.Book_ID = Theme.BookID
join Lending on Lending.BookID = Book.Book_ID 
where Theme.Name = 'Math'
group by Theme.Name, Book.Name
order by cnt desc

--¬ыбрать читателей, ктоорые имеют задолженность более 10 дней
select Reader.Last_name, Book.Name, Lending.Exp_return_date, Lending.Real_return_date from Reader
join Lending on Lending.ReaderID = Reader.Reader_ID
join Book on Book.Book_ID = Lending.BookID
where DATEDIFF(day, Lending.Exp_return_date, Lending.Real_return_date) > 10

--ќпределить книгу котора€ была наиболее попул€рна зимой 2021 года
select Book.[Name], count(Book.Book_ID) c1 from Reader
join Lending on Lending.ReaderID = Reader.Reader_ID
join Book on Book.Book_ID = Lending.BookID
where (Lending.Exp_return_date between '20211201' and '20211231') or (Lending.Exp_return_date between '20210101' and '20210228')
group by Book.Name
order by c1 desc

--ќпределить читателей у которых на руках наход€тс€ книги издательства Ќаука
select Reader.Last_name, Book.Book_ID, Book.Name, Press.Name from Reader
join Lending on Lending.ReaderID = Reader.Reader_ID
join Book on Book.Book_ID = Lending.BookID
join Press on Book.Book_ID = Press.BookID
where Press.Name ='Science'

