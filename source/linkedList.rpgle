ctl-opt dftactgrp(*NO) ACTGRP(*NEW)


            // This routine demonstrates how to pull multiple rows
            // into an Array and have one of the Columns from the row
            // also be an array of data. To illustrate, we're using
            // the SQL Tools AUTHUSER_LIST table function that
            // returns an array of Group Profiles for each user
            // That Table function is documented at this URL:
    // http://www.sqliquery.com/SQLTools/UDTFParmDoc.html?UDTF=ST_LISTAUS

            dcl-s x int(10);
            dcl-s u int(10);
            dcl-s i int(10);
            dcl-s g int(10);

            dcl-s usrprf char(10);
            dcl-s grpprf char(11) DIM(16) based(pGroups);

            dcl-ds USERS  Qualified Dim(100);
                 usrprf  char(10);
                 grpCount int(10);
                 grpprf  char(176);
            end-ds;

            exec sql set option COMMIT=*NONE, NAMING=*SYS, DATFMT=*ISO;

            *INLR = *ON;

            exec sql DECLARE A1 CURSOR FOR
                     select user_name,groups,group_list
                       from table(sqltools.authUser_list())
                       where GROUPS > 0;
            exec sql OPEN A1;

            dou (SQLSTATE >= '02000');
              exec SQL FETCH A1 FOR 100 ROWS into :Users;
              IF (SQLSTATE < '02000');
                EXEC SQL GET DIAGNOSTICS :U = ROW_COUNT;
                for x = 1 to u;
                  pGroups = %addr(users(x).grpPrf);
                  usrPrf = users(x).usrprf;
                  g      = users(x).grpCount;
                  snd-msg 'User ' + %trimR(UsrPrf) + 'is a member of Group(s):';
                  for i = 1 to g;
                    snd-msg ' ' + grpPrf(i);
                  endfor;
                endfor;
              endif;
            enddo;

            exec sql CLOSE A1;
          return;
