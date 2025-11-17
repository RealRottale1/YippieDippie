1 -- 
Use boohbah_stand_link to properly connect tables.

2 --
The error is a logical one. While the output is correct it is merly a coincidence that the id's match. To fix this error use the boohbah_stand_link table

3 -- 
The select statement calls boobah_name. It just needs to call name	

4 -- 
The error is a result of both the boohbah and boohbahstandlink table having a boohbah_id. Because they share the same name and the code does not specify where boohbah_id is coming from the code is forced to error.

5 --
The inner query returns a single value (AVG), so the comparison is valid. The query correctly selects boohbahs with above-average energy.
6 --
The inner select function returns multiple data points however the outer select function does not accept more than one data point. To fix this we just add ANY which allows it to accept multiple data points.

7 --
CARTIESIAN JOIN!! It needs the boobah_stand_link to connect the tables. 

8 --
The code is trying to clump multiple functions togther. Specifically it is trying to run a comparision function while also running an average function. To fix the issue you just break the function into two functions having the average function be the inner function and the comparision function being the outer function.

9 --
The condition checks whether (boohbah_id, stand_id) appears as (stand_id, boohbah_id), which is almost never true unless the values are identical.

10 --
The code functions but is not logical. The stand_id is not guarentied to be unique thus an inner select function is required to

