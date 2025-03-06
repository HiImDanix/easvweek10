# Compulsory Assignment week 10 - Databases

During week 10 we were given an assignemnt to work and use state based and change-based approaches.
The first approach, the Change-based apprach is used on the branch called: feat/initial-schema-ef
* This approach has been handled with the Entity framework approach, where models are defined and migrations, generate the SQL scripts

The other approach is the state-based, that is used on the branch called: feat/initial-schema-state
* This approach has been handled by creating SQL-scripts, for each assignment.

In both of our approaches we decided to commit to non-destructive approach. The reason for that was mainly because we wanted safely preserve changed data, to have an easier revert and most importantly to minimze risk and downtime.

In the case of renaming the attribute Grade to FinalGrade, we used the "Rename column" to make sure the column containing the data would not be droped or deleted. If the application was larger, and we used state-based we would need to make sure the modes was also up-to-date with the database, but, if this was done "code first" like in the Change-based approach, we would know, the models were up to date allready.

In the case of changing the Credits in the Course table from int to Decimal(5,2) the non-destructive approach was also used.
* This could be a descructive change from the State-based approach, because if you change the datatype in the database, and not change the rest of the application to expect the new datatype, the system could break, but there would not be any data loss.
* Working in the Entity Framework, we would change the model first in the code, and then migrate the database to fit the model, and there would not be anything that would break. This is the most non-destructive approact for this usecase.
