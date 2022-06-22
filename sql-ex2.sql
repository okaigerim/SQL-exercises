
--����, �������� �����, ������� ��������, ���� �������� - ��� ���� � ������� ��������� ���� ��������, ���������� ���� ���������
select Theme.Name, Book.Name, Reader.Last_name, Lending.Real_return_date, DATEDIFF(DAY,Exp_return_date, Lending.Real_return_date) from Theme
join Book on Theme.BookID = Book.Book_ID
join Lending on Lending.BookID = Book.Book_ID
join Reader on Reader.Reader_ID = Lending.ReaderID

--��� ���������, ����� ��������, ���������� ����������� ����
select Reader.First_Name, Reader.Last_name, Reader.Passport_num,Lending.Lend_date, count(*) as cnt from Reader
join Lending on Lending.ReaderID = Reader.Reader_ID
group by Reader.First_Name, Reader.Last_name, Reader.Passport_num, Lending.Lend_date
order by cnt desc 

--��� ����� "Calculus" �������� ��� �� ��������� �� ��������� 3 ������
select Book.Name, Reader.Last_name, Reader.Passport_num, Book.Book_ID, Lending.Lend_date, Lending.Exp_return_date, Lending.Real_return_date from Reader
join Lending on Lending.ReaderID = Reader.Reader_ID
join Book on Book.Book_ID = Lending.BookID
where Book.Name = 'Calculus'

--��� ������� ������������ ���������� ���������� ���� � ���������� � ��������� ���������� �� �����
select Press.Name, count(*) as cnt from Press
join Book on Book.Book_ID = Press.BookID
join Lending on Lending.BookID = Book.Book_ID 
group by Press.Name
order by cnt desc

select Press.Name,Book.Name, count(*) as cnt from Press
join Book on Book.Book_ID = Press.BookID
join Lending on Lending.BookID = Book.Book_ID 
group by Press.Name,Book.Name
order by cnt desc


