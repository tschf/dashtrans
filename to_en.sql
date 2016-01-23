--Set up translation table

declare
    l_table_count NUMBER;
begin

    select count(1)
    into l_table_count
    from user_tables
    where table_name = 'WORD_TRANSLATION';

    if l_table_count = 0
    then

        execute immediate '
        create table word_translation(
            word_german varchar2(512),
            word_en varchar2(512)
        )';

    end if;

end;
/


--GDB DEFINITION
delete from word_translation;
load word_translation raw/GDB_DEFINITION.csv

begin

    for trnsl in (
        select *
        from word_translation
    )
    loop

        update GDB_DEFINITION
        set german_description = trnsl.word_en
        where german_description = trnsl.word_german;

    end loop;


end;
/

--GDB_GER_FS_ANIMAL_FARMING - SPECIES
delete from word_translation;
load word_translation raw/GDB_ANIMAL_FARMING_SPECIES.csv

begin

    for trnsl in (
        select *
        from word_translation
    )
    loop

        update GDB_GER_FS_ANIMAL_FARMING
        set species = trnsl.word_en
        where species = trnsl.word_german;

    end loop;


end;
/

--GDB_GER_FS_ANIMAL_FARMING - FEDERAL_STATE
delete from word_translation;
load word_translation raw/GDB_ANIMAL_FARMING_STATE.csv

begin

    for trnsl in (
        select *
        from word_translation
    )
    loop

        update GDB_GER_FS_ANIMAL_FARMING
        set FEDERAL_STATE = trnsl.word_en
        where FEDERAL_STATE = trnsl.word_german;

    end loop;


end;
/

--GDB_GER_FS_POPULATION_FUTURE - DEF
delete from word_translation;
load word_translation raw/GDB_POPULATION_FUTURE_DEF.csv

begin

    for trnsl in (
        select *
        from word_translation
    )
    loop

        update GDB_GER_FS_POPULATION_FUTURE
        set definition = trnsl.word_en
        where definition = trnsl.word_german;

    end loop;


end;
/

--GDB_GER_FS_POPULATION_FUTURE - GENDER
delete from word_translation;
load word_translation raw/GDB_POPULATION_FUTURE_GENDER.csv

begin

    for trnsl in (
        select *
        from word_translation
    )
    loop

        update GDB_GER_FS_POPULATION_FUTURE
        set population_by_gender = trnsl.word_en
        where population_by_gender = trnsl.word_german;

    end loop;


end;
/

exit
