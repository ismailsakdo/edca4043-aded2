
* Date and Time Wizard: onset2.
COMPUTE onset2=XDATE.MDAY(onset).
VARIABLE LABELS onset2 "Tarikh mengenai data dari onset yang diektrak kan kepada hari".
VARIABLE LEVEL onset2(NOMINAL).
FORMATS onset2(F8.0).
VARIABLE WIDTH onset2(8).
EXECUTE.

* Date and Time Wizard: minute.
COMPUTE minute=XDATE.MINUTE(time).
VARIABLE LABELS minute "Masa student meng key in data dalam Google Form".
VARIABLE LEVEL minute(SCALE).
FORMATS minute(F8.0).
VARIABLE WIDTH minute(8).
EXECUTE.

COMPUTE beza_masa=50-minute.
EXECUTE.

COMPUTE positive_beza=beza_masa*-1.
EXECUTE.

FREQUENCIES VARIABLES=positive_beza
  /STATISTICS=MINIMUM MAXIMUM MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

CREATE
  /daftar_1=DIFF(daftar 1).

RECODE positive_beza (Lowest thru 4=1) (4 thru Highest=2) INTO beza.cat.
EXECUTE.

FREQUENCIES VARIABLES=beza.cat
  /ORDER=ANALYSIS.

//
DATASET ACTIVATE DataSet0.
RECODE y1 (1=1) (2=0).
EXECUTE.

DATASET ACTIVATE DataSet0.
RECODE y2 (1=1) (2=0).
EXECUTE.

DATASET ACTIVATE DataSet0.
RECODE y3 (1=1) (2=0).
EXECUTE.

DATASET ACTIVATE DataSet0.
RECODE y4 (1=1) (2=0).
EXECUTE.

DATASET ACTIVATE DataSet0.
RECODE y5 (1=1) (2=0).
EXECUTE.

DATASET ACTIVATE DataSet0.
RECODE y6 (1=1) (2=0).
EXECUTE.

DATASET ACTIVATE DataSet3.
RECODE positive_beza (1 thru 4=1) (ELSE=2) INTO beza.cat.
EXECUTE.

DATASET ACTIVATE DataSet0.
COMPUTE scoreY=sum(y1,y2,y3,y4,y5,y6).
EXECUTE.
