begin
  for num in 1..100000 loop
    insert into test values (num, 'User'||num);
  end loop;
end;

/
